<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% 

 request.setCharacterEncoding("utf-8");
String uId = request.getParameter("uId");

 String url_mysql = "jdbc:mysql://localhost/fitness?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 String id_mysql = "root";
 String pw_mysql = "qwer1234";

 String whereDefault = "select uId, uPw, uName, uBirth, uEmail from user where uId = '" + uId + "'";

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
            tempJson.put("uBirth",rs.getInt(4));
            tempJson.put("uEmail",rs.getString(5));
            itemList.add(tempJson);
        
    }

    jsonList.put("results",itemList);
    conn_mysql.close();
    out.print(jsonList);
} catch(Exception e){
    e.printStackTrace();
}
%>