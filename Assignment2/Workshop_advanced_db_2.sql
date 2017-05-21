/*Instructions for executing successfully the script, please keep in mind the order, everything is carefully placed in the order it should be executed. Example, first execute types_of_vechicles 
and then vehicles. This is due to the foreign keys and avoid updating the tables so it all is rather smooth.*/


--Creating table type_of_vehicles.
CREATE TABLE type_of_vehicles(
id_type INTEGER NOT NULL,
description VARCHAR(50) NOT NULL, --COLOCAR TAMAÑO EN GRAFICA
CONSTRAINT PK_type_of_vehicles_id_type PRIMARY KEY(id_type)
)


--Creating table vehicles.
CREATE TABLE vehicles(
id_vehicle INTEGER NOT NULL,
registration_number INTEGER NOT NULL,
plate VARCHAR(10) NOT NULL,
status VARCHAR(15)NOT NULL,
mileage INTEGER NOT NULL,
model_Ve VARCHAR(5) NOT NULL,
id_type INTEGER NOT NULL,
value_Ve INTEGER NOT NULL, 
replacement_val INTEGER NOT NULL,
bought_date DATE NOT NULL,
tax_date DATE NOT NULL,
requires_qualification VARCHAR(5) NOT NULL,
CONSTRAINT PK_vehicles_id_vehicle PRIMARY KEY(id_vehicle),
CONSTRAINT FK_type_of_vehicles1 FOREIGN KEY (id_type) REFERENCES type_of_vehicles(id_type)
)


--Creating table qualification_per_driver.
CREATE TABLE qualification_per_driver(
id_driver INTEGER NOT NULL,
id_qualification INTEGER NOT NULL,
status VARCHAR(15) NOT NULL,
assignment_date DATE NOT NULL,
CONSTRAINT FK_qualifications FOREIGN KEY (id_qualification) REFERENCES driver_qualification(id_dq),
CONSTRAINT FK_driver FOREIGN KEY (id_driver) REFERENCES drivers(id_drivers)
)


--Creating table driver_qualification.
CREATE TABLE driver_qualification(
id_dq INTEGER NOT NULL,
description VARCHAR(30) NOT NULL,
CONSTRAINT PK_driver_qualification PRIMARY KEY(id_DQ)
)


--Creating table drivers.
CREATE TABLE drivers(
id_drivers INTEGER NOT NULL,
employee_name VARCHAR(100) NOT NULL,
CONSTRAINT PK_drivers_id_drivers PRIMARY KEY(id_drivers)
)


--Creating table drivers_vehicles.
CREATE TABLE drivers_vehicles(
id_DVehicles INTEGER NOT NULL,
id_v INTEGER NOT NULL,
CONSTRAINT FK_drivers_vehicles FOREIGN KEY (id_DVehicles) REFERENCES drivers(id_drivers),
CONSTRAINT FK_vehicles_id_vehicle FOREIGN KEY (id_v) REFERENCES vehicles(id_vehicle)
)


--Creating table service_details.
CREATE TABLE service_details(
id_service INTEGER NOT NULL,
id_vehicles INTEGER NOT NULL,
name_S VARCHAR(20) NOT NULL, 
description varchar(100) NOT NULL,
issue_date DATE NOT NULL,
status VARCHAR(15) NOT NULL,
CONSTRAINT PK_service_details PRIMARY KEY(id_service),
CONSTRAINT FK_vehicles FOREIGN KEY (id_vehicles) REFERENCES vehicles(id_vehicle)
)


--Creating table type_of_service.
CREATE TABLE type_of_service(
id_TService INTEGER NOT NULL,
description VARCHAR(100) NOT NULL,
CONSTRAINT PK_type_of_service PRIMARY KEY(id_TService)
)


--Creating table service.
CREATE TABLE service(
id_service INTEGER NOT NULL,
id_TService INTEGER NOT NULL,
CONSTRAINT PK_service FOREIGN KEY (id_service) REFERENCES service_details(id_service),
CONSTRAINT FK_type_of_service FOREIGN KEY (id_TService) REFERENCES type_of_service(id_TService)
)


--Creating table repair_costs.
CREATE TABLE repair_costs(
id_number INTEGER NOT NULL,
id_vehicles INTEGER NOT NULL,
repair_cost INTEGER NOT NULL,
date_repair DATE NOT NULL,
description VARCHAR(100) NOT NULL,
amount INTEGER NOT NULL,
status VARCHAR(10) NOT NULL,
CONSTRAINT PK_repair_costs PRIMARY KEY(id_number),
CONSTRAINT FK_vehicles_repair FOREIGN KEY (id_vehicles) REFERENCES vehicles(id_vehicle)
)


--Creating table insurance_claims.
CREATE TABLE insurance_claims(
id_numberClaims INTEGER NOT NULL,
id_vehiclesc INTEGER NOT NULL,
loss_date DATE NOT NULL,
date_of_issue DATE NOT NULL,
nature_of_payment VARCHAR(100) NOT NULL,
daamges VARCHAR(100) NOT NULL,
CONSTRAINT PK_insurance_claims PRIMARY KEY(id_numberClaims),
CONSTRAINT FK_vehicles_claims FOREIGN KEY (id_vehiclesc) REFERENCES vehicles(id_vehicle)
)


----------------------------------
--adding data to type of vehicle--
----------------------------------


CREATE SEQUENCE type_sequence 
  START WITH 1
  INCREMENT BY 1;

INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Moped');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Motorcycle');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Trike motorcycle,');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Car');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Light rigid heavy vehicle');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Medium rigid heavy vehicle,');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Heavy rigid vehicle');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Tractor');
INSERT INTO type_of_vehicles VALUES (type_sequence.nextval, 'Wheelchair vehicle');

--select * from TYPE_OF_VEHICLES;

--------------------------
--adding data to vehicle--
--------------------------


CREATE SEQUENCE vehicle_sequence 
  START WITH 1
  INCREMENT BY 1;

INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11101,'abc897','Active',1014,'2011',1,5000000,2000000,'12/10/2010','12/10/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11112,'ahu182','Active',1014,'2010',1,6050000,3000000,'20/12/2010','20/11/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11113,'ovu819','Active',1014,'2010',9,5000000,4500000,'15/09/2010','30/08/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11114,'uvj123','Active',1014,'2010',1,5000000,3000000,'10/08/2010','10/08/2011','no');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11115,'rbu839','Active',1014,'2011',6,5010000,4000000,'11/11/2011','12/10/2012','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11116,'ubo849','Active',1014,'2011',1,52000000,4000000,'10/10/2011','12/10/2012','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11117,'uab120','Active',1014,'2011',7,12000000,6000000,'02/11/2011','12/10/2012','no');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11118,'aub712','Active',1014,'2010',9,5000000,2500000,'08/03/2010','08/03/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11119,'obu049','Active',1014,'2011',9,50500000,25000000,'12/10/2011','12/10/2012','no');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11110,'aob819','Active',1014,'2010',8,5000000,4000000,'05/10/2010','06/10/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11111,'avi019','Active',1014,'2010',1,200000,100000,'27/03/2010','27/03/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11112,'apv129','Active',1014,'2011',7,7000000,35000000,'12/10/2011','12/10/2012','no');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11113,'vja129','Active',1014,'2010',6,1040000,2000000,'17/07/2010','17/08/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11114,'vub109','Active',1014,'2010',6,9060000,4500000,'01/10/2010','01/11/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11115,'aib938','Active',1014,'2011',4,6020000,3000000,'12/01/2011','12/01/2012','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11116,'kau058','Active',1014,'2010',3,5550000,2000000,'08/10/2010','12/10/2011','no');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11117,'buo948','Active',1014,'2010',5,6200000,3000000,'04/06/2010','10/07/2011','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11118,'vua839','Active',1014,'2011',1,7500000,3500000,'04/10/2011','07/10/2012','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11119,'vua890','Active',1014,'2011',3,80000000,4000000,'09/12/2011','09/10/2012','si');
INSERT INTO vehicles VALUES (vehicle_sequence.nextval,11120,'iao987','Active',1014,'2011',2,7014000,3500000,'08/07/2010','08/07/2011','no');

--select * from vehicles;

---------------------------
--adding data to services--
---------------------------
 
 
CREATE SEQUENCE typesservices_sequence 
  START WITH 1
  INCREMENT BY 1;

INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Automatic Transmission Fluid');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Battery and Cables');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Belts');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Brakes');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Cabin Air Filter');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Chassis Lubrication');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Dashboard Indicator Light On');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Coolant (Antifreeze)');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Engine Air Filter');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Engine Oil');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Exhaust');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Hoses');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Lights');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Power Steering Fluid');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Steering and Suspension');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Tire Inflation and Condition');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Wheel Alignment');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Windshield Washer Fluid');
INSERT INTO type_of_service VALUES (typesservices_sequence.nextval,'Wiper Blades');

--select * from type_of_service;

----------------------------
--adding data to insurance--
----------------------------
 
 
CREATE SEQUENCE insurance_sequence 
  START WITH 1
  INCREMENT BY 1;

INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,1,'16/12/2010','16/20/2010', 'credit card','the hood');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,1,'20/02/2011','21/02/2011', 'credit card','the hood, again');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,4,'14/02/2011','14/02/2011', 'credit card','blown wheel');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,4,'14/03/2011','15/03/2011', 'credit card','blown wheel, coincidence or plain laziness to write?');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,6,'10/10/2011','10/10/2011', 'credit card','leaving the car shop, the "amazing" driver crashed it... cursed luck');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,15,'20/10/2011','20/10/2011', 'credit card','broken windshield');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,15,'25/10/2011','25/10/2011', 'credit card','broken windshield, vandalism perhaps?');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,10,'05/10/2011','05/10/2011', 'credit card','celebrating a year free of accidents the driver crashed and broke down the engine');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,12,'13/10/2011','13/12/2011', 'credit card','little scratch that took months to notice');
INSERT INTO insurance_claims VALUES (insurance_sequence.nextval,13,'17/10/2011','18/10/2011', 'credit card','seat went out flying through the window');

--select * from insurance_claims;

---------------------------------
--adding data to service_details--
----------------------------------


CREATE SEQUENCE service_details_sequence
  START WITH 1
  INCREMENT BY 1;
  
INSERT INTO service_details_sequence VALUES (service_details_sequence.nextval,1, 'first check', 'checking the overall cables', sysdate, 'pending');
INSERT INTO service_details_sequence VALUES (service_details_sequence.nextval,3, 'routine', 'ran out of coolant', sysdate, 'pending'); 
INSERT INTO service_details_sequence VALUES (service_details_sequence.nextval,4, 'first check', 'cannot go out at night', sysdate, 'OK');
INSERT INTO service_details_sequence VALUES (service_details_sequence.nextval,10, 'overall check', 'broke lights', sysdate, 'needs repair');
INSERT INTO service_details_sequence VALUES (service_details_sequence.nextval,11, 'third check', 'flat tire', sysdate, 'pending');

--------------------------
--adding data to service--
---------------------------
  
  
INSERT INTO service_sequence VALUES (1, 2);
INSERT INTO service_sequence VALUES (2, 8);
INSERT INTO service_sequence VALUES (3, 13);
INSERT INTO service_sequence VALUES (4, 13);
INSERT INTO service_sequence VALUES (5, 16);
