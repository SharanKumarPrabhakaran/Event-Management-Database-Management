--------------------------------------------------------------------------------
-- DML Triggers
--------------------------------------------------------------------------------

-- Trigger 1 : Updates the Event_Status in Event table based on the start and end dates of the event
CREATE TRIGGER Update_Event_Status
ON Event
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Event_ID INT;
    DECLARE @Start_Date DATE;
    DECLARE @End_Date DATE;

    SELECT @Event_ID = Event_ID, @Start_Date = Start_Date, @End_Date = End_Date FROM inserted;

    IF @Start_Date <= GETDATE() AND GETDATE() <= @End_Date
    BEGIN
        UPDATE Event
        SET Event_Status = 'Ongoing'
        WHERE Event_ID = @Event_ID;
    END
    ELSE IF @Start_Date > GETDATE()
    BEGIN
        UPDATE Event
        SET Event_Status = 'Scheduled'
        WHERE Event_ID = @Event_ID;
    END
    ELSE
    BEGIN
        UPDATE Event
        SET Event_Status = 'Concluded'
        WHERE Event_ID = @Event_ID;
    END
END;
GO

INSERT INTO Event (Organizer_ID, Venue_ID, Category_ID, Title, Description, Start_Date, End_Date) VALUES
(1, 1, 1, 'Global Tech Symposium', 'A symposium showcasing cutting-edge technology innovations.', '2024-05-15', '2024-07-17');
GO
--------------------------------------------------------------------------------

-- Trigger 2 : Event Capacity Notification Trigger
CREATE TRIGGER Notify_Event_Capacity
ON Registration
INSTEAD OF INSERT
AS
BEGIN
    -- Temp table to hold EventID and its corresponding registrations count
    CREATE TABLE #EventRegistrations (EventID INT, RegistrationsCount INT);

    -- Populate temp table with counts of existing registrations for each event in the inserted batch
    INSERT INTO #EventRegistrations (EventID, RegistrationsCount)
    SELECT 
        i.Event_ID, 
        (SELECT COUNT(*) FROM Registration WHERE Event_ID = i.Event_ID) + COUNT(*)
    FROM 
        inserted i
    GROUP BY 
        i.Event_ID;

    -- Check if any of the events in the inserted batch exceed their venue capacities
    IF EXISTS (
        SELECT *
        FROM #EventRegistrations er
        JOIN Event e ON er.EventID = e.Event_ID
        JOIN Venue v ON e.Venue_ID = v.Venue_ID
        WHERE er.RegistrationsCount > v.Capacity
    )
    BEGIN
        RAISERROR ('Event Registration Full: The registration limit for one or more events has been reached.', 16, 1);
        RETURN;
    END

    -- If all are within capacity, proceed to insert
    INSERT INTO Registration (Event_ID, Attendee_ID, Registration_Date, Payment_Status)
    SELECT Event_ID, Attendee_ID, Registration_Date, Payment_Status
    FROM inserted;

    -- Clean up
    DROP TABLE #EventRegistrations;
END;
GO

INSERT INTO Registration (Event_ID, Attendee_ID, Registration_Date, Payment_Status, Price, Discount, Ticket_Type) 
VALUES (1, 1, '2024-09-01', 1, 1500, 0.10, 'VIP'); -- Assuming Payment_Status 1 indicates successful payment
GO

--------------------------------------------------------------------------------

-- Trigger 3 Create a Ticket only when the Payment status is '1'
CREATE TRIGGER InsertTicketOnPayment
ON Registration
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the payment status is 1 for the inserted registration
    IF EXISTS (SELECT 1 FROM inserted WHERE Payment_Status = 1)
    BEGIN
        -- Insert a corresponding ticket record for the registered attendee
        INSERT INTO Ticket (Registration_ID, Attendee_ID, Issue_Date, Valid_Until, Seat_Number, Price, Discounted_Price, Ticket_Type)
        SELECT i.Registration_ID, i.Attendee_ID, GETDATE() AS Issue_Date, DATEADD(MONTH, 1, GETDATE()) AS Valid_Until,
               CHAR(65 + ABS(CHECKSUM(NEWID())) % 3) + CAST(ABS(CHECKSUM(NEWID())) % 10 AS VARCHAR(2)) AS Seat_Number,
               i.Price AS Price, dbo.ComputeDiscountedPrice(Price, i.Discount) AS Discounted_Price, i.Ticket_Type AS Ticket_Type
        FROM inserted i
        WHERE i.Payment_Status = 1;
    END
    ELSE
    BEGIN
        -- Display message for unsuccessful registration due to payment status
        PRINT 'The Registration was unsuccessful for the event. Payment status is 0.';
    END;
END;

INSERT INTO Registration (Event_ID, Attendee_ID, Registration_Date, Payment_Status, Price, Discount, Ticket_Type) 
VALUES (1, 1, '2024-09-01', 1, 1500, 0.10, 'VIP'); -- Assuming Payment_Status 1 indicates successful payment
GO

SELECT * FROM Ticket;
GO

--------------------------------------------------------------------------------
