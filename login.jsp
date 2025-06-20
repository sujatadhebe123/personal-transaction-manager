<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>USER Login</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body, html {
      width: 100%; height: 100%;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .header {
      background: #2c3e50;
      color: #ecf0f1;
      text-align: center;
      padding: 14px 0;
      font-size: 18px;
      font-weight: 500;
    }
    .background {
      background: linear-gradient(to bottom, #b0e0e6, #355f8c);
      width: 100%; flex: 1;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
    .background img {
      width: 100px;
      margin-bottom: 20px;
    }
    .background input[type="text"] {
      width: 80%;
      max-width: 300px;
      padding: 12px;
      margin: 8px 0;
      border: none;
      border-radius: 4px;
      font-size: 14px;
    }
    .background button {
      width: 80%;
      max-width: 300px;
      padding: 12px;
      margin: 12px 0;
      background: #ecf0f1;
      color: #2c3e50;
      border: none;
      border-radius: 4px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
    }
    .background button:hover {
      background: #d0d7de;
    }
    .background .signup {
      margin-top: 8px;
      font-size: 13px;
      color: #ecf0f1;
      text-decoration: none;
    }
    .background .signup:hover {
      text-decoration: underline;
    }
    .footer {
      text-align: center;
      padding: 10px 0;
      font-size: 12px;
      color: #ecf0f1;
      background: #2c3e50;
    }
    .wrapper {
      display: flex;
      flex-direction: column;
      height: 100%;
    }
  </style>
</head>
<body>
  <div class="wrapper">
    <div class="header">USER Login</div>
    <div class="background">
      <img src="images/key.jpg" alt="Key Icon"/>
      <form method="post">
        <input type="text" name="mobile" placeholder="Mobile Number" required />
        <button type="submit">SIGN IN</button>
      </form>
      <a href="register.jsp" class="signup">DON’T HAVE AN ACCOUNT? SIGN UP</a>

      <%-- JSP LOGIN LOGIC --%>
      <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
          String mobile = request.getParameter("mobile");
          try {
              Class.forName("org.postgresql.Driver");
              Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/pune", "postgres", "12345");
              PreparedStatement ps = con.prepareStatement("SELECT id, uname FROM users WHERE mobile = ?");
              ps.setString(1, mobile);
              ResultSet rs = ps.executeQuery();

              if (rs.next()) {
                  int uid = rs.getInt("id");
                  String uname = rs.getString("uname");
                  session.setAttribute("uid", uid);
                  session.setAttribute("uname", uname);
                  response.sendRedirect("dashboard.jsp");
              } else {
      %>
                <p style="color: white;">⚠️ Mobile number not found. Please register first.</p>
      <%
              }
              rs.close();
              ps.close();
              con.close();
          } catch (Exception e) {
      %>
              <p style="color: red;">Error: <%= e.getMessage() %></p>
      <%
          }
        }
      %>
    </div>
    <div class="footer">www.@SSDhebe.com</div>
  </div>
</body>
</html>
