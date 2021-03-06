<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%
	//NTS20051900637 业务系统增加超范围用药标识传输 杨世明 20200520
%>
<powersi:html>
<head>
<powersi:head title="家庭病床记帐" />
<script type="text/javascript" src="${rootPath}/resource/js/clinicUtils.js"></script>
<%@ include file="/pages/util/header/combogrid.jsp"%>
<style>
.showpay {
	height: 30px !important;
	font-size: 20px !important;
	text-align: right !important;
}
</style>
</head>
<body>
	<powersi:form id="inputFeeHomeSickbed" namespace="/inhospital"
		action="InhospitalManagerAction!inputFeeHomeSickbed.action">
		<powersi:panelbox key="查询条件">
			<powersi:panelbox-toolbar>
				<powersi:button id="btSelectFee" label="查询费用" onclick="selectFee()" key="button_query"/>
				<powersi:button id="btSaveFee" label="保存费用" onclick="saveFee()" key="button_save_register"/>
				<powersi:button id="btTryCalcTreat" label="试算费用"
					onclick="tryCalcTreatHomeSickbed()" key="button_calc0"/>
				<powersi:button id="btFeeReset" label="重置" onclick="feeReset()" key="button_reset"/>
				<powersi:reset id="btReset" label="重置" cssStyle="display:none;" />
			</powersi:panelbox-toolbar>
			<powersi:editorlayout cols="10%,10%,15%,8%,12%,8%,12%,10%,15%">
				<powersi:editorlayout-row>
					<powersi:codeselect id="argName" name="inHospitalDTO.argName"
						label="" cssClass="select2" 
						list="#{'akc190':'住院号','aac002':'社会保障号','aaz217':'就医登记号' }" />
					<td>
						<powersi:textfield id="querystring" name="inHospitalDTO.querystring" title="请输入信息回车"
						placeholder="请输入信息回车！" readonly="false" onkeyup="findAaz217HomeSickbed()" buttonDisabled="false" />
					</td>
					<powersi:textfield id="aac002" name="inHospitalDTO.aac002"
						label="社会保障号" readonly="true" />
					<powersi:textfield id="bka008" name="inHospitalDTO.bka008"
						label="单位名称" readonly="true" />
					<powersi:textfield id="aac003" name="inHospitalDTO.aac003"
						label="姓名" readonly="true" />
				</powersi:editorlayout-row>
			</powersi:editorlayout>
		</powersi:panelbox>
		<powersi:panelbox key="业务信息">
		<powersi:editorlayout cols="8">
				<powersi:editorlayout-row>
					<powersi:hidden id="caa027" name="inHospitalDTO.caa027" value="4303-zg"/>
					<powersi:hidden id="aaa027" name="inHospitalDTO.aaa027" />
					<powersi:hidden id="baa027" name="inHospitalDTO.baa027" />
					<powersi:hidden id="aae140" name="inHospitalDTO.aae140" />
					<powersi:hidden id="kcd1id" name="inHospitalDTO.kcd1id" />
					<powersi:hidden id="bka001" name="inHospitalDTO.bka001" />
					<powersi:hidden id="feeinfo" name="feeinfo" />
					<powersi:hidden id="bke548" name="inHospitalDTO.bke548" />
					<powersi:hidden id="bke548" name="inHospitalDTO.bke548" />
					<powersi:hidden id="aka130" name="inHospitalDTO.aka130" />
					<powersi:hidden id="bacu18Hid" name="bacu18Hid" />
					
					<powersi:textfield id="aac004_name" name="inHospitalDTO.aac004_name" label="性  别" readonly="true" />
					<powersi:textfield id="aac001" name="inHospitalDTO.aac001" label="电脑号" readonly="true" />
					<powersi:textfield id="baa027_name" name="inHospitalDTO.baa027_name" label="人员所属中心" readonly="true" />
					<powersi:textfield id="akb021" name="inHospitalDTO.akb021" label="医院名称" readonly="true" />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:textfield id="aka130_name" name="inHospitalDTO.aka130_name" label="业务类型" readonly="true" />
					<powersi:textfield id="aae140_name" name="inHospitalDTO.aae140_name" label="险种类型" readonly="true" />
					<powersi:textfield id="bka006_name" name="inHospitalDTO.bka006_name" label="待遇类型" readonly="true" />
					<powersi:textfield id="aac006"      name="inHospitalDTO.aac006" label="出生日期" readonly="true" />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:textfield id="bka035_name" name="inHospitalDTO.bka035_name" label="人员类别" readonly="true" />
					<powersi:textfield id="bka020" name="inHospitalDTO.bka020" label="入院科室" readonly="true" />
					<powersi:textfield id="bka022" name="inHospitalDTO.bka022" label="入院病区" readonly="true" />
					<powersi:textfield id="akc190" name="inHospitalDTO.akc190" label="住院号" readonly="true" />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:textfield id="aaz217" name="inHospitalDTO.aaz217" label="就医登记号" readonly="true" />
					<powersi:textfield id="aae030" name="inHospitalDTO.aae030" label="入院日期" readonly="true" />
					<powersi:textfield id="bkz101" name="inHospitalDTO.bkz101" label="入院诊断" readonly="true" />
					<powersi:textfield id="ake022_name" name="inHospitalDTO.ake022_name" label="主治医生" readonly="true" />
				</powersi:editorlayout-row>
			</powersi:editorlayout>
		</powersi:panelbox>
	</powersi:form>
	<powersi:panelbox cssStyle="display:none;">
		<powersi:form id="feeformHomeSickbed" namespace="/inhospital"
			action="InhospitalManagerAction!feeSelectHomeSickbed.action">
			<powersi:hidden id="kcd1id_hid" name="inHospitalDTO.kcd1id_hid" />
			<powersi:hidden id="aaz217_hid" name="inHospitalDTO.aaz217_hid" />
		</powersi:form>
	</powersi:panelbox>
	<powersi:panelbox key="费用明细">
		<powersi:panelbox-toolbar>
			<powersi:button id="btn_enter"  key="button_ok"      onclick="insertfee()" />
			<powersi:button id="btn_delete" key="button_delete"  onclick="deletefee()" />
		</powersi:panelbox-toolbar>
		<powersi:editorlayout cols="4%,7%,1%,10%,4%,8%,5%,8%,5%,8%,6%,8%,8%,5%,4%,9%">
			<powersi:editorlayout-row>
				<powersi:codeselect id="sidx" name="inHospitalDTO.searchType"
					label="查询码" codeType="sidx" onchange="changeSearchType(this)"
					displayonly="false" />
				<powersi:textfield id="stext" name="stext" label="" maxlength="30"
					readonly="false" />
				<powersi:hidden id="bkc194" name="bkc194" />
				<powersi:hidden id="bkc109" name="bkc109" />
				<powersi:hidden id="ake001" name="ake001" />
				<powersi:hidden id="aka065" name="aka065" />
				<powersi:hidden id="ake003" name="ake003" />
				<powersi:hidden id="ake005" name="ake005" />
				<powersi:textfield id="ake006" name="ake006" label="名称"
					disabled="true" />
				<powersi:hidden id="bka052" name="bka052" />
				<powersi:hidden id="bka054" name="bka054" />
				<powersi:hidden id="bka053" name="bka053" />
				<powersi:hidden id="aka057" name="aka057" />
				<powersi:textfield id="bka040" name="bka040" label="单价" onkeyup="num(this)"
					onkeydown="dealKeyDown(this)" required="true" />
				<powersi:textfield id="akc226" name="akc226" label="数量" onkeyup="num(this)"
					onkeydown="dealKeyDown(this)" required="true" />
				<powersi:textfield id="aae019" name="aae019" label="金额" readonly="true"
					onkeydown="dealKeyDown(this)" required="true" />
				<td>
					<label for="bkz103" class="textLabel">
						<span class="required requiredLabel">*</span>
						<span>超范围用药</span>
					</label>
				</td>
				<td>
					<select id="bkz103" name="bkz103" onkeydown="dealKeyDown(this)">
						<option value="0">否</option>
						<option value="1">是</option>
					</select>
				</td>
				<powersi:textfield id="ake007" name="ake007" label="日期" mask="date"
					onchange="onchangeAke007(this)" readonly="false" required="true" />
			</powersi:editorlayout-row>
		</powersi:editorlayout>
<%-- 		<powersi:panelbox key="查询费用条件"> --%>
<%-- 			<powersi:form id="feeform" namespace="/inhospital" action="InhospitalManagerAction!feeSelect.action"> --%>
<%-- 				<powersi:editorlayout cols="5%,8%,8%,11%,8%,11%,5%,10%,8%,11%,5%,10%"> --%>
<%-- 					<powersi:editorlayout-row> --%>
<%-- 						<powersi:textfield id="ake006" name="inHospitalDTO.ake006" --%>
<%-- 							label="名称" /> --%>
<%-- 						<powersi:textfield id="aae030_1" name="inHospitalDTO.aae030" --%>
<%-- 							label="开始日期" mask="date" /> --%>
<%-- 						<powersi:textfield id="aae031" name="inHospitalDTO.aae031" --%>
<%-- 							label="结束日期" mask="date" /> --%>
<%-- 						<powersi:codeselect id="aka063" name="inHospitalDTO.aka063" --%>
<%-- 							label="类型" cssClass="select1" codeType="aka063" --%>
<%-- 							required="false" displayonly="false" showValue="true" --%>
<%-- 							headerKey="" headerValue="" /> --%>
<%-- 					    <powersi:codeselect id="bka075" name="inHospitalDTO.bka075" --%>
<%-- 						    label="处方医师" cssClass="select2" list="#request.bka075List" --%>
<%-- 						    headerKey="" headerValue="请选择..." showValue="false"  onchange="getvalue();"/> --%>
<!-- 						<td class="tdLabel">排序</td> -->
<!-- 					    <td> <select id="sorder" name="inHospitalDTO.tipsinfo" class="select"> -->
<!-- 					          <option value="by_bka051_1">费用倒序</option> -->
<!-- 					          <option value="by_bka051_2">费用正序</option> -->
<!-- 					        </select> </td> -->
<%-- 					</powersi:editorlayout-row> --%>
<%-- 				</powersi:editorlayout>			 --%>
<%-- 				<powersi:hidden id="kcd1id_hid" name="inHospitalDTO.kcd1id_hid" /> --%>
<%-- 				<powersi:hidden id="aaz217_hid" name="inHospitalDTO.aaz217_hid" /> --%>
<%-- 			</powersi:form> --%>
<%-- 		</powersi:panelbox> --%>
		<powersi:datagrid id="grid" formId="feeformHomeSickbed" delayLoad="true"
			showReload="false" autoWidth="true" enabledSort="false"
			alternatingRow="true" checkbox="true" colDraggable="false"
			totalRender="renderTotal" pageSize="30"  height="300">
			<powersi:datagrid-column name="bkc194" display="匹配ID" width="1%"
				hide="true" />
			<powersi:datagrid-column name="bkc109" display="异名ID" width="1%"
				hide="true" />
			<powersi:datagrid-column name="aka065" code="aka065" display="等级"
				width="6%" />
			<powersi:datagrid-column name="ake003" code="ake003" display="类别"
				width="6%" />
			<powersi:datagrid-column name="ake005" display="编码" width="10%" />
			<powersi:datagrid-column name="ake006" display="名称" width="17%" />
			<powersi:datagrid-column name="bka053" display="厂家" width="15%" />
			<powersi:datagrid-column name="bka052" code="bka052" display="剂型"
				width="6%" />
			<powersi:datagrid-column name="bka054" display="规格" width="6%" />
			<powersi:datagrid-column name="bka040" display="单价" width="6%" />
			<powersi:datagrid-column name="akc226" display="数量" width="6%" />
			<powersi:datagrid-column name="aae019" display="金额" width="6%" />
			<powersi:datagrid-column name="bkz103" display="超范围用药" width="6%" render="renderBkz103"/>
			<powersi:datagrid-column name="ake007" display="日期" width="8%" />
			<powersi:datagrid-column name="aka057" display="先自付比例" width="6%" />
			<powersi:datagrid-column name="bka892" display="保存标识" width="1%"
				hide="true" />
			<powersi:datagrid-column name="ake001" display="中心目录编码" width="1%"
				hide="true" />
		</powersi:datagrid>
	</powersi:panelbox>
	<powersi:panelbox key="结算信息">
		<powersi:editorlayout cols="8">
			<powersi:editorlayout-row>
			<powersi:hidden id="akb066" name="inHospitalDTO.akb066" label="个账支付" />
				<powersi:textfield id="akc264" name="inHospitalDTO.akc264"
					label="总的费用" cssClass="showpay" value="0.00" disabled="true" />
				<powersi:textfield id="bka832" name="inHospitalDTO.bka832"
					label="基金支付" cssClass="showpay" value="0.00" disabled="true" />
				<powersi:textfield id="bka831" name="inHospitalDTO.bka831"
					label="自付金额" cssClass="showpay" value="0.00" disabled="true" />
				<powersi:textfield id="cash_pay_own"
					name="inHospitalDTO.cash_pay_own" label="自费金额" cssClass="showpay"
					value="0.00" disabled="true" />
			</powersi:editorlayout-row>
			<powersi:editorlayout-row>
				<powersi:textfield id="aka151" name="inHospitalDTO.aka151"
					label="起付金额" cssClass="showpay" value="0.00" disabled="true" />
				<powersi:textfield id="bka842" name="inHospitalDTO.bka842"
					label="医院垫付" cssClass="showpay" value="0.00" disabled="true" />
				<powersi:textfield id="aae240" name="inHospitalDTO.aae240"
					label="个账支付" cssClass="showpay" value="0.0" disabled="true" />
				<powersi:textfield id="akb067" name="inHospitalDTO.akb067"
					label="现金支付" cssClass="showpay" value="0.00" disabled="true" />
			</powersi:editorlayout-row>
			<%-- <powersi:editorlayout-row>
				<powersi:textfield id="todayCollect" label="今收取" cssClass="showpay"
					value="0.00" onkeydown="dealKeyDown(this)" name="todayCollect" />
				<powersi:textfield id="needFind" label="需找回" cssClass="showpay"
					value="0.00" disabled="true" />
			</powersi:editorlayout-row> --%>
		</powersi:editorlayout>
	</powersi:panelbox>
	<powersi:errors />
	<script type="text/javascript">
		var actionUrl = "${rootPath}/common/CommonManagerAction!chooseHospitalCatalogMatched.action?searchType=py&ake007="
				+ $("#ake007").val();

		$(document).ready(function() {
			$("#querystring").focus();
			feeItemReset();
			$("#stext").combogrid({
				minLength : 1,
				autoChoose : false,
				searchIcon : true,
				alternate : true,
				width : "650px",
				url : actionUrl,
				colModel : [ {'columnName' : 'rownumber', 'width' : '4', 'label' : '#'}, {
					"columnName" : "aka065_name",
					"width" : "8",
					"label" : "等级"
				}, {
					"columnName" : "ake005",
					"width" : "20",
					"label" : "编码"
				}, {
					"columnName" : "ake006",
					"width" : "30",
					"label" : "名称"
				}, {
					"columnName" : "bka040",
					"width" : "12",
					"label" : "单价"
				}, {
					"columnName" : "bka052_name",
					"width" : "12",
					"label" : "剂型"
				}, {
					"columnName" : "bka054",
					"width" : "14",
					"label" : "规格"
				} ],
				select : function(event, ui) {
					var data = ui.item;
					$("#bkc194").val(data["bkc194"]);//匹配ID
					$("#bkc109").val(data["bkc109"]);//异名ID
					$("#ake001").val(data["ake001"]);//中心目录编码
					$("#aka065").val(data["aka065"]);//收费项目等级编码(等级)
					$("#ake003").val(data["ake003"]);//三大目录类别编码(类别)					
					$("#ake005").val(data["ake005"]);//医疗机构三大目录编码(编码)
					$("#ake006").val(data["ake006"]);//医疗机构三大目录名称(名称)
					$("#bka052").val(data["bka052"]);//医院目录剂型(剂型)
					$("#bka054").val(data["bka054"]);//医院目录规格(规格)
					$("#bka053").val(data["bka053"]);//医院目录厂家(厂家)
					$("#bka040").val(data["bka040"]);//医院目录单价(单价)
					$("#aka057").val(data["aka057"]);//先自付比例
					$("#bka040").focus();
					return false;
				}
			});
		});

		function findAaz217HomeSickbedByBka100() {
			var inputFeeData = $("#inputFeeHomeSickbed").serialize();
			postJSON(
					"${rootPath}/inhospital/InhospitalManagerAction!findAaz217HomeSickbed.action",
					inputFeeData, function(json) {
						if (!checkJSONResultNew(json)) {
							return;
						}
						$.each(json.data, function(key, value) {
							if (!powersi.isnull(value)) {
								$("#" + key).val(value);
							}
						});
						$("#btSaveFee").prop("disabled", false);
					});
		}

		function renderTotal(allData, currentData) {
			var money = 0;
			var price = 0;
			var usage = 0;
			var kinds = {};
			if (powersi.rows_length(allData['rows'])) {
				$.each(allData['rows'], function(n, row) {
					if (row['__status'] !== "delete") {
						price += parseFloat(row['bka040']);
						usage += parseFloat(row['akc226']);
						money += parseFloat(row['aae019']);
						kinds[row['ake005']] = '';
					}
				});
			}
			var a = [];
			a.push('<div class="divCenter textSuccess">');
			a.push('<span>');
			a.push('总的金额：<b>');
			a.push(money.toFixed(2));
			a.push('</b>');
			a.push('</span>');
			a.push('&nbsp;&nbsp;');
			a.push('<span>');
			a.push('总的用量：<b>');
			a.push(usage.toFixed(2));
			a.push('</b>');
			a.push('</span>');
			a.push('&nbsp;&nbsp;');
			a.push('<span>');
			a.push('共 <b>');
			a.push(powersi.length(kinds));
			a.push('</b> 项费用');
			a.push('</span>');
			a.push('</div>');
			return a.join('');
		}

		/*查询就医登记信息*/
		function findAaz217HomeSickbed() {
			if (window.event.keyCode == 13) {
				$("#bke548").val("");
				var querystring = powersi.trim($("#querystring").val());
				var argName = $("#argName").val();
				feeReset();
				$("#argName").val(argName);
				$("#argName").change();
				$("#querystring").val(querystring);
				if (powersi.isnull(querystring)) {
					return;
				}
				postJSON(
						"${rootPath}/inhospital/InhospitalManagerAction!findAaz217HomeSickbed.action",
							{"inHospitalDTO.querystring" : querystring,
							     "inHospitalDTO.argName" : argName
							}, function(json) {
							if (!checkJSONResultNew(json)) {
								return;
							}
							$.each(json.data, function(key, value) {
								if (!powersi.isnull(value)) {
									$("#" + key).val(value);
								}
							});
							$("#btSaveFee").prop("disabled", false);
							if("310"==$("#aae140").val()){
								$("#aae240").prop("disabled", false);
							}else{
								$("#aae240").prop("disabled", true);
							}
							$("#bacu18Hid").val($("#bacu18").val());
						});
			}
		}

		/*查询已保存的费用*/
		function selectFee() {
			var kcd1id_hid = powersi.trim($("#kcd1id_hid").val());
			if (powersi.isnull(kcd1id_hid)) {
				return;
			}
			var aaz217_hid = powersi.trim($("#aaz217_hid").val());
			if (powersi.isnull(aaz217_hid)) {
				return;
			}
			$("#feeformHomeSickbed").submit();
		}

		/*重置界面*/
		function feeReset() {
			$("#btReset").click();
			$("#kcd1id_hid").val("");
			$("#aaz217_hid").val("");
			$("#querystring").val("");
			$("#argName").val("akc190");
			$("#argName").change();
			grid.reset();
			feeItemReset();
			$("#btSaveFee").prop("disabled", false);
		}

		/*支付金额重置*/
		function feeItemReset() {
			$("#akc264").val("0.0");
			$("#bka832").val("0.0");
			$("#bka831").val("0.0");
			$("#cash_pay_own").val("0.0");
			$("#aka151").val("0.0");
			$("#bka842").val("0.0");
			$("#akb066").val("0.0");
			$("#akb067").val("0.0");
			$("#todayCollect").val("0.0");
			$("#needFind").val("0.0");
			$("#aae240_show").val("0.0");
		}

		/*保存费用*/
		function saveFee() {
			if (grid.getRowsCount() <= 0) {
				alert("请先录入费用");
				return;
			}
			var feeinfo = grid.getData();
			feeinfo = powersi.tostring(feeinfo);
			$("#feeinfo").val(encodeURI(feeinfo));
			$("#btSaveFee").prop("disabled", true);
			var saveItemData = $("#inputFeeHomeSickbed").serialize();
			postJSON(
					"${rootPath}/inhospital/InhospitalManagerAction!inputFeeHomeSickbed.action",
					saveItemData, importFeeSaveInfo);
		}

		function importFeeSaveInfo(json) {
			$("#btSaveFee").prop("disabled", false);
			if (!checkJSONResultNew(json)) {
				return;
			}
			$("#btSaveFee").prop("disabled", true);
			$("#btTryCalcTreat").prop("disabled", false);
			if (!powersi.isnull(json.message)) {
				popupInfo(json.message);
			}
		}

		/*费用计算(试算)*/
		function tryCalcTreatHomeSickbed() {
			var kcd1id = powersi.trim($("#kcd1id").val());
			if (powersi.isnull(kcd1id)) {
				return;
			}
			var aaz217 = powersi.trim($("#aaz217").val());
			if (powersi.isnull(aaz217)) {
				return;
			}
			var aae240 = powersi.trim($("#aae240").val());
			var aae240Show = powersi.trim($("#aae240_show").val());
			feeItemReset();
			$("#aae240_show").val(aae240Show);
			$("#btTryCalcTreat").prop("disabled", true);
			postJSON(
					"${rootPath}/inhospital/InhospitalManagerAction!tryCalcTreatHomeSickbed.action?inHospitalDTO.kcd1id="
							+ kcd1id + "&inHospitalDTO.aaz217=" + aaz217 + "&inHospitalDTO.aae240=" + aae240,
					function(json) {
						$("#btTryCalcTreat").prop("disabled", false);
						if (!checkJSONResultNew(json)) {
							return;
						}
						if (json.data != "no") {
							$.each(json.data, function(key, value) {
								if (!powersi.isnull(value)) {
									$("#" + key).val(value);
								}
							});
						}
						if (!powersi.isnull(json.message)) {
							popupInfo(json.message);
						}
						var bacu18 = $("#bacu18Hid").val();
						var aae240 = $("#aae240").val();
						if(parseFloat(bacu18)>parseFloat(aae240)){
							$("#bacu18").val((parseFloat(bacu18)-parseFloat(aae240)).toFixed(2));
						}else{
							$("#bacu18").val("0.0");
						}
						//showMoney();
					});
		}

		function changeSearchType(sidx) {
			actionUrl = "${rootPath}/common/CommonManagerAction!chooseHospitalCatalogMatched.action?searchType="
					+ sidx.value + "&ake007=" + $("#ake007").val();
			$("#stext").combogrid("option", "url", actionUrl);
		}

		function onchangeAke007(para) {
			var ake007 = $("#ake007").val();
			var bka017 = $("#bka017").val();
			if (ake007 < bka017) {
				alert("费用日期不能小于入院日期");
				return $("#ake007").focus();
			}
			actionUrl = "${rootPath}/common/CommonManagerAction!chooseHospitalCatalogMatched.action?searchType="
					+ $("#sidx").val() + "&ake007=" + $("#ake007").val();
			$("#stext").combogrid("option", "url", actionUrl);
		}

		function dealKeyDown(para) {
			if (window.event.keyCode == "13") {
				var fieldName = para.id;
				if ("bka040" == fieldName) {
					var bka040 = $("#bka040").val();
					if (isNaN(bka040)) {
						alert("单价不能为字符");
						return $("#bka040").focus();
					}
					if (!powersi.isnull(bka040)) {
						if (parseFloat(bka040) <= 0) {
							alert("单价不能小于等于0");
							return $("#bka040").focus();
						}
					}
					return $("#akc226").focus();
				}
				if ("akc226" == fieldName) {
					var bka040 = $("#bka040").val();
					var akc226 = $("#akc226").val();
					if (isNaN(akc226)) {
						alert("数量不能为字符");
						return $("#akc226").focus();
					}
					if (!powersi.isnull(akc226)) {
						if (parseFloat(akc226) == 0) {
							alert("数量不能等于0");
							return $("#akc226").focus();
						}
					}
					if (!powersi.isnull(bka040) && !powersi.isnull(akc226)) {
						$("#aae019").val(
								(parseFloat(bka040) * parseFloat(akc226))
										.toFixed(2));
					}
					return $("#aae019").focus();
				}
				if ("aae019" == fieldName) {
					var aae019 = $("#aae019").val();
					if (isNaN(aae019)) {
						alert("金额不能为字符");
						return $("#aae019").focus();
					}
					if (!powersi.isnull(aae019)) {
						if (parseFloat(aae019) === 0) {
							alert("金额不能等于0");
							return $("#aae019").focus();
						}
					}
					return $("#bkz103").focus();
				}

				if("bkz103" === fieldName){
					insertfee();
				}
				if ("todayCollect" === fieldName) {
					showMoney();
				}
			}
		}

		function insertfee() {
			if (powersi.isnull($("#ake006").val())) {
				alert("未录入药品");
				return;
			}
			if (powersi.isnull($("#aae019").val())) {
				alert("未录入金额");
				return;
			}
			if (parseFloat($("#aae019").val()) == 0) {
				alert("金额不能等于0");
			}
			if (isNaN($("#aae019").val()) * 1) {
				alert("金额输入有误");
				$("#aae019").focus();
				return;
			}
			var bkc194 = $("#bkc194").val();
			var bkc109 = $("#bkc109").val();
			var ake001 = $("#ake001").val();
			if (powersi.isnull($("#aka065").val())) {
				alert("收费项目等级不能为空");
				return;
			}
			var aka065 = $("#aka065").val();
			var ake003 = $("#ake003").val();
			var ake005 = $("#ake005").val();
			var ake006 = $("#ake006").val();
			var bka053 = $("#bka053").val();
			var bka052 = $("#bka052").val();
			var bka054 = $("#bka054").val();
			var bka040 = parseFloat($("#bka040").val());
			var akc226 = parseFloat($("#akc226").val());
			var input_ver = (parseFloat($("#aae019").val()) * 1.0000)
					.toFixed(2);
			var ake007 = $("#ake007").val();
			var aka057 = $("#aka057").val();
			var bka892 = "0";
			var bkz103 = $("#bkz103").val();
			var jsonFee = {
				"bkc194" : bkc194,
				"bkc109" : bkc109,
				"ake001" : ake001,
				"aka065" : aka065,
				"ake003" : ake003,
				"ake005" : ake005,
				"ake006" : ake006,
				"bka053" : bka053,
				"bka052" : bka052,
				"bka054" : bka054,
				"bka040" : bka040,
				"akc226" : akc226,
				"aae019" : input_ver,
				"ake007" : ake007,
				"aka057" : aka057,
				"bka892" : bka892,
				"bkz103" : bkz103
			};
			grid.add(jsonFee);
			$("#stext").focus();
			$("#stext").val("");
			$("#bkc194").val("");
			$("#bkc109").val("");
			$("#ake001").val("");
			$("#aka065").val("");
			$("#ake003").val("");
			$("#ake005").val("");
			$("#ake006").val("");
			$("#bka053").val("");
			$("#bka052").val("");
			$("#bka054").val("");
			$("#bka040").val("");
			$("#akc226").val("");
			$("#aae019").val("");
			$("#aka057").val("");
			$("#bkz103").val("0");
		}

		function deletefee() {
			if (typeof (grid.getSelectedRows()) == "undefined"
				|| grid.getSelectedRows() == null
				|| grid.getSelectedRows() == "") {
				popupAlert("请选择要删除的费用！");
				return;
			}
			popupConfirm("是否删除已选择的费用?", "提示", function(isOk){
				if (isOk) {
					var rows = grid.getSelectedRows();
					valideDel(grid.getSelectedRows())
					//valideDelFeeSetMeal(grid.getSelectedRows())
				}
			});
		}
		
		function showMoney(){
			var todayCollect = $("#todayCollect").val();
			var bka831 = $("#bka831").val();
			var bka245 = $("#bka245").val();
			if (isNaN(todayCollect)) {
				alert("今收取金额不能为字符");
				return $("#todayCollect").focus();
			}
			if (parseFloat(todayCollect) < 0) {
				alert("今收取金额不能小于0");
				return $("#todayCollect").focus();
			}
			if (powersi.isnull(todayCollect)) {
				todayCollect = 0;
			}
			if (powersi.isnull(bka245)) {
				bka245 = 0.0;
			}
			$("#needFind").val(
					(parseFloat(bka245) + parseFloat(todayCollect) - parseFloat(bka831))
							.toFixed(2));
		}

		/**
		 * 显示超范围用药
		 * @param rowdata 行数据
		 * @param index 索引值
		 * @param value 码值
		 * @returns {string}
		 */
		function renderBkz103(rowdata, index, value){
			if(value === "0"){
				return "否";
			}
			if(value === "1"){
				return "是";
			}
		}
	</script>
</body>
</powersi:html>