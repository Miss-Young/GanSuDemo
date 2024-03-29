<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="biz" uri="http://www.powersi.com.cn/biztags"%>
<%@ page import="com.powersi.ssm.biz.medicare.common.util.BizHelper"%>
<%
     //TS19051500118  医院端--医院管理子系统--医疗信息查询--住院（门诊、门特、特药）费用查询，查询结果需要增加两列，显示居民所在的乡镇、村 组   
	 //AAF014 乡镇街道 
     //AAZ071 村社区
     //BAF005 组 cj 20190515
     
     //TS19052700141   【需求开发】结算云（医院端）出院结算界面和住院信息查询界面需要显示多诊断信息  
    //修改：527行 住院信息查询页面 添加住院多诊断信息查看  cj  20190529
	// NTS20090800119 医院端住院信息查询增加显示drg支付情况 杨世明 20200909
	String hospital_id = BizHelper.getAkb020();
	String hospital_name = BizHelper.getAkb021();
	String aaa027 = BizHelper.getAaa027();
	String aka130 = request.getParameter("aka130");
	String trade_type = "zy";//request.getParameter("trade_type");
	String codeFilter = " data_value IN (" + aka130 + ")";
	String codeValue = aka130.substring(0, 2);
	String title = codeValue.equals("12")
			? "住院信息查询"
			: codeValue.equals("14") ? "家庭病床信息查询" : codeValue.equals("52") ? "生育住院信息查询" : " 业务信息查询  ";
	String bka006 = "data_value like '12_' and data_value <> '126' and data_value <> '124'";
	if (codeValue.equals("12")) {
		bka006 = "data_value like '12_' and data_value <> '126' and data_value <> '124'";
	} else if ("14".equals(codeValue)) {
		bka006 = "data_value like '14_'";
	} else if ("52".equals(codeValue)) {
		bka006 = "data_value like '52_'";
	}
	request.setAttribute("title", title);

	//NTS20090800120 医院端住院信息查询窗口增加查询医保结算清单功能 杨世明 20200908
	//NTS20090900125 中心端和医院端增加病案首页质控结果展示 杨世明 20200909
    //NTS20092200037 医院端住院信息查询窗口的查询医保结算清单功能优化 杨世明 20200918
%>
<powersi:html>
<powersi:codetable id="bka006List" codeType="bka006" />
<powersi:head title="住院信息查询" />
<body>
	<powersi:form id="queryForm" namespace="/query" action="BizQueryAction!queryAllBusinessInfo.action">
		<powersi:panelbox key="panel_query" title="查询条件">
			<powersi:panelbox-toolbar>
				<powersi:button id="queryId"  	  label="查  询"		buttonIcon="icon-search"   onclick="hospitalQuery()"/>
				<powersi:button id="settleId" 	  label="结算清单" 	buttonIcon="icon-ticket"   onclick="settlementReportPrint()" />
				<powersi:button id="feeDetailId"  label="费用清单" 	buttonIcon="icon-ticket"   onclick="feeDetailTable()" />
				<powersi:button id="fundId" 	  label="基金查询" 	buttonIcon="icon-money"    onclick="fundStatusInfo()" />
				<powersi:button id="exportId" 	  label="导出" 		buttonIcon="icon-download" onclick="exportData()" />
				<powersi:button id="settlementId" label="医保结算清单"  buttonIcon="icon-download" onclick="showSettlement()"/>
				<powersi:button id="showId"  	  label="病案质控信息"	buttonIcon="icon-search"   onclick="showQualityInfo()"/>
				<powersi:button id="printing"	  label="发票套打(E)" 	buttonIcon="icon-download" onclick="printingData()"/>
			</powersi:panelbox-toolbar>
			<powersi:editorlayout cols="10%,15%,8%,12%,8%,12%,9%,7%,13%">
				<tr>
					<powersi:codeselect codeType="caa027" id="caa027"
						name="bizQueryDto.caa027" label="中心系统" headerKey="0" />
					<powersi:codeselect id="arg_name" label="人员信息" name="bizQueryDto.arg_name"
						list="#{'':'请选择...','idcard':'社会保障号','name':'姓名','serial_no':'就医登记号','patient_id':'医院业务号(住院号)'}" />
					<td colspan="2" class="tdLabel">
						<powersi:textfield id="arg_value" placeholder="请输入信息回车.."
							name="bizQueryDto.arg_value" onkeydown="queryByPersonInfo()" />
					</td>
					<td align="right"><input type="radio" id="clinicDate" name="radio_date" 
						value="rad_fromdate" checked="checked" onchange="changeDatetype()" />
						<label id="inhospID">入院时间</label></td>
					<powersi:textfield id="fromdate" label="开始时间" name="bizQueryDto.fromdate" 
						mask="date" format="dateFmt:'yyyy-MM-dd'" />
				</tr>
				<tr>
					<powersi:codeselect id="zys001" label="在院状态" name="bizQueryDto.zys001" 
						list="#{'1':'在院','2':'出院'}" onchange="changButDis()" />
					<powersi:codeselect codeType="aka130" id="aka130" name="bizQueryDto.aka130"
						 label="业务类型" codeFilter="<%=codeFilter%>" headerKey="0" />
					<powersi:codeselect id="center_flag" onchange="showGrid()" name="bizQueryDto.center_flag"
						 label="查询平台" list="#{'0':'结算云平台','1':'核心业务平台' }" />
					<td align="right" class="tdLabel"> <input type="radio" id="endclinicDate" name="radio_date" 
						value="rad_todate" onchange="changeDatetype()"/>
						<label id="settleDate" for="endclinicDate">结算时间</label></td>
					<powersi:textfield id="todate" label="结束时间" mask="date" 
						name="bizQueryDto.todate" format="dateFmt:'yyyy-MM-dd'" />
				</tr>
				<tr>
					<powersi:codeselect label="结算状态" id="zys002" name="bizQueryDto.zys002"
						list="#{'1':'未结算','2':'已结算'}" onchange="settleStatus()" />
					<powersi:codeselect label="待遇类型" codeType="bka006" id="bka006" 
						name="bizQueryDto.bka006" codeFilter="<%= bka006 %>"/>
					<powersi:codeselect codeType="aae140" id="aae140" name="bizQueryDto.aae140" label="险种类型" />
				</tr>
				<tr>
					<powersi:codeselect id="baa027" name="bizQueryDto.baa027" label="参保人统筹区"
						codeType="aaa027" cssClass="select2" />
					<%if(codeValue.equals("12")){%>
					<td id="td1" align="right" class="tdLabel" style="display: none;" >是否一站式</td>
					<td id="td2" style="display: none;"><select id="bke054" name="bizQueryDto.bke054">
							<option value="">请选择..</option>
							<option value="0">否</option>
							<option value="1">是</option>
						</select></td>
					<%} %>
				</tr>
				<powersi:editorlayout-row>
					<powersi:hidden id="akb020" name="bizQueryDto.akb020" />
					<powersi:hidden id="aae100" name="bizQueryDto.aae100" value="1" />
					<powersi:hidden id="trade_type" name="bizQueryDto.trade_type" value="<%=trade_type%>" />
					<powersi:hidden id="timeType_flag" name="bizQueryDto.timeType_flag" value="1" />
					<powersi:hidden id="zfytotal" />
					<powersi:hidden id="zrstotal" />
					<powersi:hidden id="yydfpaytotal" />
					<powersi:hidden id="grzhpaytotal" />
					<powersi:hidden id="xjpaytotal" />
					<powersi:hidden id="sypaytotal" />
					<powersi:hidden id="tcpaytotal" />
				</powersi:editorlayout-row>
			</powersi:editorlayout>
		</powersi:panelbox>
	</powersi:form>
	<div class="row">
		<div class="col-9">
			<powersi:panelbox key="panel_result" title="医院业务信息" allowCollapse="false">
				<powersi:datagrid id="InhospBizGridId" formId="queryForm" delayLoad="true" usePager="true"
					totalRender="renderTotal" selectRowButtonOnly="true" onDblClickRow="onSelectClick" enabledSort="false"
					showExportExcel="true" exportFileName="'${title}'" pageSizeOptions="[5,30,50]" >
					<powersi:datagrid-column key="operate" render="renderOperate"
				    width="200" frozen="true" />
					<powersi:datagrid-column name="aac003" label="姓名"	  	 				width="100" frozen="true" />
					<powersi:datagrid-column name="aka130" label="业务类型"	code="aka130"	width="80"  frozen="true" />
					<powersi:datagrid-column name="bka035" label="人员类别"	code="bka035"	width="80"  frozen="true" />
					<powersi:datagrid-column name="aaz217" label="就医登记号"  width="150" />
					<powersi:datagrid-column name="aac001" label="个人电脑号" />
					<powersi:datagrid-column name="aac002" label="公民身份号码" />
					<powersi:datagrid-column name="aac004" label="性别"  	code="aac004" 	width="60" />
					<powersi:datagrid-column name="aae005" label="联系电话" />
					<powersi:datagrid-column name="aaa027" label="拨付中心"	code="aaa027" />
					<powersi:datagrid-column name="allpay"		label="总费用"		width="100" render="renderFormatMoney" />
					<powersi:datagrid-column name="fund_pay"	label="统筹支付"		width="80" render="renderFormatMoney" />
					<%if("52".equals(codeValue)){%>
						<powersi:datagrid-column name="shengyu_pay" label="生育基金支付"		width="80" render="renderFormatMoney" />
					<% } %>
					<%if(codeValue.equals("12")){%>
						<powersi:datagrid-column name="thb_pay"	 label="特惠宝"   width="80" render="renderFormatMoney"/>
						<powersi:datagrid-column name="mzjz_pay" label="民政救助" width="80" render="renderFormatMoney"/>
						<powersi:datagrid-column name="yyjm_pay" label="医院减免" width="80" render="renderFormatMoney"/>
						<powersi:datagrid-column name="czdd_pay" label="财政兜底" width="80" render="renderFormatMoney"/>
						<powersi:datagrid-column name="official_pay"	label="公务员基金支付" 	width="80" render="renderFormatMoney"/>
						<powersi:datagrid-column name="lixiu_pay" 		label="离休基金支付金额" width="80" render="renderFormatMoney"/>
					<% } %>
					<powersi:datagrid-column name="db_pay"		label="大病支付" 		render="renderFormatMoney" width="80" />
					<powersi:datagrid-column name="self_pay"	label="现金支付"			render="renderFormatMoney" width="80" />
					<powersi:datagrid-column name="acct_pay"  	label="个人账户金支付" 	render="renderFormatMoney" width="80" />
					<powersi:datagrid-column name="yydf_pay" 	label="医院垫付"  		render="renderFormatMoney" width="80"/> 
					<powersi:datagrid-column name="bka006" label="待遇类别" code="bka006" render="_render" />
					<powersi:datagrid-column name="aae030" label="入院时间"  format="{0,date,yyyy-MM-dd}" />
					<powersi:datagrid-column name="bkz101" label="入院诊断" />
					<powersi:datagrid-column name="aae031" label="出院时间"  format="{0,date,yyyy-MM-dd}" />
					<powersi:datagrid-column name="bkz102" label="出院诊断" />
					<powersi:datagrid-column name="akc190" label="住院号"   />
					<powersi:datagrid-column name="bka022" label="病区"			width="80" />
					<powersi:datagrid-column name="bka020" label="科室"			width="80" />
					<powersi:datagrid-column name="ake020" label="床位号"		width="80" />
					<powersi:datagrid-column name="bka008" label="单位名称" />
					<powersi:datagrid-column name="akc194" label="结算时间"		format="{0,date,yyyy-MM-dd}" />
					<powersi:datagrid-column name="baa027" label="人员所属中心"	width="80" code="aaa027"  />
					<powersi:datagrid-column name="aaf014" label="乡镇/街道" />
					<powersi:datagrid-column name="aaz071" label="村/社区" />
					<powersi:datagrid-column name="baf005" label="组" />
					<powersi:datagrid-column name="aac148" label="补助类型"  code="aac148"/>
					<powersi:datagrid-column name="aae011" label="就诊登记工号"  width="120" />
					<powersi:datagrid-column name="bka015" label="就诊登记名称"  width="120" />
					<powersi:datagrid-column name="aae014" label="结算人工号"	 width="80" />
					<powersi:datagrid-column name="bka034" label="结算人名称"	 width="80" />
					<powersi:datagrid-column name="is_medical_uploaded" label="是否上传病案信息" width="140" />
					<powersi:datagrid-column name="drg_fee"  label="DRG预支付金额" width="100" />
					<powersi:datagrid-column name="drg_name" label="DRG入组组别" width="80" />
				</powersi:datagrid>
			</powersi:panelbox>
		</div>
		<div class="col-3">
			<powersi:panelbox iconClass="icon-cog" title="费用信息" allowCollapse="false">
				<powersi:datagrid id="feeGridId" delayLoad="true" showReload="false"
					totalRender="feeTotal" onDblClickRow="feeDetailTable">
					<powersi:datagrid-column name="aka063" label="费用类别"	width="100" code="aka063" />
					<powersi:datagrid-column name="aae019" label="费用" 		width="80" 				  />	
				</powersi:datagrid>
			</powersi:panelbox>
		</div>
	</div>
	<powersi:errors />
</body>
<script type="text/javascript">
	window.onload = function(){
		$('#akb020').val("<%=hospital_id%>");
		$('#akb021').val("<%=hospital_name%>");
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = (myDate.getMonth()+1).toString().length==1?"0"+(myDate.getMonth()+1).toString():(myDate.getMonth()+1).toString();
		var day = myDate.getDate().toString().length==1?"0"+myDate.getDate().toString():myDate.getDate().toString();
		$("#fromdate").val(year+"-"+month+"-"+"01");
		$("#todate").val(year+"-"+month+"-"+day);
		settleStatus();
		changButDis();
	}
	
	//双击行,查询费用
	function onSelectClick(index){
		var row = InhospBizGridId.getRow(index);
		var kc21id = row['kc21id'];
		var aaz217 = row['aaz217'];
		var caa027 = $("#caa027").val();
		var center_flag = $("#center_flag").val();
		feeGridId.reset();
		postJSON("${rootPath}/query/BizQueryAction!queryBizFeeInfo.action",{
			"bizQueryDto.center_flag" : center_flag,
			"bizQueryDto.kc21id" 	  : kc21id,
			"bizQueryDto.aaz217" 	  : aaz217,
			"bizQueryDto.caa027" 	  : caa027 },function(json){
				if (!checkJSONResult(json)) 
					return;
				feeGridId.loadData(json.data);
			});
	}
	
	//费用清单查询
	function feeDetailTable() {
		var row = InhospBizGridId.getSelectedRow();
		if (row == null){
			popupAlert("请选择一条业务记录！", "提示", "info");
			return;
		}
		var aaz217 = row.aaz217;
		var caa027 = $("#caa027").val();
		var center_flag =$('#center_flag').val(); 
		
		var actionUrl = "${rootPath}/query/BizQueryAction!queryFeeDetailTable.action?bizQueryDto.aaz217="+aaz217+
			"&bizQueryDto.center_flag="+center_flag+"&bizQueryDto.caa027="+caa027;
		popupDialog(actionUrl,600,1300);
	}
	
	//打印结算单
	function settlementReportPrint() {
		var row = InhospBizGridId.getSelectedRow();
		if (row == null) {
			alert("请双击一条业务记录！");
			return;
		}
		var aaz217 = row.aaz217;
		var center_flag = $("#center_flag").val();
		var actionUrl = "${rootPath}/common/SettlementReportNewCenterAction!settlementReport.action"+
			"?inHospitalDTO.aaz217="+aaz217+"&inHospitalDTO.caa027="+$("#caa027").val()+"&inHospitalDTO.center_flag="+center_flag;
		popupDialog(actionUrl, 600, 1000);
	}
	
	//发票套打
	function printingData() {
		 var row= InhospBizGridId.getSelectedRow();
		if (row == null) {
			popupAlert("请双击一条业务记录！", "提示", "info");
			return;
		}
		var aaz217 = row.aaz217; 
		if (powersi.isnull(aaz217)) {
			return;
		}
		popupDialog(
				{
					url : "${rootPath}/common/BillReportAction!printingReport.action?kab3DTO.aaz217="+ aaz217+"&kab3DTO.bka445=2",
					onClosed : function() {
					}
				}, 600, 800);
	}
	
	//基金状态查询
	function fundStatusInfo(){
		var row=InhospBizGridId.getSelectedRow();
		if (row == null) {
			alert("请选择要查询的数据!");
			return;
		}
		var aac001 = row.aac001;
		var aae140 = powersi.trim($("#aae140").val());
		popupDialog(
				{
					url : "${rootPath}/common/CommonManagerAction!queryPersonFund.action?inHospitalDTO.aac001="
							+ aac001 + "&inHospitalDTO.aae140=" + aae140+"&inHospitalDTO.aka130=12&inHospitalDTO.caa027="+$("#caa027").val(),
					onClosed : function() {
						var retValue = this.returnValue;
					}
				}, 400, 700);
	}
	
	function showGrid(){
		if("0"== $("#center_flag").val()){
			$("#bke054").val("");
			$("#bke054").attr("disabled",true)
			$("[id='td1").attr("style","display: none;");
			$("[id='td2").attr("style","display: none;");
			if("2" == $("#zys001").val()){
				$("#printing").show();
			}
		}else{
			$("#bke054").attr("disabled",false);
			$("[id='td1").attr("style","");
			$("[id='td2").attr("style","");
			$("#printing").hide();
		}
		//hospitalQuery();
	}
	
	function hospitalQuery(){
		var saveItemData = $("#queryForm").serialize();
		var url = rootPath+"/query/BizQueryAction!querySum.action";
		postJSON(url,saveItemData,function(json){
			if(!checkJSONResult(json)){
				return;
			}
			$.each(json.data, function(key, value) {
				$("#" + key).val(value);
			});
			feeGridId.reset();
			$("#queryForm").submit();
		});
	}
	
	function queryByPersonInfo() {
		if (window.event.keyCode == 13) {
			hospitalQuery();
		}
	}
	
	function exportData(){
		InhospBizGridId.exportExcel();
	}
	
	//出院、入院显示控制
	function changButDis() {
		var zys001 = $("#zys001 option:selected").val();
		if(zys001 == "1" || zys001 == ""){
			$("#inhospID").text("入院时间");
			$("#zys002").empty();
			$("#zys002").append("<option value='1' >" + "未结算" + "</option>");
			//在院状态将结算时间控制为未结算
			$("#zys002").val("1");
			$("#timeType_flag").val("1");
			settleStatus();
		}else {
			$("#inhospID").text("出院时间");
			$("#zys002").empty();
			//$("#zys002").append("<option value='1' checked >" + "未结算" + "</option>");
			$("#zys002").append("<option value='2' >" + "已结算" + "</option>");
			$("#zys002").attr("disabled", false);
			$("#timeType_flag").val("2");
			settleStatus();
		}
		if("0"== $("#center_flag").val() && "2" == $("#zys001").val()){
			$("#printing").show();
		}else{
			$("#printing").hide();
		}
		
	}
	//结算时间的显示控制
	function settleStatus() {
		var zys001 = $("#zys001 option:selected").val();
		if ($("#zys002").val() == "1") {
			$("#endclinicDate").attr("disabled", true);
			$("#settleDate").attr("disabled", true);
			$("#clinicDate").attr("checked",true);
			if(zys001=="1")
				$("#timeType_flag").val("1");
			else
				$("#timeType_flag").val("2");
		} else {
			$("#endclinicDate").attr("disabled", false);
			$("#settleDate").attr("disabled", false);
			$("#settleId").attr("disabled", false);
			$("#timeType_flag").val("02");
		}
	}
	
	function changeDatetype() {
		var rad_value = $(':radio[name="radio_date"]:checked').val();
		var zys001 = $("#zys001 option:selected").val();
		var zys002 = $("#zys002 option:selected").val();
		if('rad_fromdate'==rad_value){
			if(zys001=="1")
				$("#timeType_flag").val("1");//入院时间
			if(zys001=="2"){
				if(zys002=="1")
					$("#timeType_flag").val("2");//出院时间
					else
						$("#timeType_flag").val("02");//出院时间
			}
		}
		if('rad_todate'==rad_value){
			$("#timeType_flag").val("03");
		}
	}

	function feeTotal(allData, currentData) {
		var sum = 0;
		$.each(allData['rows'], function(n, row) {
			if (feeGridId.getRowStatus(row) != 'delete') {
				sum = FloatAdd(sum, row.aae019);
			}
		});
		var a = [];

		a.push('<div class="textCenter">');
		a.push('费用总计：');
		a.push(sum);
		a.push(' 元');
		a.push('</b> ');
		a.push('</span>');
		a.push('</div>');
		return a.join('');
	}
	
	function renderTotal(allData, currentData){
		var a = [];
		a.push('<div class="divCenter textSuccess">');
		a.push('<span>');
		a.push('总费用合计：<b>');
		a.push($("#zfytotal").val());
		a.push('</b>');
		a.push('</span>');
		a.push('&nbsp;&nbsp;');
		a.push('<span>');
		a.push('总人数：<b>');
		a.push($("#zrstotal").val());
		a.push('</b>');
		a.push('</span>');
		/* a.push('&nbsp;&nbsp;');
		a.push('<span>');
		a.push('医院垫付合计：<b>');
		a.push($("#yydfpaytotal").val());
		a.push('</b>');
		a.push('</span>'); */
	    a.push('&nbsp;&nbsp;');		
	    a.push('<span>');
		a.push('个人账户支付合计：<b>');
		a.push($("#grzhpaytotal").val());
		a.push('</b>');
		a.push('</span>');
		a.push('&nbsp;&nbsp;');		
		a.push('<span>');
		a.push('现金支付合计：<b>');
		a.push($("#xjpaytotal").val());
		a.push('</b>');
		a.push('</span>');
		if($("#aka130").val()=='52'){
			a.push('<span>');
			a.push('生育基金支付：<b>');
			a.push($("#sypaytotal").val());
			a.push('</b>');
			a.push('</span>');
		}else{
			a.push('<span>');
			a.push('统筹基金支付：<b>');
			a.push($("#tcpaytotal").val());
			a.push('</b>');
			a.push('</span>');
		}
	  	return a.join('');
	}
	
	//渲染金额格式
	function renderFormatMoney(rowdata,index,value,arguments) {
		if(value!=null&&value !=""){
			value = powersi.tonumber(value).toFixed(2);
			return value;
		}else{
			return "";
		}
	}
	
	/* 字典项渲染函数  解决loadData不能自动加载字典问题*/
	function renderDictionary(rowdata, index, value,arguments) {
		if(value!=null&&value !=""){
			var list = window[arguments.code];
			for(var i in list){
				if(list[i].id == value  ){
					return list[i].text;
				}
			}
			return '<span title="未匹配到字典项">'+value+'</span>';
		}else{
			return "";
		}
	}
	
	
	function FloatAdd(arg1, arg2) {
		var r1, r2, m;
		try {
			r1 = arg1.toString().split(".")[1].length
		} catch (e) {
			r1 = 0
		}
		try {
			r2 = arg2.toString().split(".")[1].length
		} catch (e) {
			r2 = 0
		}
		m = Math.pow(10, Math.max(r1, r2))
		return to2bits((arg1 * m + arg2 * m) / m, 2);
	}

	function to2bits(flt, pos) {
		var rd = 1;
		for (var i = 1; i <= parseInt(pos); i++) {
			rd = rd * 10;
		}
		if (parseFloat(flt) == flt)
			return Math.round(flt * rd) / rd;
		else
			return 0;
	}
	
	function renderOperate(row, index, value) {
		var a = [];
		a.push('<input type="button" value="查看住院多诊断信息" class="linkButton"');
		a.push(' onclick="queryDiagnoseInfo(');
		a.push(index);
		a.push(')"');
		/* if (row['bka891'] == '1') {
			a.push(' disabled="disabled"');
		} */
		a.push(" />");
		var aaa027 = <%=aaa027%>;
		return a.join('');
	}
	
	
	/*多诊断查询*/
	function queryDiagnoseInfo(index) {
		var row = InhospBizGridId.getRow(index);
		var aaz217 = row['aaz217'];
		if (powersi.isnull(aaz217)) {
			return;
		}
		popupDialog(
				{
					url : "${rootPath}/inhospital/InhospitalManagerAction!queryDiagnoseInfos.action?inHospitalDTO.aaz217="+ aaz217,
					onClosed : function() {
						var retValue = this.returnValue;
						if (retValue) {

						} else {

						}
					}
				}, 400, 700);
	}

	function showSettlement() {
		var centerFlag = $("#center_flag").val();
		if(centerFlag === "1"){
			var row = InhospBizGridId.getSelectedRow();
			if (row == null) {
				popupAlert("请选择一条业务记录！", "提示", "info");
				return;
			}

			var aaz217 = row.aaz217;
			if (powersi.isnull(aaz217)) {
				return;
			}
			popupDialog(
					{
						url: "<%=BizHelper.getSettlementUrl()%>" + aaz217,
						onClosed: function () {
						}
					}, screen.height, screen.width
			);
		}else{
			popupAlert("请选择核心业务平台查询！");
		}
	}

	function showQualityInfo(){
		popupDialog(
				{
					url: "<%=BizHelper.getQualityUrl()%>",
					onClosed: function () {
					}
				}, screen.height, screen.width
		);
	}
</script>
</powersi:html>