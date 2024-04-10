--------------------------------------------------------------------------------
-- Views 
--------------------------------------------------------------------------------

-- View 1 : Event Summary including Ratings View
CREATE VIEW Event_Summary AS
SELECT 
    e.Event_ID, e.Title, e.Start_Date, e.End_Date, v.Name AS Venue, v.City, v.State, COUNT(r.Registration_ID) AS Registrations,
    COALESCE(AVG(f.Rating), 0) AS Average_Rating, 
    CASE 
        WHEN COALESCE(AVG(f.Rating), 0) = 0 THEN 0
        ELSE DENSE_RANK() OVER (ORDER BY AVG(f.Rating) DESC) 
    END AS Ranking
FROM Event e
INNER JOIN Venue v ON e.Venue_ID = v.Venue_ID
LEFT JOIN Registration r ON e.Event_ID = r.Event_ID
LEFT JOIN Feedback f ON e.Event_ID = f.Event_ID
GROUP BY e.Event_ID, e.Title, e.Start_Date, e.End_Date, v.Name, v.City, v.State;
GO

SELECT * FROM Event_Summary;
GO

--------------------------------------------------------------------------------

-- View 2 : Sponsor Contribution Summary View
CREATE VIEW Sponsor_Contribution_Summary AS
SELECT 
    s.Name AS Sponsor_Name, 
    COUNT(esd.Event_ID) AS Events_Sponsored, 
    CONCAT('$', COALESCE(SUM(esd.Contribution_Level), 0)) AS Total_Contribution
FROM Sponsor s
LEFT JOIN Event_Sponsor_Details esd ON s.Sponsor_ID = esd.Sponsor_ID
GROUP BY s.Name;
GO

SELECT * FROM Sponsor_Contribution_Summary;
GO

--------------------------------------------------------------------------------

-- View 3 : Attendee Registration Summary View
CREATE VIEW Attendee_Registration_Summary AS
SELECT 
    a.Attendee_ID, 
    a.First_name, 
    a.Last_name, 
    COUNT(r.Registration_ID) AS Total_Registrations,
    STRING_AGG(e.Title, ', ') AS Registered_Events
FROM Attendee a
LEFT JOIN Registration r ON a.Attendee_ID = r.Attendee_ID
LEFT JOIN Event e ON r.Event_ID = e.Event_ID
GROUP BY a.Attendee_ID, a.First_name, a.Last_name;
GO

SELECT * FROM Attendee_Registration_Summary;
GO

--------------------------------------------------------------------------------

-- View 4 : Event Feedback Analysis View
CREATE VIEW Event_Feedback_Analysis AS
SELECT 
    e.Event_ID, 
    e.Title, 
    COUNT(f.Feedback_ID) AS Total_Feedback, 
    COALESCE(AVG(f.Rating), 0) AS Average_Rating,
    CASE 
        WHEN AVG(f.Rating) <= 2 THEN 'OK'
        WHEN AVG(f.Rating) <= 4 THEN 'GOOD'
        WHEN AVG(f.Rating) = 5 THEN 'Best'
    END AS Rating_Category,
    STRING_AGG(f.Comment, ', ') AS Feedback_Comments
FROM Event e
LEFT JOIN Feedback f ON e.Event_ID = f.Event_ID
GROUP BY e.Event_ID, e.Title;
GO

SELECT * FROM Event_Feedback_Analysis;
GO

--------------------------------------------------------------------------------

-- View 5 : Ticket Sales Analysis View
CREATE VIEW Ticket_Sales_Analysis AS
SELECT 
    e.Event_ID, 
    e.Title, 
    COUNT(t.Ticket_ID) AS Total_Tickets_Sold, 
    CONCAT('$', COALESCE(SUM(t.Discounted_Price), 0)) AS Total_Sales
FROM 
    Event e
LEFT JOIN 
    Registration r ON e.Event_ID = r.Event_ID
LEFT JOIN 
    Ticket t ON r.Registration_ID = t.Registration_ID
GROUP BY 
    e.Event_ID, 
    e.Title;
GO

SELECT * FROM Ticket_Sales_Analysis
GO
--------------------------------------------------------------------------------

-- View 6 : Speaker Engagement View
CREATE VIEW Speaker_Engagement AS
SELECT es.Event_ID, e.Title AS Event_Title, es.Full_Name AS Speaker_Name, COUNT(s.Session_ID) AS Sessions_Spoken
FROM Event_Speakers es
INNER JOIN Event e ON es.Event_ID = e.Event_ID
LEFT JOIN Session_or_Workshop s ON es.Event_ID = s.Event_ID
GROUP BY e.Title, es.Full_Name, es.Event_ID;
GO

SELECT * FROM Speaker_Engagement;
GO

--------------------------------------------------------------------------------

