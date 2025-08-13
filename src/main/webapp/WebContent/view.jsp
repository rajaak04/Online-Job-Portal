<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Job Listings</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        table { position: relative; top: 50px; font-size: 20px; border-spacing: 30px 0px; }
        .jobid { width: 100%; height: 100px; background: rgb(140, 36, 182); }
        .admin, .dd {
            width: 80%;
            background: rgb(239, 243, 242);
            position: relative;
            left: 150px;
            margin-top: 50px;
            padding: 20px;
        }
        .admin { height: 250px; }
        .dd { height: auto; }
        .brt { border-spacing: 100px 0px; margin-left: -250px; }
        #s, #g { font-size: 19px; position: relative; top: 50px; }
        #g { top: 90px; }
        #df {
            border: 1px solid black;
            width: 220px;
            position: relative;
            left: 170px;
            text-align: center;
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
</head>
<body>
    <div class="jobid">
        <table>
            <tr>
                <td>Job Portal</td>
                <td><a href="Home.html">Home</a></td>
            </tr>
        </table>
    </div>

    <%
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/register");
            con = ds.getConnection();
            String query = "SELECT * FROM portal";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("id");
    %>
    <div class="admin">
        <p class="hh">Posted: <%= rs.getString("time") %> <%= rs.getString("dater") %></p>
        <h3>Company: <%= rs.getString("company") %></h3>
        <h3 style="margin-top: 9px;">Job Role: <%= rs.getString(2) %></h3>

        <table class="brt">
            <tr>
                <td id="but"><p id="df">Location - <%= rs.getString(3) %></p></td>
                <td id="but"><p id="df">Category - <%= rs.getString(4) %></p></td>
                <td id="but"><p id="df">Status - <%= rs.getString(5) %></p></td>
            </tr>
        </table>

        <p id="g">Salary: <%= rs.getString(6) %> - <%= rs.getString(7) %></p>
        <form action="edit.jsp?id=<%= id %>" method="post">
            <input type="submit" value="Edit" id="gj" style="margin-right: 30px;">
        </form>
        <form action="delete.jsp?id=<%= id %>" method="post">
            <input type="submit" value="Delete" id="gj" style="position:relative; top:35px; left:800px;">
        </form>
    </div>

    <div class="dd">
        <p id="s"><b>Job Description:</b> <%= rs.getString("description") %></p>
    </div>
    <br><br>
    <%
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (stmt != null) try { stmt.close(); } catch (Exception e) {}
            if (con != null) try { con.close(); } catch (Exception e) {}
        }
    %>
</body>
</html>
