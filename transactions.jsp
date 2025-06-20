<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" language="java" %>
<%
  Integer uid = (Integer) session.getAttribute("uid");
  if (uid == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Transaction History</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to bottom, #b0e0e6, #355f8c);
      margin: 0;
      padding: 0;
    }
    .header {
      background: #2c3e50;
      color: #ecf0f1;
      padding: 15px;
      text-align: center;
      font-size: 20px;
    }
    .container {
      background: #fff;
      border-radius: 10px;
      margin: 30px auto;
      padding: 20px;
      width: 90%;
      max-width: 800px;
      box-shadow: 0 10px 20px rgba(0,0,0,0.2);
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }
    th, td {
      padding: 12px;
      border-bottom: 1px solid #ddd;
      text-align: center;
    }
    th {
      background-color: #2c3e50;
      color: white;
    }
    tr:hover {
      background-color: #f1f1f1;
    }
    .back-btn {
      margin-top: 20px;
      display: inline-block;
      padding: 10px 20px;
      background: #2c3e50;
      color: white;
      text-decoration: none;
      border-radius: 6px;
      font-weight: bold;
    }
    .back-btn:hover {
      background: #1b2836;
    }
  </style>
</head>
<body>

<div class="header">Transaction History</div>

<div class="container">
  <table>
    <tr>
      <th>Date</th>
      <th>Note</th>
      <th>Credit</th>
      <th>Debit</th>
      <th>Balance</th>
    </tr>
    <%
      double balance = 0.0;

      try {
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/pune", "postgres", "12345");

        PreparedStatement opbalStmt = con.prepareStatement("SELECT opbal FROM users WHERE id = ?");
        opbalStmt.setInt(1, uid);
        ResultSet opbalRs = opbalStmt.executeQuery();
        if (opbalRs.next()) {
          balance = opbalRs.getDouble("opbal");
        }

        PreparedStatement ps = con.prepareStatement("SELECT * FROM transactions WHERE user_id = ? ORDER BY tdate ASC, id ASC");
        ps.setInt(1, uid);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
          String tdate = rs.getDate("tdate").toString();
          String note = rs.getString("note");
          double amount = rs.getDouble("amount");
          String type = rs.getString("type");

          double credit = 0, debit = 0;
          if ("credit".equals(type)) {
            credit = amount;
            balance += credit;
          } else if ("debit".equals(type)) {
            debit = amount;
            balance -= debit;
          }
    %>
    <tr>
      <td><%= tdate %></td>
      <td><%= note %></td>
      <td><%= credit == 0 ? "-" : String.format("%.2f", credit) %></td>
      <td><%= debit == 0 ? "-" : String.format("%.2f", debit) %></td>
      <td><%= String.format("%.2f", balance) %></td>
    </tr>
    <%
        }
        con.close();
      } catch (Exception e) {
        out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
      }
    %>
  </table>

  <div style="text-align: center;">
    <a href="dashboard.jsp" class="back-btn">← Back to Dashboard</a>
  </div>
</div>

</body>
</html>
