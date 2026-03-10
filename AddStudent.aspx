<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="StudentManagementSystem.AddStudent" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<title>Add Student</title>

<style>

body{
font-family:Arial;
background:#f4f6f9;
margin:0;
}

.navbar{
background:#0078d4;
padding:15px;
color:white;
}

.navbar a{
color:white;
margin-right:20px;
text-decoration:none;
font-weight:bold;
}

.container{
width:400px;
margin:80px auto;
background:white;
padding:25px;
border-radius:8px;
box-shadow:0 0 10px rgba(0,0,0,0.1);
}

input{
width:100%;
padding:8px;
margin-top:5px;
}

.button{
width:100%;
padding:10px;
background:#0078d4;
color:white;
border:none;
cursor:pointer;
margin-top:15px;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="navbar">

Student Management System

<br /><br />

<a href="StudentList.aspx">Student List</a>
<a href="AddStudent.aspx">Add Student</a>

</div>

<div class="container">

<h2>Add Student</h2>

Name
<asp:TextBox ID="txtName" runat="server"></asp:TextBox>

<br /><br />

Email
<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

<br /><br />

Course
<asp:TextBox ID="txtCourse" runat="server"></asp:TextBox>

<br /><br />

Phone
<asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>

<br /><br />

<asp:Button 
ID="btnSave" 
runat="server" 
Text="Save Student"
CssClass="button"
OnClick="btnSave_Click"/>

</div>

</form>

</body>
</html>