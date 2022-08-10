<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 

request.setCharacterEncoding("utf-8");
String uId = request.getParameter("uId");
String uPw = request.getParameter("uPw");
String uName = request.getParameter("uName");
String uEmail = request.getParameter("uEmail");


String url_mysql = "jdbc:mysql://localhost/arts?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
String id_mysql = "root";
String pw_mysql = "qwer1234";

PreparedStatement ps = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();

    String act1 = "update user set u_Pw=?, u_Name=?, u_Email=? where u_Id = ?";

    ps = conn_mysql.prepareStatement(act1);
    ps.setString(1, uPw);
    ps.setString(2, uName);
    ps.setString(3, uEmail);
    ps.setString(4, uId);

    ps.executeUpdate();
    conn_mysql.close();
%>
    {"result":"OK"}
<%
} catch(Exception e){
%>
    {"result":"ERROR"}
<%
}
%>