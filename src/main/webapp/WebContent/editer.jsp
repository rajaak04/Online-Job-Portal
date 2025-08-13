<%@ page import="java.sql.*, java.text.*, javax.naming.InitialContext, javax.sql.DataSource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("name");
    String location = request.getParameter("location");
    String category = request.getParameter("category");
    String status = request.getParameter("status");
    int Ssalary = Integer.parseInt(request.getParameter("Ssalary"));
    int Esalary = Integer.parseInt(request.getParameter("Esalary"));
    String description = request.getParameter("description");
    String company = request.getParameter("company");
    int id = Integer.parseInt(request.getParameter("id"));

    long accessTime = session.getCreationTime(); 
    Date creationDate = new Date(accessTime);

    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
    String time = timeFormat.format(creationDate);


    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    String date = dateFormat.format(creationDate);

    Connection con = null;
    PreparedStatement pre = null;

    try {
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/register");
        con = ds.getConnection();

        String query = "UPDATE portal SET name=?, location=?, category=?, status=?, Ssalary=?, Esalary=?, description=?, time=?, dater=?, company=? WHERE id=?";
        pre = con.prepareStatement(query);
        pre.setString(1, name);
        pre.setString(2, location);
        pre.setString(3, category);
        pre.setString(4, status);
        pre.setInt(5, Ssalary);
        pre.setInt(6, Esalary);
        pre.setString(7, description);
        pre.setString(8, time);
        pre.setString(9, date);
        pre.setString(10, company);
        pre.setInt(11, id);

        int rows = pre.executeUpdate();
        if (rows > 0) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Successful</title>
</head>
<body>
    <h3>Edit Successful</h3>
    <form action="default.jsp" method="post">
        <input type="submit" value="Home">
    </form>
</body>
</html>
<%
        } else {
%>
<p>Edit Failed. No rows affected.</p>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pre != null) try { pre.close(); } catch (Exception e) {}
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
%>
