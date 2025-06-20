<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Registration</title>
  <style>
    /* full‑screen gradient background */
    body, html {
      margin: 0; padding: 0;
      width: 100%; height: 100%;
      font-family: Arial, sans-serif;
      background: linear-gradient(to bottom, #b0e0e6, #355f8c);
      overflow: hidden;
    }
    /* dark header bar */
    .header {
      background: #2c3e50;
      color: #ecf0f1;
      text-align: center;
      padding: 12px 0;
      font-size: 18px;
      font-weight: 500;
      position: absolute; top: 0; width: 100%;
    }
    /* semi‑transparent overlay */
    .overlay {
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background: rgba(0,0,0,0.4);
      display: flex;
      align-items: center;
      justify-content: center;
    }
    /* modal box */
    .modal {
      background: white;
      border-radius: 12px;
      width: 320px;
      padding: 20px;
      position: relative;
      box-shadow: 0 8px 20px rgba(0,0,0,0.3);
      text-align: center;
    }
    /* close “X” button */
    .modal .close {
      position: absolute;
      top: 10px; right: 10px;
      background: #ccc;
      width: 24px; height: 24px;
      border-radius: 12px;
      line-height: 24px;
      text-align: center;
      cursor: pointer;
      font-weight: bold;
      color: #444;
    }
    /* icon image */
    .modal img.icon {
      width: 80px;
      margin-bottom: 10px;
    }
    /* modal title */
    .modal h2 {
      margin: 10px 0 20px;
      color: #2c3e50;
      font-size: 18px;
    }
    /* input fields */
    .modal input {
      width: 100%;
      padding: 10px;
      margin: 8px 0;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 14px;
    }
    /* save button */
    .modal button {
      width: 100%;
      padding: 12px;
      margin-top: 15px;
      background-color: #2c3e50;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 15px;
      font-weight: bold;
      cursor: pointer;
    }
    .modal button:hover {
      background-color: #1b2836;
    }
  </style>
</head>
<body>

  <div class="header">USER Login</div>

  <div class="overlay">
    <div class="modal">
      <div class="close" onclick="window.location='login.jsp'">&times;</div>
      <img src="images/reg.jpg" alt="Register Icon" class="icon" />
      <h2>User Registration</h2>
      <form action="register_process.jsp" method="post">
        <input type="text"    name="uname"            placeholder="Enter User Name"            required />
        <input type="text"    name="mobile"           placeholder="Enter User Mobile Number" required />
        <input type="number"  name="opbal" step="0.01" placeholder="Enter Opening Balance"     required />
        <button type="submit">SAVE</button>
      </form>
    </div>
  </div>

</body>
</html>
