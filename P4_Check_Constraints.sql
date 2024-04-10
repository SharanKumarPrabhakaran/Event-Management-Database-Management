--------------------------------------------------------------------------------
-- Table-level CHECK Constraints
--------------------------------------------------------------------------------

-- 1. Check Constraint on Event : Ensures that the event start date is before the end date.
ALTER TABLE Event
ADD CONSTRAINT CHK_Event_Dates CHECK (Start_Date < End_Date);
GO

SELECT * FROM Event;
GO

--------------------------------------------------------------------------------

-- 2. Check Constraint on Session_or_Workshop : Ensures that the session or workshop start time is before the end time.
ALTER TABLE Session_or_Workshop
ADD CONSTRAINT CHK_Session_Times CHECK (Start_Time < End_Time);
GO

--------------------------------------------------------------------------------

-- 3. Check Constraint on Ticket : Ensures that ticket prices are non-negative.
ALTER TABLE Ticket
ADD CONSTRAINT CHK_Ticket_Price CHECK (Price >= 0);
GO

--------------------------------------------------------------------------------

-- 4. Check Constraint on Feedback : Ensures that feedback ratings are between 1 and 5.
ALTER TABLE Feedback
ADD CONSTRAINT CHK_Feedback_Rating CHECK (Rating BETWEEN 1 AND 5);
GO

--------------------------------------------------------------------------------

-- 5. Check Constraint on Registration :  Ensures that the payment status is either 0 (not paid) or 1 (paid).
ALTER TABLE Registration
ADD CONSTRAINT CHK_Registration_PaymentStatus CHECK (Payment_Status IN (0, 1));
GO

--------------------------------------------------------------------------------