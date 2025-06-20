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
  <title>Add Credit</title>
  <style>
    body, html {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', sans-serif;
      height: 100%;
      background: linear-gradient(to bottom, #b0e0e6, #355f8c);
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .modal {
      background: white;
      border-radius: 15px;
      width: 320px;
      padding: 25px;
      box-shadow: 0 10px 20px rgba(0,0,0,0.3);
      text-align: center;
      position: relative;
    }
    .modal .close {
      position: absolute;
      top: 10px;
      right: 10px;
      background: #ccc;
      color: #444;
      border-radius: 50%;
      width: 24px;
      height: 24px;
      font-weight: bold;
      cursor: pointer;
      line-height: 24px;
    }
    .modal img {
      width: 80px;
      margin-bottom: 15px;
    }
    .modal h2 {
      margin: 0 0 15px;
      color: #2c3e50;
    }
    .modal input, .modal textarea {
      width: 100%;
      padding: 10px;
      margin: 8px 0;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 14px;
    }
    .modal button {
      width: 100%;
      padding: 12px;
      background-color: #2c3e50;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
    }
    .modal button:hover {
      background-color: #1a252f;
    }
  </style>
</head>
<body>
  <div class="modal">
    <div class="close" onclick="window.location.href='dashboard.jsp'">&times;</div>
    <img src="images/creadit.jpg" alt="Credit" />
    <h2>Credit Transaction</h2>
    <form method="post" action="add_credit_process.jsp">
      <input type="date" name="date" required />
      <textarea name="note" placeholder="Enter notes" required></textarea>
      <input type="number" step="0.01" name="amount" placeholder="Enter Amount" required />
      <button type="submit">Add Credit</button>
    </form>
  </div>
</body>
</html>
