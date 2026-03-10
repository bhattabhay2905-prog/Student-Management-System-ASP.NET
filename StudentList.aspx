<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="StudentManagementSystem.StudentList" %>s

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<title>Student List</title>

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
width:900px;
margin:40px auto;
background:white;
padding:25px;
border-radius:8px;
box-shadow:0 0 10px rgba(0,0,0,0.1);
}

table{
border-collapse:collapse;
width:100%;
}

th{
background:#0078d4;
color:white;
padding:10px;
}

td{
padding:8px;
border-bottom:1px solid #ddd;
}

tr:hover{
background:#f1f1f1;
}

/* Buttons */

.editBtn{
background:#28a745;
color:white;
padding:5px 10px;
border-radius:4px;
text-decoration:none;
}

.deleteBtn{
background:#dc3545;
color:white;
padding:5px 10px;
border-radius:4px;
text-decoration:none;
}

.updateBtn{
background:#007bff;
color:white;
padding:5px 10px;
border-radius:4px;
text-decoration:none;
}

.cancelBtn{
background:#6c757d;
color:white;
padding:5px 10px;
border-radius:4px;
text-decoration:none;
}

/* Keep buttons in same row */

.actionButtons{
display:flex;
gap:6px;
align-items:center;
}

/* Edit textbox styling */

input[type=text]{
width:95%;
padding:4px;
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

<h2>Student List</h2>

<br />

<asp:GridView
ID="GridView1"
runat="server"
AutoGenerateColumns="False"
DataKeyNames="Id"
Width="100%"
OnRowEditing="GridView1_RowEditing"
OnRowUpdating="GridView1_RowUpdating"
OnRowDeleting="GridView1_RowDeleting"
OnRowCancelingEdit="GridView1_RowCancelingEdit">

<Columns>

<asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true"/>

<asp:BoundField DataField="Name" HeaderText="Name"/>

<asp:BoundField DataField="Email" HeaderText="Email"/>

<asp:BoundField DataField="Course" HeaderText="Course"/>

<asp:BoundField DataField="Phone" HeaderText="Phone"/>

<asp:TemplateField HeaderText="Actions">

<ItemTemplate>

<span class="actionButtons">

<asp:LinkButton
runat="server"
CommandName="Edit"
Text="Edit"
CssClass="editBtn" />

<asp:LinkButton
runat="server"
CommandName="Delete"
Text="Delete"
CssClass="deleteBtn"
OnClientClick="return confirm('Are you sure you want to delete this student?');" />

</span>

</ItemTemplate>

<EditItemTemplate>

<span class="actionButtons">

<asp:LinkButton
runat="server"
CommandName="Update"
Text="Update"
CssClass="updateBtn" />

<asp:LinkButton
runat="server"
CommandName="Cancel"
Text="Cancel"
CssClass="cancelBtn" />

</span>

</EditItemTemplate>

</asp:TemplateField>

</Columns>

</asp:GridView>

</div>

</form>

</body>
</html>