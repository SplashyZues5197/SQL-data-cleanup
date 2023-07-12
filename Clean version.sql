-- Renaming columns
ALTER TABLE sql_practice
RENAME COLUMN `Segment>>` TO OrderId,
RENAME COLUMN Consumer TO First_class,
RENAME COLUMN MyUnknownColumn TO Same_Day,
RENAME COLUMN `MyUnknownColumn_[0]` TO Second_class,
RENAME COLUMN `MyUnknownColumn_[1]` TO Standard_class;

-- Adding and populating the 'segment' column
ALTER TABLE sql_practice
ADD COLUMN segment VARCHAR(25);

UPDATE sql_practice
SET segment = 'Consumer' WHERE `Consumer Total` != '';

UPDATE sql_practice
SET segment = 'Home Office' WHERE `Home Office Total` != '';

UPDATE sql_practice
SET segment = 'Corporate' WHERE `Corporate Total` != '';

-- Adding and updating the 'ship_mode' column
ALTER TABLE sql_practice
ADD COLUMN ship_mode VARCHAR(20);

UPDATE sql_practice
SET ship_mode = 'First Class' WHERE First_class != '' OR Corporate != '' OR `Home Office` != '';

UPDATE sql_practice
SET ship_mode = 'Same Day' WHERE Same_Day != '' OR `MyUnknownColumn_[2]` != '' OR `MyUnknownColumn_[5]` != '';

UPDATE sql_practice
SET ship_mode = 'Second class' WHERE Second_class != '' OR `MyUnknownColumn_[3]` != '' OR `MyUnknownColumn_[6]` != '';

UPDATE sql_practice
SET ship_mode = 'Standard Class' WHERE Standard_class != '' OR `MyUnknownColumn_[4]` != '' OR `MyUnknownColumn_[7]` != '';

-- Adding and populating the 'sales' column
ALTER TABLE sql_practice
ADD COLUMN sales DOUBLE(10, 3);

UPDATE sql_practice
SET sales = `Consumer Total` WHERE `Consumer Total` != '';

UPDATE sql_practice
SET sales = `Corporate Total` WHERE `Corporate Total` != '';

UPDATE sql_practice
SET sales = `Home Office Total` WHERE `Home Office Total` != '';

-- Ordering by 'segment'
SELECT * FROM sql_practice ORDER BY segment;

-- Dropping unnecessary columns
ALTER TABLE sql_practice
DROP COLUMN `First_class`,
DROP COLUMN `Same_Day`,
DROP COLUMN `Second_class`,
DROP COLUMN `Standard_class`,
DROP COLUMN `Consumer Total`,
DROP COLUMN `Corporate`,
DROP COLUMN `MyUnknownColumn_[2]`,
DROP COLUMN `MyUnknownColumn_[3]`,
DROP COLUMN `MyUnknownColumn_[4]`,
DROP COLUMN `Corporate Total`,
DROP COLUMN `Home Office`,
DROP COLUMN `MyUnknownColumn_[5]`,
DROP COLUMN `MyUnknownColumn_[6]`,
DROP COLUMN `MyUnknownColumn_[7]`,
DROP COLUMN `Home Office Total`;

-- Ordering by 'segment' after column removal
SELECT * FROM sql_practice ORDER BY segment;

-- Deleting rows with 'OrderId' equal to 'Order ID'
DELETE FROM sql_practice WHERE OrderId = 'Order ID';


SELECT * FROM sql_practice;