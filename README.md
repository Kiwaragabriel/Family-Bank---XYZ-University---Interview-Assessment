This project allows for real time transmission of Tuition Fees Payment notifications from Family Bank to XYZ University system. Payments are pushed by Family Bank and are posted to the XYZ University financial system.
Setup Instructions


1.	Go to the Database folder
2.	Download the database backup i.e. XYZ_University_14102024.rar - (231KB)
3.	Extract and restore on your machine
4.	Clone the repository
5.	Open the solution in Visual Studio (2019 or later recommended)
6.	Restore NuGet packages
7.	Update the connection string in `Web.config` to connect to the new instance where you’ve restored the backup
8.	Open Package Manager Console and run `Update-Database` to create the database and apply migrations
9.	Build and run the project


API Endpoints

- `GET /Student/Verify?RegistrationNo={RegistrationNo}`: Validates student details
- `POST / Payment/Notification`: Receives payment notifications

Testing

Use Postman or a similar tool to test the API endpoints.
For authentication purposes, please use the headers below for each endpoint
Headers: 
APIUserName:Family_Bank_KE
APIKey:a3EYeycOL0Blqy
AccessToken:4ea5fe057a34cdc29a17281dd4e0ef70

For the student validation endpoint, use a valid student Registration Number.
E.g.
https://localhost:44308/Student/Verify?RegistrationNo=CSC00001

For the payment notification endpoint, send a POST request with a JSON body containing payment details.

E.g
https://localhost:44308/Payment/Notification
```json
{
  "RegistrationNo": "CIT00001",
  "TransactionNo": "TRXN_20240708_22319023",
  "PaymentDate": "2024-10-14T00:00:00",
  "PaymentAmount": 3900.00,
  "PaymentMethod": "Over The Counter",
  "PaidBy": "Hassan B",
  "Remarks": ""
}
