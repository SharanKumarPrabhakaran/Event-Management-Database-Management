--------------------------------------------------------------------------------
-- Create Database and Schema
--------------------------------------------------------------------------------

-- Create a new database named EventManagement
CREATE DATABASE EventManagement;
GO

-- Switch to the newly created EventManagement database
USE EventManagement;
GO

--------------------------------------------------------------------------------

-- Create Organizer table to store information about event organizers
CREATE TABLE Organizer (
    Organizer_ID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for organizers
    Name NVARCHAR(255), -- Name of the organizer
    Description VARCHAR(255), -- Description of the organizer
    Address VARCHAR(255), -- Address of the organizer
    Contact_Email VARCHAR(255), -- Email contact of the organizer
    Contact_Phone VARCHAR(20) -- Phone contact of the organizer
);
GO

--------------------------------------------------------------------------------

-- Create Venue table to store information about event venues
CREATE TABLE Venue (
    Venue_ID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for venues
    Name NVARCHAR(255) NOT NULL, -- Name of the venue
    Address VARCHAR(255) NOT NULL, -- Address of the venue
    City VARCHAR(255) NOT NULL, -- City where the venue is located
    State VARCHAR(255) NOT NULL, -- State where the venue is located
    Capacity INT, -- Capacity of the venue
    Amenities VARCHAR(255) -- Amenities available at the venue
);
GO

--------------------------------------------------------------------------------

-- Create Sponsor table to store information about event sponsors
CREATE TABLE Sponsor (
    Sponsor_ID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for sponsors
    Name NVARCHAR(255) NOT NULL, -- Name of the sponsor
    Contact_Email VARCHAR(255), -- Email contact of the sponsor
    Contact_Phone VARCHAR(20) -- Phone contact of the sponsor
);
GO

--------------------------------------------------------------------------------

-- Create Event_Category table to categorize different types of events
CREATE TABLE Event_Category (
    Category_ID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for event categories
    Category_Name VARCHAR(255) NOT NULL -- Name of the event category
);
GO

--------------------------------------------------------------------------------

-- Create Event Table to store information about events
CREATE TABLE Event (
    Event_ID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for events
    Organizer_ID INT, -- Identifier for the organizer of the event
    Venue_ID INT, -- Identifier for the venue of the event
    Category_ID INT, -- Identifier for the category of the event
    Title VARCHAR(255) NOT NULL, -- Title of the event
    Description VARCHAR(255), -- Description of the event
    Start_Date DATE, -- Start date of the event
    End_Date DATE, -- End date of the event
    Event_Status VARCHAR(50), -- Status of the event
    FOREIGN KEY (Organizer_ID) REFERENCES Organizer(Organizer_ID), -- Foreign key constraint referencing Organizer table
    FOREIGN KEY (Venue_ID) REFERENCES Venue(Venue_ID), -- Foreign key constraint referencing Venue table
    FOREIGN KEY (Category_ID) REFERENCES Event_Category(Category_ID) -- Foreign key constraint referencing Event_Category table
);
GO

--------------------------------------------------------------------------------

-- Create Event_Speakers table to store information about event speakers
CREATE TABLE Event_Speakers (
    Speakers_ID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for speakers
    Event_ID INT, -- Identifier for the event the speaker is associated with
    Full_Name NVARCHAR(255) NOT NULL, -- Full name of the speaker
    Biography VARCHAR(255), -- Biography of the speaker
    Expertise VARCHAR(255), -- Expertise of the speaker
    Contact_Email VARCHAR(255), -- Email contact of the speaker
    Contact_Phone VARCHAR(20), -- Phone contact of the speaker
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID) -- Foreign key constraint referencing Event table
);
GO

--------------------------------------------------------------------------------

-- Create Session_or_Workshop table to store information about event sessions or workshops
CREATE TABLE Session_or_Workshop (
    Session_ID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for sessions or workshops
    Event_ID INT, -- Identifier for the event the session or workshop belongs to
    Title VARCHAR(255) NOT NULL, -- Title of the session or workshop
    Start_Time TIME, -- Start time of the session or workshop
    End_Time TIME, -- End time of the session or workshop
    Description VARCHAR(255), -- Description of the session or workshop
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID) -- Foreign key constraint referencing Event table
);
GO

--------------------------------------------------------------------------------

-- Create Event_Sponsor_Details table to store details of event sponsorship
CREATE TABLE Event_Sponsor_Details (
    HISTORY_ID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for sponsor details
    Event_ID INT, -- Identifier for the event associated with the sponsorship
    Sponsor_ID INT, -- Identifier for the sponsor
    Contribution_Level INT, -- Level of contribution by the sponsor
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID), -- Foreign key constraint referencing Event table
    FOREIGN KEY (Sponsor_ID) REFERENCES Sponsor(Sponsor_ID) -- Foreign key constraint referencing Sponsor table
);
GO

--------------------------------------------------------------------------------

-- Create Attendee table to store information about event attendees
CREATE TABLE Attendee (
    Attendee_ID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for attendees
    First_Name NVARCHAR(255) NOT NULL, -- First name of the attendee
    Last_Name NVARCHAR(255) NOT NULL, -- Last name of the attendee
    Contact_Email VARCHAR(255), -- Email contact of the attendee
    Contact_Phone VARCHAR(20) -- Phone contact of the attendee
);
GO

--------------------------------------------------------------------------------

-- Create Registration table to store registration details for events
CREATE TABLE Registration (
    Registration_ID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for registrations
    Event_ID INT, -- Identifier for the event the registration is for
    Attendee_ID INT, -- Identifier for the attendee who registered
    Registration_Date DATE, -- Date of registration
    Payment_Status BIT, -- Status of payment for the registration
    Price FLOAT, -- Price of the ticket
    Discount FLOAT DEFAULT 0.00, 
    Ticket_Type VARCHAR(255), -- Type of the ticket
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID), -- Foreign key constraint referencing Event table
    FOREIGN KEY (Attendee_ID) REFERENCES Attendee(Attendee_ID) -- Foreign key constraint referencing Attendee table
);
GO

--------------------------------------------------------------------------------

-- Create Ticket table to store information about event tickets
CREATE TABLE Ticket (
    Ticket_ID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for tickets
    Registration_ID INT, -- Identifier for the registration associated with the ticket
    Attendee_ID INT, -- Identifier for the attendee associated with the ticket
    Issue_Date DATE, -- Date when the ticket was issued
    Valid_Until DATE, -- Expiry date of the ticket
    Seat_Number VARCHAR(255), -- Seat number associated with the ticket
    Price FLOAT, -- Price of the ticket
    Discounted_Price FLOAT, -- Discounted Price of the ticket
    Ticket_Type VARCHAR(255), -- Type of the ticket
    FOREIGN KEY (Registration_ID) REFERENCES Registration(Registration_ID), -- Foreign key constraint referencing Registration table
    FOREIGN KEY (Attendee_ID) REFERENCES Attendee(Attendee_ID) -- Foreign key constraint referencing Attendee table
);
GO

--------------------------------------------------------------------------------

-- Create Feedback table to store feedback provided by event attendees
CREATE TABLE Feedback (
    Feedback_ID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for feedback
    Event_ID INT, -- Identifier for the event the feedback is about
    Attendee_ID INT, -- Identifier for the attendee who provided the feedback
    Comment VARCHAR(255), -- Feedback comment
    Rating INT, -- Rating provided by the attendee
    Submission_Date DATE, -- Date when the feedback was submitted
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID), -- Foreign key constraint referencing Event table
    FOREIGN KEY (Attendee_ID) REFERENCES Attendee(Attendee_ID) -- Foreign key constraint referencing Attendee table
);
GO

--------------------------------------------------------------------------------