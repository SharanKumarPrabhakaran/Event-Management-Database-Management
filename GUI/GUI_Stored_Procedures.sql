-- GUI Procedures for CRUD operation
GO

--insert
CREATE PROCEDURE spInsertEvent
    @Organizer_ID INT,
    @Venue_ID INT,
    @Category_ID INT,
    @Title NVARCHAR(255),
    @Description NVARCHAR(255),
    @Start_Date DATE,
    @End_Date DATE,
    @Event_Status NVARCHAR(50)
AS
BEGIN
    INSERT INTO Event (Organizer_ID, Venue_ID, Category_ID, Title, Description, Start_Date, End_Date, Event_Status)
    VALUES (@Organizer_ID, @Venue_ID, @Category_ID, @Title, @Description, @Start_Date, @End_Date, @Event_Status)
END
GO
select * from event;
GO
--update

CREATE PROCEDURE spUpdateEvent
    @Event_ID INT,
    @Organizer_ID INT,
    @Venue_ID INT,
    @Category_ID INT,
    @Title NVARCHAR(255),
    @Description NVARCHAR(255),
    @Start_Date DATE,
    @End_Date DATE,
    @Event_Status NVARCHAR(50)
AS
BEGIN
    UPDATE Event
    SET Organizer_ID = @Organizer_ID,
        Venue_ID = @Venue_ID,
        Category_ID = @Category_ID,
        Title = @Title,
        Description = @Description,
        Start_Date = @Start_Date,
        End_Date = @End_Date,
        Event_Status = @Event_Status
    WHERE Event_ID = @Event_ID
END
--delete
GO
CREATE PROCEDURE spDeleteEvent
    @Event_ID INT
AS
BEGIN
    DELETE FROM Event
    WHERE Event_ID = @Event_ID
END
GO


--retrive
CREATE PROCEDURE spRetrieveEvents
AS
BEGIN
    SELECT Event_ID, Organizer_ID, Venue_ID, Category_ID, Title, Description, Start_Date, End_Date, Event_Status
    FROM Event
END
GO

--sp's for registration:
CREATE PROCEDURE spInsertRegistration (
    @EventID INT,
    @AttendeeID INT,
    @RegistrationDate DATE,
    @PaymentStatus BIT,
    @Price FLOAT,
    @Discount FLOAT,
    @TicketType VARCHAR(255)
)
AS
BEGIN
    INSERT INTO Registration (Event_ID, Attendee_ID, Registration_Date, Payment_Status, Price, Discount, Ticket_Type)
    VALUES (@EventID, @AttendeeID, @RegistrationDate, @PaymentStatus, @Price, @Discount, @TicketType)
END
GO

CREATE PROCEDURE spRetrieveRegistration
AS
BEGIN
    SELECT Registration_ID, Event_ID, Attendee_ID, Registration_Date, Payment_Status, Price, Discount, Ticket_Type
    FROM Registration
END
GO

CREATE PROCEDURE spUpdateRegistration (
    @RegistrationID INT,
    @EventID INT,
    @AttendeeID INT,
    @RegistrationDate DATE,
    @PaymentStatus BIT,
    @Price FLOAT,
    @Discount FLOAT,
    @TicketType VARCHAR(255)
)
AS
BEGIN
    UPDATE Registration
    SET Event_ID = @EventID,
        Attendee_ID = @AttendeeID,
        Registration_Date = @RegistrationDate,
        Payment_Status = @PaymentStatus,
        Price = @Price,
        Discount = @Discount,
        Ticket_Type = @TicketType
    WHERE Registration_ID = @RegistrationID
END
GO

CREATE PROCEDURE spDeleteRegistration (
    @RegistrationID INT
)
AS
BEGIN
    DELETE FROM Registration
    WHERE Registration_ID = @RegistrationID
END
GO

--organizers
CREATE PROCEDURE spInsertOrganizer
    @Name NVARCHAR(255),
    @Description VARCHAR(255),
    @Address VARCHAR(255),
    @Contact_Email VARCHAR(255),
    @Contact_Phone VARCHAR(20)
AS
BEGIN
    INSERT INTO Organizer (Name, Description, Address, Contact_Email, Contact_Phone)
    VALUES (@Name, @Description, @Address, @Contact_Email, @Contact_Phone);
END;
GO


CREATE PROCEDURE spRetrieveOrganizer
AS
BEGIN
    SELECT * FROM Organizer;
END;
GO

CREATE PROCEDURE spUpdateOrganizer
    @Organizer_ID INT,
    @Name NVARCHAR(255),
    @Description VARCHAR(255),
    @Address VARCHAR(255),
    @Contact_Email VARCHAR(255),
    @Contact_Phone VARCHAR(20)
AS
BEGIN
    UPDATE Organizer
    SET Name = @Name,
        Description = @Description,
        Address = @Address,
        Contact_Email = @Contact_Email,
        Contact_Phone = @Contact_Phone
    WHERE Organizer_ID = @Organizer_ID;
END;
GO

CREATE PROCEDURE spDeleteOrganizer
    @Organizer_ID INT
AS
BEGIN
    DELETE FROM Organizer
    WHERE Organizer_ID = @Organizer_ID;
END;

GO

--Venues
CREATE PROCEDURE spRetrieveVenue
AS
BEGIN
    SELECT * FROM Venue;
END;


GO

CREATE PROCEDURE spRetrieveVenueById
    @VenueId INT
AS
BEGIN
    SELECT * FROM Venue WHERE Venue_ID = @VenueId;
END;
 
GO

CREATE PROCEDURE spInsertVenue
    @Name NVARCHAR(255),
    @Address VARCHAR(255),
    @City VARCHAR(255),
    @State VARCHAR(255),
    @Capacity INT,
    @Amenities VARCHAR(255)
AS
BEGIN
    INSERT INTO Venue (Name, Address, City, State, Capacity, Amenities)
    VALUES (@Name, @Address, @City, @State, @Capacity, @Amenities);
END;


GO

CREATE PROCEDURE spUpdateVenue
    @VenueId INT,
    @Name NVARCHAR(255),
    @Address VARCHAR(255),
    @City VARCHAR(255),
    @State VARCHAR(255),
    @Capacity INT,
    @Amenities VARCHAR(255)
AS
BEGIN
    UPDATE Venue
    SET 
        Name = @Name,
        Address = @Address,
        City = @City,
        State = @State,
        Capacity = @Capacity,
        Amenities = @Amenities
    WHERE Venue_ID = @VenueId;
END;
GO
CREATE PROCEDURE spDeleteVenue
    @VenueId INT
AS
BEGIN
    DELETE FROM Venue
    WHERE Venue_ID = @VenueId;
END;
GO
