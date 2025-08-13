<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<%@ page import="java.sql.*, javax.naming.InitialContext, javax.sql.DataSource" %>

<%
    InitialContext ctx = null;
    DataSource ds = null;
    Connection con = null;
    Statement ss = null;
    ResultSet rs = null;

    try {
        ctx = new InitialContext();
        ds = (DataSource) ctx.lookup("java:comp/env/jdbc/register");
        con = ds.getConnection();
        String query = "SELECT * FROM portal";
        ss = con.createStatement();
        rs = ss.executeQuery(query);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        table {
            position: relative;
            top: 50px;
            font-size: 20px;
            border-spacing: 30px 0px;
        }

        .jobid {
            width: 100%;
            height: 100px;
            background: rgb(140, 36, 182);
        }

        .admin {
            width: 80%;
            height: 250px;
            background: rgb(239, 243, 242);
            position: relative;
            left: 150px;
            top: 100px;
        }

        .brt {
            border-spacing: 100px 0px;
            margin-left: -250px;
        }

        #s {
            font-size: 19px;
            position: relative;
            top: 90px;
        }

        #df {
            border: 1px solid black;
            width: 220px;
            position: relative;
            left: 170px;
            text-align: center;
        }

        .dd {
            width: 80%;
            height: 250px;
            background: rgb(239, 243, 242);
            position: relative;
            left: 150px;
            top: 100px;
        }

        #gj {
            position: relative;
            top: 65px;
            left: 700px;
            padding: 5px 20px;
            border-radius: 5px;
            width: 80px;
            background-color: rgb(42, 165, 69);
            color: beige;
        }

        .hh {
            margin-left: 800px;
            position: relative;
            top: 10px;
            font-size: 18px;
        }
    </style>
    <title>Job Portal</title>
</head>

<body>
    <div class="jobid">
        <table>
            <tr>
                <td>Job Portal</td>
                <td>Home</td>
            </tr>
        </table>
    </div>

    <%
        while (rs.next()) {
            int id = rs.getInt("id");
    %>

    <div class="admin">
        <p class="hh">Posted: <%= rs.getString("time") %> <%= rs.getString("dater") %></p>
        <h3>Company: <%= rs.getString("company") %></h3>
        <h3 style="margin-top: 9px;">Job Role: <%= rs.getString(2) %></h3>

        <table class="brt">
            <tr>
                <td id="but">
                    <p id="df">Location - <%= rs.getString(3) %></p>
                </td>
                <td id="but">
                    <p id="df">Category - <%= rs.getString(4) %></p>
                </td>
                <td id="but">
                    <p id="df">Status - <%= rs.getString(5) %></p>
                </td>
            </tr>
        </table>

        <p id="s">Salary: <%= rs.getString(6) %> - <%= rs.getString(7) %></p>

        <%
            String link = rs.getString("link");
        %>

        <button id="gj" onclick="window.open('<%= link %>', '_blank')">Apply</button>
    </div>

    <br>

    <div class="dd">
        <p id="s"><b>Job Description:</b> <%= rs.getString("description") %></p>
    </div>

    <br><br>

    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>

</html>
<%
    // Closing database resources
    if (rs != null) {
        rs.close();
    }
    if (ss != null) {
        ss.close();
    }
    if (con != null) {
        con.close();
    }
%>
