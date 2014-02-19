<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>打印单据</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="/Content/PrintReport/CreateControl.js"></script>
    <script src="/Content/PrintReport/GRInstall.js"></script>
    <script type="text/javascript">
        Install_InsertReport();
    </script>
    <style type="text/css">
        html, body {
            margin: 0;
            height: 100%;
        }
    </style>
</head>
<body>
    <script type="text/javascript">
        var Installed = Install_Detect();
    </script>


    <script type="text/javascript">
        var Report = "ProductsBarCode.grf";
        if (Report != "")
            Report = "/Content/PrintReport/" + Report + "?RAND=" + Math.random();

        var Data = "/PrintReportData/PrintProductsBarCode?Paras=932572a2-7dad-439c-b417-b67e60a33adb%3b6bc4be37-03ab-431c-a492-511376ad1d7b%3b%3b%3b%3b%3b%3bundefined";
        CreatePrintViewerEx("100%", "100%", Report, Data, true, "");
        //开启报表生成进度条显示
        ReportViewer.Report.ShowProgressUI = true;
    </script>
</body>
</html>
