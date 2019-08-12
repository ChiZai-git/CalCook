<!-- 画面ID：k01g02	料理検索画面 -->
<!-- 初期構築：2019/07/15 ChiZai Tagawa Yuji -->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.IngredientDispInfo"%>
<% String cookName = (String)request.getAttribute("cookName"); %>
<% String errMsg = (String)request.getAttribute("errMsg"); %>
<% String ingredientName = (String)request.getAttribute("ingredientName"); %>
<% ArrayList<IngredientDispInfo> ingredientDispInfoList
			= (ArrayList<IngredientDispInfo>) request.getAttribute("ingredientDispInfoList");%>
<!DOCTYPE HTML>
<html>
<head>
  <script type="text/javascript" src="SelectDisp.js"></script>
  <link rel="stylesheet" href="header_footer.css">
  <link rel="stylesheet" href="MainStyle.css">
  <link rel="stylesheet" href="TableStyle.css">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>料理検索画面</title>
</head>
<body>
<%@include file="_header.jsp"%>
<div id="main">
  <form method="post" action="CookSearch">
    <input class="Return" type="submit" name="decision" value="＜ 戻る">
  </form>
  <h3 class="title">料理検索画面</h3>
  <p>説明：~~~~~</p>
  <form method="post" action="CookSearch">

  <label for="cookName">料理名</label>
  <input type="text" name="cookName"
    <%
      if (cookName != "" || cookName != null) {
        out.write("value=\"" + cookName + "\"");
      }
    %>>
  <label for="ingredientName">材料名</label>
  <input type="text" name="ingredientName"
    <%
      if (ingredientName != "" || ingredientName != null) {
        out.write("value=\"" + ingredientName + "\"");
      }
    %>>
  <input type="submit" name="search" value="検索">
  </form>
  <form method="post" action="CookSearch">
  <hr>
    <table>
      <tr>
        <th>No.</th>
        <th>料理名</th>
        <th>材料名</th>
        <th>選択</th>
      </tr>
      <%
        if (ingredientDispInfoList != null || ingredientDispInfoList.size() == 0) {
          for (int i = 0; i < ingredientDispInfoList.size(); i++) {
            out.write("<tr>");
            out.write("<td class=\"center\"><label for=\"cookName" + i + "\">" + (i + 1) + "</label></td>");
            out.write("<td><label for=\"cookName" + i + "\">" + ingredientDispInfoList.get(i).getMenuName() + "</label></td>");
            out.write("<td><label for=\"cookName" + i + "\">" + ingredientDispInfoList.get(i).getIngredientDisps() + "</label></td>");
            out.write("<td class=\"center\"><input onclick=\"SelectDisp1('" + i + "')\" id = \"cookName" + i + "\" type=\"radio\" name=\"cookName\" value=\""
              + ingredientDispInfoList.get(i).getMenuName() + "\"></td>");
            out.write("</tr>");
          }
        }
      %>
    </table>
    <%
      if (!(errMsg.isEmpty()) && errMsg != null){
        out.write("<div class=\"alert\">");
        out.write(errMsg);
        out.write("</div>");
      }
    %>
    <h4 class="float">選択した料理：</h4>
    <%
      for(int i = 0; i < ingredientDispInfoList.size(); i++){
        out.write("<div style=\"display:none\" class=\"cooks\">");
        out.write("<h3 class=\"float\">" + ingredientDispInfoList.get(i).getMenuName() + "</h3>");
        out.write("</div>");
      }
    %>
  <div class="clear">
    <input class="next-btn2" type="submit" name="decision" value="決定">
  </div>
  </form>
</div>
<%@ include file="_footer.jsp" %>
</body>
</html>