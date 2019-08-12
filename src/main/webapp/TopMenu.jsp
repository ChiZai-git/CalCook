<!-- 画面ID：k00g01	メニュー -->
<!-- 初期構築：2019/07/15 ChiZai Tagawa Yuji -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
  <link rel="stylesheet" href="header_footer.css">
  <link rel="stylesheet" href="MainStyle.css">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Home - Welcome to CalCook!</title>
</head>
<body>
<%@ include file="_header.jsp" %>

<div id="main">
  <h1 class="maintitle">Welcome to CalCook!</h1>

  <div class="select-box">
    <form method="post" action="Main">
      <input type="hidden" name="view" value="CookInfoInput">
      <input class="flat-btn" type="submit" value="作業する">
      <p>説明：料理の分量を計算して、プロジェクトに登録することができます。<br>
      　　　プロジェクトは下の「プロジェクトを登録する」から事前に登録してください。</p>
    </form>
  </div>
  <div class="select-box">
    <form method="post" action="Main">
      <input type="hidden" name="view" value="Confirm">
      <input class="flat-btn" type="submit" value="確認する">
      <p>説明：登録されている料理の確認、編集ができます。<br>
      　　　また、登録されている情報から発注書の出力もできます。</p>
    </form>
  </div>
  <hr>
  <form method="post" action="Main">
    <input type="hidden" name="view" value="NewProject">
    <input class="flat-btn" type = "submit"  value = "プロジェクトを登録する">
  </form>
</div>
<%@ include file="_footer.jsp" %>
</body>
</html>