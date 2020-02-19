/*
Purpose:
	This file creates the logs for all of Wellmedows Hospital's supply-data. The tables below include a record of all requisitions of supplies,
	supplyers, and the inventories for the hospital's wards. Drugs are given a table of their own due to potential risks.

Work Log:
	Entry 0::
		2020-02-12	Nathan Langenfeld
	
    Entry 1::
		2020-02-14	Nathan Langenfeld
*/
DROP DATABASE wellmedows;
CREATE DATABASE wellmedows;
USE wellmedows;


CREATE TABLE IF NOT EXISTS Suppliers
(
	Supplier_Number		VARCHAR(10),
	Supplier_Name		VARCHAR(30),
    Supplier_Address	VARCHAR(50),
    Supplier_Phone		VARCHAR(12),
    Supplier_Fax		VARCHAR(12),
    PRIMARY KEY(Supplier_Number)
);


CREATE TABLE IF NOT EXISTS Item_Table
(
    Item_Number				VARCHAR(10)		NOT NULL,
	Item_Name				VARCHAR(60)		NOT NULL,
    Supplier_Number			VARCHAR(60)		NOT NULL,
    Drug_Number				VARCHAR(10),
    Item_Description		VARCHAR(300)	NOT NULL,
    Drug_Dosage				VARCHAR(20),
    Administration_Method	VARCHAR(50),
    Qty_Stock				DECIMAL(6, 6)	NOT NULL,
    Reorder_Level			DECIMAL(6, 6)	NOT NULL,
    PRIMARY KEY (Item_Number),
    FOREIGN KEY (Supplier_Number) REFERENCES Suppliers(Supplier_Number)
);

/* 
This table tracks the information pertaining to all of the possible items in the hospital's inventory.
*/



CREATE TABLE IF NOT EXISTS Requisions
(
	Requisition_Number		VARCHAR(10),
    Requisitioner			VARCHAR(60),
    Ward_Name				VARCHAR(60),
    Ward_Number				VARCHAR(5),
    Item_Number				VARCHAR(10),
    Item_Name				VARCHAR(60),
    Item_description		VARCHAR(240),
    Drug_Dosage				VARCHAR(20),
    Administration_Method	VARCHAR(120),
    Qty_Required			DECIMAL(6, 6)	UNIQUE,
    Price_Per_Unit			DECIMAL(6, 2)	NOT NULL	UNIQUE,
    PRIMARY KEY (Requisition_Number),
    FOREIGN KEY	(Item_Number) REFERENCES Item_Table(Item_Number)
);


CREATE TABLE IF NOT EXISTS Item_Order_Log
(
	Requisition_Number		VARCHAR(10)		NOT NULL,
	Item_Number				VARCHAR(10)		NOT NULL,		    
    Qty_Required			DECIMAL(6, 6)	NOT NULL,
    Price_Per_Unit			DECIMAL(6, 2)	NOT NULL,
    Total_Price				DECIMAL(20, 2),
    Supplier_Number			VARCHAR(10)		NOT NULL,
    Date_Orderd				DATETIME		NOT NULL,
    Expected_Arrival		DATETIME		NOT NULL,
	FOREIGN KEY(Requisition_Number) REFERENCES Requisions(Requisition_Number),
    PRIMARY KEY(Requisition_Number),
    FOREIGN KEY(Qty_Required) REFERENCES Requisions(Qty_Required),
    FOREIGN KEY(Price_Per_Unit) REFERENCES Requisions(Price_Per_Unit),
    FOREIGN KEY(Supplier_Number) REFERENCES Suppliers(Supplier_Number)
);


CREATE TABLE IF NOT EXISTS Item_Arival_Log
(
	Requisition_Number		VARCHAR(10)		NOT NULL,
	Item_Number				VARCHAR(10)		NOT NULL,		    
    Qty_Required			DECIMAL(6, 6)	NOT NULL,
    Price_Per_Unit			DECIMAL(6, 2)	NOT NULL,
    Total_Price				DECIMAL(20, 2),
    Supplier_Number			VARCHAR(10)		NOT NULL,
    Date_Orderd				DATETIME		NOT NULL,
    Arrival_Date			DATETIME,
    FOREIGN KEY(Requisition_Number) REFERENCES Requisions(Requisition_Number),
    PRIMARY KEY(Requisition_Number),
    FOREIGN KEY(Qty_Required) REFERENCES Requisions(Qty_Required),
    FOREIGN KEY(Price_Per_Unit) REFERENCES Requisions(Price_Per_Unit),
    FOREIGN KEY(Supplier_Number) REFERENCES Suppliers(Supplier_Number)
);