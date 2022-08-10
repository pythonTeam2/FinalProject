<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 

request.setCharacterEncoding("utf-8");
String uId = request.getParameter("uId");

String url_mysql = "jdbc:mysql://localhost/arts?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
String id_mysql = "root";
String pw_mysql = "qwer1234";

String whereDefault = "select u_Id, u_Pw, u_Name, u_Email from user where u_Id = '" + uId + "'";

JSONObject jsonList = new JSONObject();
JSONArray itemList = new JSONArray();

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();
   
        ResultSet rs = stmt_mysql.executeQuery(whereDefault);
        while(rs.next()){
            JSONObject tempJson = new JSONObject();
            tempJson.put("uId",rs.getString(1));
            tempJson.put("uPw",rs.getString(2));
            tempJson.put("uName",rs.getString(3));
            tempJson.put("uEmail",rs.getString(4));
            itemList.add(tempJson);
    }

    jsonList.put("results",itemList);
    conn_mysql.close();
    out.print(jsonList);
} catch(Exception e){
    e.printStackTrace();
}
%>