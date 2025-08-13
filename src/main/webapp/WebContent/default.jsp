<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Portal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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