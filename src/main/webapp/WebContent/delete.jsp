<%@ page import="java.sql.*, javax.sql.DataSource, javax.naming.InitialContext" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    InitialContext ctx = null;
    DataSource ds = null;
    Connection con = null;
    PreparedStatement pre = null;

    try {
        ctx = new InitialContext();
        ds = (DataSource) ctx.lookup("java:comp/env/jdbc/register");
        con = ds.getConnection();

        String query = "DELETE FROM portal WHERE id=?";
        pre = con.prepareStatement(query);
        pre.setInt(1, id);
        int rows = pre.executeUpdate();

        if(rows>0){%>
        <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <p>Delete Succesfull</p>
</body>
</html>
       
        
        
    <%} }
        catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color:red;'>Error occurred while deleting the job.</p>");
    } finally {
        try {
        	if (pre != null){ pre.close();}
        	} catch (Exception e) {}
        try { if (con != null) 
        {con.close();
        } }
        catch (Exception e) {}
    }
%>
