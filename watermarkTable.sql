CREATE TABLE water_table
(
    last_load VARCHAR(1000)
)

------Initial run 
INSERT INTO water_table
VALUES('DT00000')           --------(SELECT MIN(Date_ID) FROM dbo.source_cars_data)

-----Increment run(update last_load with current_load....by using store procedure)
CREATE PROCEDURE UpdateWatermarkTable
  @ladtload VARCHAR(1000)
AS 
BEGIN
  BEGIN TRANSACTIONS
  UPDATE water_table
  SET last_load = @lastload
  COMMIT TRANSACTIONS
END;
