<!-- 画面ID：k02g01	PJ一覧画面 -->
<!-- 初期構築：2019/07/15 ChiZai Tagawa Yuji -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProjectInfo"%>
<% String projectName = (String)request.getAttribute("projectName"); %>
<% String searchDate = (String)request.getAttribute("searchDate"); %>
<% String errMsg = (String)request.getAttribute("errMsg"); %>
<% ArrayList<ProjectInfo> projectList = (ArrayList<ProjectInfo>)request.getAttribute("projectList"); %>

<!DOCTYPE HTML>
<html>
<head>
  <script type="text/javascript" src="SelectDisp.js"></script>
  <link rel="stylesheet" href="header_footer.css">
  <link rel="stylesheet" href="MainStyle.css">
  <link rel="stylesheet" href="TableStyle.css">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>プロジェクト一覧画面</title>
</head>
<body>
<%@ include file="_header.jsp" %>
<div id="main">
  <form method="post" action="Main">
    <input type="hidden" name="view" value="home">
    <input class="Return" type="submit" name="calculate" value="＜ 戻る">
  </form>
  <h3 class="title">プロジェクト一覧画面</h3>
  <p>説明：~~~~~</p>
  <hr>
  <form method="post" action="ProjectSearch">
    <input type="hidden" name="view" value="search">
      <label for="cookName">PJから探す</label>
      <input type="text" name="projectName"
      <%if (!(projectName.equals("")) || projectName != null || !(projectName.equals("null"))) {
        out.write("value=\"" + projectName + "\"");
      }
      %>>
      <label for="cookName">年度から探す</label>
      <select name = "searchDate">
        <option value="" selected></option>
        <option value="2018">2018年度</option>
        <option value="2019">2019年度</option>
      </select>
    <input type="submit" name="search" value="検索">
  </form>

  <form method="post" action="ProjectSearch">
    <input type="hidden" name="view" value="decision">
    <hr>
    <table>
      <tr>
        <th>No.</th>
        <th>プロジェクト名</th>
        <th>日程</th>
        <th>人数</th>
        <th>選択</th>
      </tr>
      <%if (projectList != null || projectList.size() == 0) {
        for (int i = 0; i < projectList.size(); i++) {
          out.write("<tr>");
          out.write("<td><label for=\"project" + i + "\">" + (i + 1) + "</label></td>");
          out.write("<td><label for=\"project" + i + "\">" + projectList.get(i).getProjectname() + "</label></td>");
          out.write("<td><label for=\"project" + i + "\">" + projectList.get(i).getStartdate() + " 〜 "
            + projectList.get(i).getEnddate() + "</label></td>");
          out.write("<td><label for=\"project" + i + "\">" + projectList.get(i).getMember() + "</label></td>");
          out.write("<td><input onclick=\"SelectDisp2('" + i + "')\" id=\"project" + i + "\" type=\"radio\" name=\"projectid\" value=\""
            + projectList.get(i).getProjectid() + "\"></td>");
          out.write("</tr>");
          }
        }
      %>
    </table>
    <%if (!(errMsg.isEmpty()) && errMsg != null){
      out.write("<div class=\"alert\">");
      out.write(errMsg);
      out.write("</div>");
    }
    %>
    <h4 class="float">選択したプロジェクト：</h4>
    <%
      for(int i = 0; i < projectList.size(); i++){
        out.write("<div style=\"display:none\" class=\"projects\">");
        out.write("<h3 class=\"float\">" + projectList.get(i).getProjectname() + "</h3>");
        out.write("</div>");
      }
    %>
  <div class="clear">
    <input class="next-btn2" type="submit" name="decision" value="決定">
  </div>
  </form>
</div>
<%@include file="_footer.jsp" %>
</body>
</html>