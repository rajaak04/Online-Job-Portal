<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = null;
    InitialContext ctx = null;
    PreparedStatement st = null;
    DataSource ds = null;
    ResultSet rs = null;

    try {
        ctx = new InitialContext();
        ds = (DataSource) ctx.lookup("java:comp/env/jdbc/register");
        con = ds.getConnection();

        String query = "SELECT * FROM portal WHERE id=?";
        st = con.prepareStatement(query);
        st.setInt(1, id);
        rs = st.executeQuery();

        if (rs.next()) {
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Job</title>
    <style>
        body {}
        * { margin: 0; padding: 0; box-sizing: border-box; }
        .jobid { width: 100%; height: 100px; background: rgb(140, 36, 182); }
        .viewport {
            width: 80%;
            height: 700px;
            background: rgb(250, 246, 246);
            position: relative;
            left: 170px;
            top: 80px;
        }
        table {
            position: relative;
            top: 50px;
            font-size: 20px;
            border-spacing: 30px 0px;
        }
        #job {
            padding: 5px 15px;
            border: none;
            background-color: rgb(116, 26, 96);
            font-size: 15px;
            font-family: 'Times New Roman', Times, serif;
            color: antiquewhite;
        }
        td {
            font-family: 'Times New Roman', Times, serif;
        }
        .s {
            position: relative;
            left: 45px;
            border-spacing: 35px 65px;
            margin-top: -49px;
        }
        textarea {
            position: relative;
            left: 80px;
        }
        #name1 {
            position: relative;
            top: 50px;
            padding: 5px 20px;
            background: rgb(140, 36, 182);
        }
    </style>
</head>
<body>
<form action="editer.jsp?id=<%= id %>" method="post">
    <div class="jobid">
        <table>
            <tr>
                <td>Job Portal</td>
                <td>Home</td>
            </tr>
        </table>
    </div>

    <div class="viewport">
        <label style="margin-left: 80px;margin-top: 200px;" for="name">Enter Job Title</label><br>
        <input type="text" name="name" id="name" style="width: 77%; height: 20px; margin-top: 8px;margin-left: 80px"
               value="<%= rs.getString("name") %>"><br><br>

        <label style="margin-left: 80px;" for="company">Company Name</label><br>
        <input type="text" name="company" id="company" style="width: 77%; height: 20px; margin-top: 8px;margin-left: 80px"
               value="<%= rs.getString("company") %>">

        <table class="s">
            <tr>
                <td style="font-size: 17px;">Location
                    <select style="width: 196px;" name="location">
                        <option value="<%= rs.getString("location") %>" selected><%= rs.getString("location") %></option>
                        <option>Chennai</option>
                        <option>Madurai</option>
                        <option>Coimbatore</option>
                        <option>Bengaluru</option>
                        <option>Mumbai</option>
                        <option>Hyderabad</option>
                        <option>Kochi</option>
                        <option>Delhi</option>
                        <option>Kolkata</option>
                    </select>
                </td>
                <td style="font-size: 17px;">Category
                    <select style="width: 196px;" name="category">
                        <option value="<%= rs.getString("category") %>" selected><%= rs.getString("category") %></option>
                        <option>Choose</option>
                        <option>IT</option>
                        <option>Marketing</option>
                        <option>Banking</option>
                        <option>Developer</option>
                        <option>Engineer</option>
                        <option>Non-IT</option>
                    </select>
                </td>
                <td style="font-size: 17px;">Status
                    <select style="width: 196px;" name="status">
                        <option value="<%= rs.getString("status") %>" selected><%= rs.getString("status") %></option>
                        <option>Choose</option>
                        <option>Active</option>
                        <option>Inactive</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="font-size: 17px;">Salary Package:</td>
                <td style="font-size: 17px;">Start
                    <input type="number" name="Ssalary" value="<%= rs.getString("Ssalary") %>">
                </td>
                <td style="font-size: 17px;">End
                    <input type="number" name="Esalary" value="<%= rs.getString("Esalary") %>">
                </td>
            </tr>
        </table>

        <p style="position: relative;left: 78px; font-size: 17px;margin-top: 40px;">Job Description:</p><br>
        <textarea rows="10" cols="120" name="description" id="text"><%= rs.getString("description") %></textarea>

        <input type="submit" id="name1" value="Update Job">
    </div>
</form>
</body>
</html>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (st != null) try { st.close(); } catch (Exception e) {}
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
%>
