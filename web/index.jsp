<%--
  Created by IntelliJ IDEA.
  User: Wang Genshen
  Date: 2017-04-02
  Time: 09:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
%>
<html>
  <head>
    <title>贷款计算器</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <meta name="keywords" content="贷款 贷款计算 贷款计算器">
    <meta name="description" content="贷款 贷款计算 贷款计算器">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <h1 class="col-sm-offset-5">贷款计算</h1>
          <form id="loanForm" class="form-horizontal">
            <span class="text-danger col-sm-offset-2" id="errMsg"></span>
            <div class="form-group">
              <label class="col-sm-2 control-label">总金额</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="total"> <span class="help-block m-b-none">请输入总金额数</span>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label">还款方式</label>

              <div class="col-sm-10">
                <select class="form-control" name="type">
                  <option value="ACPIM">等额本息</option>
                  <option value="ACM">等额本金</option>
                </select>
                <span class="help-block">请选择还款方式（等额本金还款方式总利息少）</span>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label">首付比例</label>

              <div class="col-sm-10">
                <select class="form-control" name="percent">
                  <option value="20">20%</option>
                  <option value="25">25%</option>
                  <option value="30">30%</option>
                  <option value="35">35%</option>
                  <option value="40">40%</option>
                  <option value="45">45%</option>
                  <option value="50">50%</option>
                  <option value="55">55%</option>
                  <option value="60">60%</option>
                  <option value="65">65%</option>
                  <option value="70">70%</option>
                  <option value="75">75%</option>
                  <option value="80">80%</option>
                  <option value="85">85%</option>
                  <option value="90">90%</option>
                  <option value="95">95%</option>
                </select>
                <span class="help-block">请选择首付比例</span>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label">贷款年利率</label>

              <div class="col-sm-10">
                <select class="form-control" name="rate">
                  <option value="4.35">4.35%</option>
                  <option value="4.75">4.75%</option>
                  <option value="4.9">4.9%</option>
                </select>
                <span class="help-block m-b-none">请选择贷款年利率</span>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label">还款期限</label>

              <div class="col-sm-10">
                <select class="form-control" name="year">
                  <option value="20">20年</option>
                  <option value="25">25年</option>
                  <option value="30">30年</option>
                  <option value="15">15年</option>
                  <option value="10">10年</option>
                  <option value="5">5年</option>
                </select>
                <span class="help-block">请选择还款期限</span>
              </div>
            </div>

            <div class="form-group">
              <div class="col-sm-4 col-sm-offset-2">
                <button class="btn btn-primary" type="button" onclick="calLoan();">开始计算</button>
              </div>
            </div>

          </form>
        </div>
      </div>

    </div>

    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script>
      function calLoan() {
          $("#errMsg").text("");
          $.post("<%=path %>/cal",
            $("#loanForm").serialize(),
              function (data) {
                if (data.result != undefined && data.result != null) {
                    $("#errMsg").text(data.message);
                } else if (data.loan != undefined && data.loan != null) {
                    // 生成table
                }
              }, "json"
          );
      }
    </script>

  </body>
</html>