<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%
  Integer uid = (Integer) session.getAttribute("uid");
  String uname = (String) session.getAttribute("uname");
  if (uid == null) {
      response.sendRedirect("login.jsp");
      return;
  }

  double credit = 0, debit = 0, opbal = 0;

  try {
      Class.forName("org.postgresql.Driver");
      Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/pune", "postgres", "12345");

      PreparedStatement ps1 = con.prepareStatement("SELECT opbal FROM users WHERE id = ?");
      ps1.setInt(1, uid);
      ResultSet rs1 = ps1.executeQuery();
      if (rs1.next()) {
          opbal = rs1.getDouble("opbal");
      }

      PreparedStatement ps2 = con.prepareStatement("SELECT type, SUM(amount) as total FROM transactions WHERE user_id = ? GROUP BY type");
      ps2.setInt(1, uid);
      ResultSet rs2 = ps2.executeQuery();
      while (rs2.next()) {
          String type = rs2.getString("type");
          double total = rs2.getDouble("total");
          if ("credit".equalsIgnoreCase(type)) credit = total;
          else if ("debit".equalsIgnoreCase(type)) debit = total;
      }

      rs1.close(); rs2.close(); ps1.close(); ps2.close(); con.close();

  } catch (Exception e) {
      out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
  }

  double balance = opbal + credit - debit;
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Dashboard</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(to bottom, #b0e0e6, #355f8c);
      text-align: center;
      color: #2c3e50;
      padding-bottom: 30px;
    }
    .header {
      background: #2c3e50;
      color: #ecf0f1;
      padding: 15px;
      font-size: 20px;
      font-weight: bold;
    }
    .balance-box {
      background: #fff;
      width: 90%;
      max-width: 350px;
      margin: 20px auto;
      border-radius: 12px;
      padding: 20px;
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
    }
    .balance-box h2 {
      font-size: 24px;
      margin: 10px 0;
    }
    .balance-box p {
      color: #555;
      margin-bottom: 20px;
    }
    .action-buttons {
      display: flex;
      justify-content: space-between;
    }
    .action-buttons div {
      flex: 1;
      margin: 0 5px;
      padding: 10px 0;
      background-color: #2c3e50;
      color: #fff;
      border-radius: 8px;
      cursor: pointer;
      font-weight: bold;
    }
    .cards {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 15px;
      margin-top: 20px;
    }
    .card {
      width: 140px;
      background: #fff;
      padding: 15px;
      border-radius: 10px;
      font-weight: bold;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      color: #2c3e50;
    }
    .view-link {
      margin-top: 30px;
      display: inline-block;
      font-size: 16px;
      color: #ecf0f1;
      text-decoration: underline;
      cursor: pointer;
    }
  </style>
</head>
<body>

  <div class="header">Personal Transaction</div>

  <div class="balance-box">
    <h2>₹ <%= String.format("%.2f", balance) %></h2>
    <p>Current Balance</p>
    <div class="action-buttons">
      <div onclick="location.href='add_credit.jsp'">Add Credit</div>
      <div onclick="location.href='add_debit.jsp'">Add Debit</div>
    </div>
  </div>

  <div class="cards">
    <div class="card">₹ <%= credit %><br>Total Credit</div>
    <div class="card">₹ <%= debit %><br>Total Debit</div>
    <div class="card">₹ <%= (credit + debit) %><br>Credit + Debit</div>
    <div class="card">₹ <%= (credit - debit) %><br>Credit - Debit</div>
  </div>

  <div class="view-link" onclick="location.href='transactions.jsp'">👁️ View Transactions</div>

</body>
</html>
