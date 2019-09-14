<!-- 画面ID：k02g04	発注書編集画面 -->
<!-- 初期構築：2019/07/31 ChiZai Tagawa Yuji -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.ProjectInfo" %>
<%@ page import="dto.MenuInfo" %>
<%@ page import="dto.ProjectCookDisp" %>
<% ProjectInfo projectInfo = (ProjectInfo) session.getAttribute("projectInfo");%>
<% ArrayList<ProjectCookDisp> projectCookDispList = (ArrayList<ProjectCookDisp>) session.getAttribute("projectCookDispList");%>
<% int resultFlag = (int)request.getAttribute("resultFlag"); %>
<% String errMsg = (String)request.getAttribute("errMsg"); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="ProjectMenuChenge.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
    $('.checkAll').on('change', function() {
      $('.' + this.id).prop('checked', this.checked);
    });
  });
</script>
<link rel="stylesheet" href="header_footer.css">
<link rel="stylesheet" href="MainStyle.css">
  <link rel="stylesheet" href="TableStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>発注書編集画面</title>
</head>
<body>
  <%
    if(resultFlag == 1){
      out.write("<script>");
      out.write("alert('エラー！¥n発注書の出力に失敗しました。');");
      out.write("</script>");
    } else if(resultFlag == 0) {
      out.write("<script>");
      out.write("alert('デスクトップに発注書を出力しました。');");
      out.write("</script>");
    } else {
      // 処理なし
    }
  %>
  <%@include file="_header.jsp"%>
  <div id="main">
    <form method="post" action="Main">
      <input type = "hidden" name = "view" value = "Confirm">
      <input class="Return" type="submit" name="calculate" value="＜ 一覧に戻る">
    </form>
    <h3 class="title">発注書編集画面</h3>
      <%out.write(projectInfo.getProjectname());%><br>
      <%out.write(projectInfo.getStartdate());%>〜<%out.write(projectInfo.getEnddate());%><br>
      <%out.write(String.valueOf(projectInfo.getMember()));%>人
    <hr>
    <%
      if (!(errMsg.isEmpty()) && errMsg != null){
        out.write("<div class=\"alert\">");
        out.write(errMsg);
        out.write("</div>");
      }
    %>
    <form method="post" action="PurchaceOrder">
      <table>
        <tr>
          <th>Check!</th>
          <th>料理</th>
          <th>材料</th>
          <th>分量</th>
        </tr>
        <%
          int cnt = 0;
          for (int i = 0; i < projectCookDispList.size(); i++){
            out.write("<tr>");
            if(i == 0){
              cnt++;
              out.write("<td><input type=\"checkbox\" id=\"check_" + cnt + "\" class=\"checkAll\"></td>");
              out.write("<td colspan=\"3\">" + projectCookDispList.get(i).getMenuname() + "</td>");
            } else {
              if(projectCookDispList.get(i).getMenuid() != projectCookDispList.get(i-1).getMenuid()){
                  cnt++;
                  out.write("<td><input type=\"checkbox\" id=\"check_" + cnt + "\" class=\"checkAll\"></td>");
                  out.write("<td colspan=\"3\">" + projectCookDispList.get(i).getMenuname() + "</td>");
              } else {
                out.write("<td><input type=\"checkbox\" name=\"ingredientNames\" class=\"check_" + cnt + "\" value=\""
                  + projectCookDispList.get(i).getIngredientname() + ","
                  + projectCookDispList.get(i).getAmount()
                  + projectCookDispList.get(i).getUnit() + "\"></td>");
                out.write("<td></td>");
                out.write("<td>" + projectCookDispList.get(i).getIngredientname() + "</td>");
                out.write("<td>" + projectCookDispList.get(i).getAmount() + projectCookDispList.get(i).getUnit() + "</td>");
              }
            }
            out.write("</tr>");
          }
        %>
      </table>
      <input class="next-btn2" type="submit" name="output" value="出力する">
    </form>
  </div>
  <%@include file="_footer.jsp"%>
</body>
</html>