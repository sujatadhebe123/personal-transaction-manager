![debit](https://github.com/user-attachments/assets/1dee0db8-734d-48b5-ad36-744d4022ebe1)![dash](https://github.com/user-attachments/assets/94eb0a38-fd30-41ab-ba7b-e9b235a7bbd1)# personal-transaction-manager
A personal finance tracker built with JSP, JDBC, and PostgreSQL.
# 💰 Personal Transaction Manager App
A simple and elegant web-based application for managing your personal financial transactions, such as credits and debits. Built using **JSP**, **JDBC**, and **PostgreSQL**. Users can register, log in using a mobile number, track transactions, and view summaries in a clean dashboard UI.
## 🛠️ Technologies Used

- **Frontend**: HTML5, CSS3, JSP
- **Backend**: Java (JSP/Servlets), JDBC
- **Database**: PostgreSQL
- **IDE**: Eclipse
- **Web Server**: Apache Tomcat

## ✨ Features

- 🔐 **User Registration & Login**
- 📥 **Add Credit Transactions**
- 📤 **Add Debit Transactions**
- 📊 **Transaction History Table**
- 💵 **Opening Balance Tracking**
- 📆 **Date-wise transaction entries**
- 🔁 **Session-based User Authentication**
- 📱 **Mobile Number Login**
- /project-root
│
├── login.jsp
├── register.jsp
├── dashboard.jsp
├── add_credit.jsp
├── add_debit.jsp
├── transactions.jsp
├── register_process.jsp
│
├── /images
│ └── key.jpg, reg.png, credit.jpg, debit.jpg

## 🧪 Database Schema

```sql
-- users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    mobile VARCHAR(15) UNIQUE NOT NULL,
    uname VARCHAR(50),
    password VARCHAR(100),
    opbal DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- transactions table
CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    type VARCHAR(10) CHECK (type IN ('credit', 'debit')),
    amount DECIMAL(10,2),
    note VARCHAR(100),
    tdate DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

Update database credentials in your JSP files:
Connection con = DriverManager.getConnection(
  "jdbc:postgresql://localhost:5432/database_name", "postgres", "your_password");

*Include screenshots like:
Login Page
![login](https://github.com/user-attachments/assets/62042d48-81b6-4223-812b-91251c96556e)


Register Page
![reg](https://github.com/user-attachments/assets/c7572afe-51aa-4b6e-834a-575bb4d00345)

Dashboard
![dash](https://github.com/user-attachments/assets/7505e815-9b36-4ba2-ba6e-0a73c9c7bdbc)


Add Credit/Debit
![addcreadit](https://github.com/user-attachments/assets/5b6389fb-1e3f-493d-9fdd-ab204b486a79)
![debit](https://github.com/user-attachments/assets/d36e4dee-39bd-435e-864a-ed4bb748e2be)


Transaction History Table
![history](https://github.com/user-attachments/assets/cbdc3314-9643-4882-82ad-eaae6751a91a)


👩‍🎓 Project Author
Sujata Dhebe
Mini Project for Java webapplication
📍 Dr. D.Y. Patil College of Engineering, Akurdi
🌐 www.ssdhebe.com
