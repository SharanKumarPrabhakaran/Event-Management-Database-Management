--------------------------------------------------------------------------------
-- Stored Procedures 
--------------------------------------------------------------------------------

-- Stored Procedure 1: Procedure to update the status of an event
CREATE PROCEDURE UpdateEventStatus
    @EventID INT, -- The ID of the event to update
    @NewStatus VARCHAR(50) -- The new status to set
AS
BEGIN
    -- Update the status of the event
    UPDATE Event
    SET Event_Status = @NewStatus
    WHERE Event_ID = @EventID;
END;
GO

-- Execute the procedure to update the status of an event
EXEC UpdateEventStatus @EventID = 3, @NewStatus = 'Cancelled';
GO

-- Select all events from the Event table to verify the update
SELECT * FROM Event;
GO

----------------------------------------------------------------------------------

-- Stored Procedure 2: Procedure to retrieve details of an event
CREATE PROCEDURE GetEventDetails
    @EventID INT -- The ID of the event to get details for
AS
BEGIN
    -- Retrieve Organizer's Details
    SELECT o.Organizer_ID, o.Name, o.Description
    FROM Organizer o
    JOIN Event e ON o.Organizer_ID = e.Organizer_ID
    WHERE e.Event_ID = @EventID;

    -- Retrieve Sponsors Details
    SELECT s.Sponsor_ID, s.Name, s.Contact_email, s.Contact_phone
    FROM Sponsor s
    JOIN Event_Sponsor_Details esd ON s.Sponsor_ID = esd.Sponsor_ID
    WHERE esd.Event_ID = @EventID;

    -- Retrieve Speakers Details
    SELECT sp.Speakers_ID, sp.Full_Name, sp.Biography, sp.Expertise
    FROM Event_Speakers sp
    WHERE sp.Event_ID = @EventID;
END;
GO

-- Execute the procedure to get details of an event
EXEC GetEventDetails @EventID = 1;
GO

--------------------------------------------------------------------------------

-- Stored Procedure 3: Procedure to retrieve sessions by event category
CREATE PROCEDURE GetSessionsByEventCategory
    @CategoryID INT -- The ID of the event category to filter sessions by
AS
BEGIN
    -- Retrieve sessions details along with linked event details
    SELECT 
        E.Title AS EventTitle,
        SW.Title AS SessionTitle, 
        SW.Start_Time, 
        SW.End_Time, 
        SW.Description
    FROM Session_or_Workshop AS SW
    INNER JOIN Event AS E ON SW.Event_ID = E.Event_ID 
    WHERE E.Category_ID = @CategoryID 
    ORDER BY SW.Start_Time; 
END;
GO

-- Execute the procedure to get sessions by event category
EXEC GetSessionsByEventCategory @CategoryID = 1;
GO

--------------------------------------------------------------------------------
