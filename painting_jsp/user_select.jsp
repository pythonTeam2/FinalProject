<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
  
String url_mysql = "jdbc:mysql://localhost/arts?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
String id_mysql = "root";
String pw_mysql = "qwer1234";

String whereDefault = "select * from user where u_Id = ? and u_Pw = ?";
PreparedStatement ps = null;
ResultSet rs = null;

JSONObject jsonList = new JSONObject();
JSONArray itemList = new JSONArray();

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();

    ps=conn_mysql.prepareStatement(whereDefault);
    ps.setString(1,id);
    ps.setString(2,pw);
    rs=ps.executeQuery();    

    if(rs.next()){
      JSONObject tempJson = new JSONObject();
      tempJson.put("uId",rs.getString(1));
      tempJson.put("uPw",rs.getString(2));
      tempJson.put("uName",rs.getString(3));
      tempJson.put("uEmail",rs.getString(4));
      tempJson.put("uQuit",rs.getInt(5));
      itemList.add(tempJson);
    }
    jsonList.put("results",itemList);
    out.print(jsonList);
    conn_mysql.close();

} catch(Exception e){
  e.printStackTrace();
}
%>