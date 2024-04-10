--------------------------------------------------------------------------------
-- NON-Clustered Index
--------------------------------------------------------------------------------

-- 1. Create a nonclustered index on Event table for Organizer_ID column
CREATE NONCLUSTERED INDEX idx_event_organizer_id ON Event (Organizer_ID);
SELECT * FROM Event WHERE Organizer_ID = 2;

--------------------------------------------------------------------------------

-- 2. Create a nonclustered index on Event table for Venue_ID column
CREATE NONCLUSTERED INDEX idx_event_venue_id ON Event (Venue_ID);
SELECT * FROM Event WHERE Venue_ID = 1;

--------------------------------------------------------------------------------

-- 3. Create a nonclustered index on Registration table for Event_ID column
CREATE NONCLUSTERED INDEX idx_registration_event_id ON Registration (Event_ID);
SELECT COUNT(*) AS Result FROM Registration WHERE Event_ID = 1;

--------------------------------------------------------------------------------