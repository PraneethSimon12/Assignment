CREATE TABLE shippers (
    shipperId UUID PRIMARY KEY,
    shipperName VARCHAR(255) NOT NULL,
    contactNumber VARCHAR(15),
    email VARCHAR(255),
    address TEXT
);

CREATE TABLE loads (
    loadId UUID PRIMARY KEY,
    loadingPoint VARCHAR(255) NOT NULL,
    unloadingPoint VARCHAR(255) NOT NULL,
    productType VARCHAR(255) NOT NULL,
    truckType VARCHAR(255) NOT NULL,
    noOfTrucks INT NOT NULL,
    weight INT NOT NULL,
    comment TEXT,
    shipperId UUID REFERENCES shippers(shipperId),
    date DATE NOT NULL
);

INSERT INTO shippers (shipperId, shipperName, contactNumber, email, address)
VALUES ('<UUID>', 'ABC Logistics', '1234567890', 'abc@logistics.com', '123 Street, City, Country');

INSERT INTO loads (loadId, loadingPoint, unloadingPoint, productType, truckType, noOfTrucks, weight, comment, shipperId, date)
VALUES ('<UUID>', 'delhi', 'jaipur', 'chemicals', 'canter', 1, 100, '', '<shipper UUID>', '2024-07-01');

SELECT * FROM loads WHERE shipperId = '<shipper UUID>';

SELECT * FROM loads WHERE loadId = '<load UUID>';

SELECT * FROM shippers;

SELECT * FROM shippers WHERE shipperId = '<shipper UUID>';

UPDATE loads
SET loadingPoint = 'alwar', unloadingPoint = 'jaipur', productType = 'chemicals', truckType = 'canter', noOfTrucks = 1, weight = 100, comment = '', date = '2024-07-01'
WHERE loadId = '<load UUID>';

UPDATE shippers
SET shipperName = 'XYZ Logistics', contactNumber = '0987654321', email = 'xyz@logistics.com', address = '456 Avenue, City, Country'
WHERE shipperId = '<shipper UUID>';

DELETE FROM loads WHERE loadId = '<load UUID>';

DELETE FROM shippers WHERE shipperId = '<shipper UUID>';
