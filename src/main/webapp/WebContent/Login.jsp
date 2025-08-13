<%@ page import="java.sql.*, javax.naming.InitialContext, javax.sql.DataSource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String gmail = request.getParameter("mail");
    String pass = request.getParameter("pass");
    String mail = null;
    String password = null;

    try {
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/register");
        Connection con = ds.getConnection();
        Statement ss = con.createStatement();
        ResultSet rr = ss.executeQuery("SELECT * FROM job");

        while (rr.next()) {
            mail = rr.getString("gmail");
            password = rr.getString("password");

            if (gmail.equals("admin123@gmail.com") && pass.equals("admin")) {
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Portal</title>
    <link rel="stylesheet" href="css/all.min.css">
    <style>
        body {
            background: url('directly-shot-coffee-by-book-laptop-table_1048944-4978278.png') no-repeat fixed;
            background-size: cover;
            background-position: bottom;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        div {
            width: 100%;
            height: 100px;
            background: rgb(140, 36, 182);
        }
        table {
            position: relative;
            top: 50px;
            font-size: 20px;
            border-spacing: 30px 0;
        }
        #job {
            padding: 5px 15px;
            border: none;
            background-color: rgb(116, 26, 96);
            font-size: 15px;
            font-family: 'Times New Roman', Times, serif;
            color: antiquewhite;
            width:120px;
        }
    </style>
    
</head>
<body>
    <form action="add.html" method="post">
        <div>
            <table>
                <tr>
                    <td ><p style="width:90px;">Job Portal</p></td>
                    <td>Home</td>
                    <td><button type="submit"  id="job"><i class="fa-solid fa-plus" style="margin-right:5px;"></i>Add Jobs</button></td>
    </form>
    <form action="view.jsp" method="post">
        <td><button type="submit"  id="job"><i class="fa-solid fa-eye" style="margin-right:5px;"></i>View Jobs</button></td>
    </form>
    <form action="Home.html" method="post">
        <td><button type="submit"  id="job" style="margin-left: 700px;"><i class="fa-solid fa-arrow-right-from-bracket"style="margin-right:5px;"></i>Sign Out</button></td>
    </form>
                </tr>
            </table>
        </div>
        <marquee direction="right" scrollamount="15" style="font-size: 35px;">Welcome to Admin</marquee>
</body>
</html>

<%
                break;
            } else if (gmail.equals(mail) && pass.equals(password)) {
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>User Portal</title>
    <link rel="stylesheet" href="css/all.min.css">
    <style>
        body {
            background: url('directly-shot-coffee-by-book-laptop-table_1048944-4978278.png') no-repeat fixed;
            background-size: cover;
            background-position: bottom;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        div {
            width: 100%;
            height: 100px;
            background: rgb(140, 36, 182);
        }
        table {
            position: relative;
            top: 50px;
            font-size: 20px;
            border-spacing: 30px 0;
        }
        #job {
            padding: 5px 15px;
            border: none;
            background-color: rgb(116, 26, 96);
            font-size: 15px;
            font-family: 'Times New Roman', Times, serif;
            color: antiquewhite;
        }
    </style>
</head>
<body>
    <div>
        <table>
            <tr>
                <td>Job Portal</td>
                <td>Home</td>
                <form action="viewuser.jsp" method="post">
                    <td><button type="submit" value="View Jobs" id="job"><i class="fa-solid fa-eye" style="margin-right:5px; "></i>View Jobs</button></td>
                </form>
                <form action="Home.html" method="post">
                    <td><button type="submit"  id="job" style="margin-left: 800px;"><i class="fa-solid fa-arrow-right-from-bracket"style="margin-right:5px;"></i>Sign Out</button></td>
                </form>
            </tr>
            
        </table>
    </div>
</body>
</html>
<%
                break;
            }
            
            
        }

        rr.close();
        ss.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
