CREATE TABLE Clients(
   Id_Client COUNTER,
   last_name VARCHAR(50) NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   age INT NOT NULL,
   weight DECIMAL(15,2),
   email VARCHAR(255) NOT NULL,
   passeword VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_Client)
);

CREATE TABLE Coachs(
   Id_Coach COUNTER,
   last_name VARCHAR(50) NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   email VARCHAR(50),
   pseudo VARCHAR(50),
   passeword VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_Coach)
);

CREATE TABLE Messages(
   Id_Message COUNTER,
   Message TEXT NOT NULL,
   PRIMARY KEY(Id_Message)
);

CREATE TABLE Rates(
   Id_Rate COUNTER,
   free_ VARCHAR(50),
   premium VARCHAR(50),
   elite VARCHAR(50),
   PRIMARY KEY(Id_Rate)
);

CREATE TABLE Reports(
   Id_Report COUNTER,
   PRIMARY KEY(Id_Report)
);

CREATE TABLE Admins(
   Id_Admin COUNTER,
   email VARCHAR(255) NOT NULL,
   password VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_Admin)
);

CREATE TABLE take(
   Id_Coach INT,
   Id_Rate INT,
   PRIMARY KEY(Id_Coach, Id_Rate),
   FOREIGN KEY(Id_Coach) REFERENCES Coachs(Id_Coach),
   FOREIGN KEY(Id_Rate) REFERENCES Rates(Id_Rate)
);

CREATE TABLE write(
   Id_Coach INT,
   Id_Message INT,
   PRIMARY KEY(Id_Coach, Id_Message),
   FOREIGN KEY(Id_Coach) REFERENCES Coachs(Id_Coach),
   FOREIGN KEY(Id_Message) REFERENCES Messages(Id_Message)
);

CREATE TABLE send(
   Id_Client INT,
   Id_Message INT,
   PRIMARY KEY(Id_Client, Id_Message),
   FOREIGN KEY(Id_Client) REFERENCES Clients(Id_Client),
   FOREIGN KEY(Id_Message) REFERENCES Messages(Id_Message)
);

CREATE TABLE send_in(
   Id_Coach INT,
   Id_Report INT,
   PRIMARY KEY(Id_Coach, Id_Report),
   FOREIGN KEY(Id_Coach) REFERENCES Coachs(Id_Coach),
   FOREIGN KEY(Id_Report) REFERENCES Reports(Id_Report)
);

CREATE TABLE remit(
   Id_Client INT,
   Id_Report INT,
   PRIMARY KEY(Id_Client, Id_Report),
   FOREIGN KEY(Id_Client) REFERENCES Clients(Id_Client),
   FOREIGN KEY(Id_Report) REFERENCES Reports(Id_Report)
);

CREATE TABLE to_suspend(
   Id_Client INT,
   Id_Admin INT,
   PRIMARY KEY(Id_Client, Id_Admin),
   FOREIGN KEY(Id_Client) REFERENCES Clients(Id_Client),
   FOREIGN KEY(Id_Admin) REFERENCES Admins(Id_Admin)
);

CREATE TABLE ban(
   Id_Coach INT,
   Id_Admin INT,
   PRIMARY KEY(Id_Coach, Id_Admin),
   FOREIGN KEY(Id_Coach) REFERENCES Coachs(Id_Coach),
   FOREIGN KEY(Id_Admin) REFERENCES Admins(Id_Admin)
);

CREATE TABLE forward(
   Id_Report INT,
   Id_Admin INT,
   PRIMARY KEY(Id_Report, Id_Admin),
   FOREIGN KEY(Id_Report) REFERENCES Reports(Id_Report),
   FOREIGN KEY(Id_Admin) REFERENCES Admins(Id_Admin)
);
