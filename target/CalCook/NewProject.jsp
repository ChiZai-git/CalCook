<!-- 画面ID：kXXgXX	登録プロジェクト確認画面 -->
<!-- 初期構築：2019/07/15 ChiZai Tagawa Yuji -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% int member = (int)request.getAttribute("member"); %>
<% String errMsg = (String)request.getAttribute("errMsg"); %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="header_footer.css">
  <link rel="stylesheet" href="MainStyle.css">
  <meta charset="UTF-8">
  <title>新プロジェクト作成画面</title>
</head>
<body>
<%@include file="_header.jsp"%>
<div id="main">
  <form method="post" action="Main">
    <input type="hidden" name="view" value="home">
    <input class="Return" type="submit" name="calculate" value="＜ 戻る">
  </form>
  <h3 class="title">新プロジェクト作成画面</h3>
  <p>説明：*印がついている箇所は入力必須項目です。</p>
    <%
      if (!(errMsg.isEmpty()) && errMsg != null){
        out.write("<div class=\"alert\">");
        out.write(errMsg);
        out.write("</div>");
      }
    %>
  <form method="post" action = "NewProject">
    <label for="projectname">*プロジェクト名：</label>
    <input type="text" name="projectname"><br>
    <label for="member">参加者：</label>
    <input type="number" name="member" min="0" <% out.write("value=\"" + member + "\"");%>><br>
    <label for="startday">開始日：</label>
    <input type="date" name="startday"
    ><br>
    <label for="endday">終了日：</label>
    <input type="date" name="endday"
    ><br>
    <input type="hidden" name="view" value="CheckProject">
    <input type = "submit" value = "次へ">
  </form>
</div>
<%@include file="_footer.jsp"%>
</body>
</html>