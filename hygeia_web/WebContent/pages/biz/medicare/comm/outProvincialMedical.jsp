<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>

<%
	String path = request.getContextPath();
	String reportID = (String)request.getAttribute("reportID");
%>

<powersi:html>
<head>
<powersi:head title="结算单展示" target="_self" />
<script type="text/javascript" src="<%=path%>/resource/report/js/powerprint.min.js"></script>
<script type="text/javascript" src="<%=path%>/resource/report/js/LodopFuncs.js"></script>
<style type="text/css">
#frame_div {
	margin: 20px 0;
	width: 100%;
	height: auto;
	border: 1px solid #00F;
	overflow: auto;
}
</style>
</head>
<body>
	<powersi:form id="settlementReportForm" namespace="/common"
		action="SettlementReportAction!settlementReport.action">
		<powersi:panelbox key="结算单操作">
			<powersi:panelbox-toolbar>
				<powersi:buttons>
					<powersi:button id="printsettlementreportid" value="打印结算单"
						onclick="printsettlementreport()" />
				</powersi:buttons>
			</powersi:panelbox-toolbar>
			<powersi:editorlayout>
				<powersi:editorlayout-row>
					<powersi:hidden id="reportIDfirst" name="reportIDfirst" />
					<powersi:hidden id="reportIDsecond" name="reportIDsecond" />
				</powersi:editorlayout-row>
			</powersi:editorlayout>
		</powersi:panelbox>
		<powersi:groupbox title="结算单信息">
			<div id="frame_div">
				<div id="settlementReportdivid"
					style="margin-left: 2%; margin-right: -20%;"></div>
			</div>
		</powersi:groupbox>
	</powersi:form>
	<powersi:errors />
	<script type="text/javascript">
		var powerPrint = null; //打印对象
		var reportID = "<%=reportID%>";//报表ID
		$("#reportIDfirst").val(reportID);
		$(document).ready(function() {
			querysettlementfirst();
		});

		function loadHtml() {
			if (powersi.isnull(reportID)) {
				return;
			}
			$("#settlementReportdivid").load(
					"${rootPath}/downloadReportHtmlServlet.download?reportID="
							+ reportID, function(response, status, xhr) {
						if (status != "success") {
							$("#settlementReportdivid").html("加载失败");
							return;
						}
						powerPrint = $("#settlementReportdivid").PowerPrint({
							name : '医保结算单'
						});
					});
		}

		function querysettlementfirst() {
			reportID = $("#reportIDfirst").val();
			if (powersi.isnull(reportID)) {
				return;
			}
			loadHtml();
		}

// 		function querysettlementsecond() {
// 			reportID = $("#reportIDsecond").val()
// 			if (powersi.isnull(reportID)) {
// 				return;
// 			}
// 			loadHtml();
// 		}

		function downloadsettlementreport() {
			if (powersi.isnull(reportID)) {
				return;
			}
			location.href = "${rootPath}/downloadReportFileServlet.download?reportID="
					+ reportID;
		}

		function printsettlementreport() {
			if (powerPrint == null) {
				return;
			}
			 
			powerPrint.preview();
		}
	</script>
</body>
</powersi:html>