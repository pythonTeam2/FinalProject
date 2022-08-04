<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% 

request.setCharacterEncoding("utf-8");
String uId = request.getParameter("uId");
String uPw = request.getParameter("uPw");
String uName = request.getParameter("uName");
int uBirth = Integer.parseInt(request.getParameter("uBirth"));
String uEmail = request.getParameter("uEmail");


 String url_mysql = "jdbc:mysql://localhost/fitness?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 String id_mysql = "root";
 String pw_mysql = "qwer1234";

 PreparedStatement ps = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();

    String act1 = "update user set uPw=?, uName=?, uBirth=?, uEmail=? where uId = ?";

    ps = conn_mysql.prepareStatement(act1);
    ps.setString(1, uPw);
    ps.setString(2, uName);
    ps.setInt(3, uBirth);
    ps.setString(4, uEmail);
    ps.setString(5, uId);
    


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