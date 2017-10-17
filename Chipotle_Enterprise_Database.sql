CREATE DATABASE Chipotle_Enterprise_Database;
GO

USE Chipotle_Enterprise_Database;
GO

CREATE TABLE Empolyee(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  StoreID bigint NOT NULL,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Title varchar (50) NOT NULL,
  Age bigint NOT NULL,
  Gender varchar (50) NOT NULL,
  Address varchar (50) NOT NULL,
  Email varchar (50) NOT NULL,
  PhoneNumber bigint NOT NULL,
  StartDate Date NOT NULL);

  CREATE TABLE Store(
  StoreID bigint NOT NULL PRIMARY KEY,
  TerritoryID bigint NOT NULL,
  StoreType varchar (50) NOT NULL,
  AddressLine1 varchar (50) NOT NULL,
  AddressLine2 varchar (50) NOT NULL,
  ZipCode bigint NOT NULL);

  CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Address varchar (50) NOT NULL,
  Email varchar (50) NOT NULL,
  PhoneNumber bigint NOT NULL,
  ModifiedDate Date NOT NULL);

  CREATE TABLE Territory(
  TerritoryID bigint NOT NULL PRIMARY KEY,
  City varchar(50) NOT NULL,
  State varchar(50) NOT NULL,
  Country varchar NOT NULL,
  CityRegionCode bigint NOT NULL,
  StateRegionCode bigint NOT NULL,
  CountryRegionCode bigint NOT NULL);

CREATE TABLE Supplier(
  SupplierID bigint NOT NULL PRIMARY KEY,
  SupplierName varchar(50) NOT NULL,
  Address varchar(50) NOT NULL,
  TerritoryID bigint NOT NULL);

CREATE TABLE Ingredient(
  IngredientID bigint NOT NULL PRIMARY KEY,
  SupplierID bigint NOT NULL,
  IngredientName varchar(50) NOT NULL,
  UnitCostPerQuantity float NOT NULL);

  CREATE TABLE Orders(
  OrderID bigint NOT NULL PRIMARY KEY,
  CustomerID bigint NOT NULL,
  OrderDate date NOT NULL,
  Quantity bigint NOT NULL,
  TotalDue float NOT NULL);

CREATE TABLE OrderLine(
   OrderLineID bigint NOT NULL PRIMARY KEY,
   OrderID bigint NOT NULL,
    ProductID bigint NOT NULL,
   OrderQuantity bigint NOT NULL,
   LineTotal float NOT NULL,);

CREATE TABLE Product(
   ProductID bigint NOT NULL PRIMARY KEY,
   ProductName varchar(50) NOT NULL,
   UnitPrice float NOT NULL,
   Portion varchar(50) NOT NULL);

ALTER TABLE Ingredient ADD CONSTRAINT FK_Ingredient_Supplier 
FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID);
GO

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Store 
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);
GO

ALTER TABLE Order ADD CONSTRAINT FK_Order_Customer 
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);
GO

ALTER TABLE Supplier ADD CONSTRAINT FK_Territory_Supplier 
FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID);
GO