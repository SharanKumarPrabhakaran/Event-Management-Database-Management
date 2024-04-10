--------------------------------------------------------------------------------
-- User Defined Funcitons
--------------------------------------------------------------------------------

-- UDF 1: Computing Discounted Price
CREATE FUNCTION dbo.ComputeDiscountedPrice (@Price FLOAT, @DiscountRate FLOAT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @DiscountedPrice FLOAT;
    SET @DiscountedPrice = @Price - (@Price * @DiscountRate);
    RETURN @DiscountedPrice;
END;
GO

-- Adding computed column based on UDF to the Ticket table
ALTER TABLE Ticket
ADD DiscountedPrice AS dbo.ComputeDiscountedPrice(Price, 0.1); -- Assuming a 10% discount for demonstration purposes
GO

SELECT * FROM Ticket;
GO

--------------------------------------------------------------------------------

-- UDF 2: Checking Ticket Validity
CREATE FUNCTION dbo.CheckTicketValidity (@IssueDate DATE, @ValidUntil DATE)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @ValidityStatus VARCHAR(50);

    -- Check if current date is within validity period
    IF GETDATE() <= @ValidUntil
        SET @ValidityStatus = 'Valid';
    ELSE
        SET @ValidityStatus = 'Expired';

    RETURN @ValidityStatus;
END;
GO

-- Adding computed column based on UDF to the Ticket table
ALTER TABLE Ticket
ADD TicketValidityStatus AS dbo.CheckTicketValidity(Issue_Date, Valid_until);

SELECT * FROM Ticket;
GO

--------------------------------------------------------------------------------