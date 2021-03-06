<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>

<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="biz" uri="http://www.powersi.com.cn/biztags"%>
<%@ page import="com.powersi.ssm.biz.medicare.common.util.BizHelper"%>
<%
	String path = request.getContextPath(); 

	String hospital_id = BizHelper.getAkb020();
	String hospital_name = BizHelper.getAkb021();
	String aaa027 = com.powersi.ssm.biz.medicare.common.util.BizHelper.getAaa027();
	String loginUser = BizHelper.getLoginUser();
	String userName = BizHelper.getUserName();
	String aaz267value = request.getAttribute("mediSpecDto.aaz267")==null?"0":request.getAttribute("mediSpecDto.aaz267").toString();
%>

<powersi:html>
<body>
	<powersi:head title="门特业务申请" />
	<powersi:form id="mainForm" namespace="/medicare"
		action="MtmmSpecialApplyAction!queryMediPersonInfo.action">
		<div id="div1" style="display: none">
			<powersi:hidden id="akb020" name="mediSpecDto.akb020" key="akb020"></powersi:hidden>
			<powersi:hidden id="akb021" name="mediSpecDto.akb021" key="akb021"></powersi:hidden>
			<powersi:hidden id="aae140" name="inHospitalDTO.aae140" value="310"/>
			<powersi:hidden id="indi_id" name="indi_id" value="indi_id" />
			<powersi:hidden id="idcard" name="idcard" value="idcard" />
			<powersi:hidden id="baa027" name="mediSpecDto.baa027" />
		</div>
		<powersi:panelbox title="查询条件">
			<powersi:panelbox-toolbar>
				<powersi:button id="fundStatus" key="基金状态查询"
					onclick="fundStatusInfo()" />
				<powersi:button id="button_save" key="保存"
					onclick="saveInfo()" />
				<powersi:button cssClass="button" key="重置"
					onclick="clearall()" />
			</powersi:panelbox-toolbar>
			<powersi:editorlayout cols="10%,17%,8%,17%,8%,17%,8%,15%">
				<powersi:editorlayout-row>
					<powersi:textfield id="tracestring" name="tracestring" label="查询条件"
						title="请输入信息回车" placeholder="请输入信息回车" readonly="false"
						onkeydown="queryPresonInfo()" buttonText="读     卡"
						buttonId="readic_button" buttonDisabled="false"
						onbuttonclick="readic()" />
					<powersi:textfield id="aac001" label="电脑号" name="mediSpecDto.aac001" key="aac001" readonly="true"/>
					<powersi:textfield label="姓名" id="aac003" name="mediSpecDto.aac003"
						key="aac003" readonly="true" />
					<!-- <powersi:codeselect id="aac004_name" key="性别" name="mediSpecDto.aac004" codeType="aac004" disabled="true" /> -->
					<powersi:hidden id="aac004" name="mediSpecDto.aac004" readonly="true" />
					<powersi:codeselect id="aac066" key="人员类别" name="mediSpecDto.bka004" codeType="bka004" disabled="true" />
					<powersi:hidden id="bka004" name="mediSpecDto.bka004" />
				</powersi:editorlayout-row>
			</powersi:editorlayout>
		</powersi:panelbox>

		<powersi:groupbox title="人员信息">
			<powersi:editorlayout cols="10%,17%,8%,17%,8%,17%,8%,15%">
				<tr>
					<powersi:textfield label="身份证号" id="aac002"
						name="mediSpecDto.aac002" key="aac002" readonly="true" />
					<powersi:textfield label="出生日期" mask="date"
						format="dateFmt:'yyyy-MM-dd'" id="aac006"
						name="mediSpecDto.aac006" key="aac006" readonly="true" />
					<powersi:textfield label="工作日期" format="dateFmt:'yyyy-MM-dd'"
						id="aac007" name="mediSpecDto.aac007" key="aac007" readonly="true" />
					<powersi:textfield label="所属单位" id="aab069"
						name="mediSpecDto.aab069" key="aab069" readonly="true" colspan="3" />
				</tr>
			</powersi:editorlayout>
		</powersi:groupbox>

		<powersi:groupbox title="详细信息">
			<powersi:editorlayout cols="10%,17%,8%,17%,8%,17%,8%,15%">
				<tr>
					<powersi:codeselect id="bka006" key="门特项目" 
						name="mediSpecDto.bka006" codeType="bka006"  cssClass="select2" 
						codeFilter="data_value like '16%'" codeSort="1" required="true" codeLocal="<%=aaa027%>" onchange="apply_content(this)"/>
					<powersi:select label="疾病名称" id="bke003" name="mediSpecDto.bke003"
						key="bke003" required="true" />
					<td><powersi:button key="button" value="选择" id="disease"
							disabled="true" onclick="chooseDis()" /></td>
					<td colspan="3"></td>
				</tr>
				<tr>
					<powersi:textfield label="有效期开始" mask="date"
						format="dateFmt:'yyyy-MM-dd'" id="aae030"
						name="mediSpecDto.aae030" key="aae030" required="true"
						onchange="wf_set_admit()" />
					<powersi:textfield label="有效期结束" mask="date"
						format="dateFmt:'yyyy-MM-dd'" id="aae031"
						name="mediSpecDto.aae031" key="aae031" required="false"
						onchange="wf_set_admit_date()" />
					<powersi:textfield label="就诊科室" id="bke015"
						name="mediSpecDto.bke015" key="bke015" required="true" />
					<powersi:textfield label="科室电话" id="bke014"
						name="mediSpecDto.bke014" key="bke014" required="true"
						validate="integer" maxlength="20" />
				</tr>
				<tr>
					<powersi:textfield label="申请人电话" id="bke016"
						name="mediSpecDto.bke016" key="bke016" required="true"
						validate="integer" maxlength="20" />
					<powersi:textfield label="申请医师" id="bke017"
						name="mediSpecDto.bke017" key="bke017" required="true"
						maxlength="20" />
					<powersi:textfield label="主任医师" id="bke018"
						name="mediSpecDto.bke018" key="bke018" required="true"
						maxlength="20" />
					<powersi:textfield label="主任意见时间" mask="date"
						format="dateFmt:'yyyy-MM-dd'" id="bke019"
						name="mediSpecDto.bke019" key="bke019" required="true" />
				</tr>
				<tr>
					<powersi:textfield label="医师意见时间" mask="date"
						format="dateFmt:'yyyy-MM-dd'" id="bke020"
						name="mediSpecDto.bke020" key="bke020" required="true" />
					<powersi:textfield label="医院意见时间" mask="date"
						format="dateFmt:'yyyy-MM-dd'" id="bke034"
						name="mediSpecDto.bke034" key="bke034" required="true" />
					<powersi:textfield label="录入人" id="aae011"
						name="mediSpecDto.aae011" key="aae011" readonly="true" />
					<powersi:textfield label="录入时间" id="aae036"
						name="mediSpecDto.aae036" key="aae036" readonly="false" />
				</tr>
				<tr>
					<powersi:textarea label="医院意见" id="bke013"
						name="mediSpecDto.bke013" key="bke013" required="true" colspan="7" />
				</tr>
				<tr>
					<powersi:textarea label="病情摘要及诊断" id="bke011"
						name="mediSpecDto.bke011" key="bke011" required="true" colspan="7" />
				</tr>
				<tr>
					<powersi:textarea label="诊治方案及项目构成" id="bke012"
						name="mediSpecDto.bke012" key="bke012" required="false"
						readonly="false" colspan="7" />
				</tr>
				<tr>
					<powersi:textarea label="备注" id="aae013" name="mediSpecDto.aae013"
						key="aae013" required="false" readonly="false" colspan="7" />
				</tr>
			</powersi:editorlayout>
		</powersi:groupbox>

	</powersi:form>
	<script type="text/javascript">

	var is_admit_date ="";//最近一次同类业务的截止时间
	var is_apply_count ="";//申请的次数
	
	window.onload = function(){
		$('#akb020').val("<%=hospital_id%>");
		$('#akb021').val("<%=hospital_name%>");
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = (myDate.getMonth()+1).toString().length==1?"0"+(myDate.getMonth()+1).toString():(myDate.getMonth()+1).toString();
		var day = myDate.getDate().toString().length==1?"0"+myDate.getDate().toString():myDate.getDate().toString();
		$('#bkc027').val("<%=userName%>");
      	$('#bkc028').val("<%=loginUser%>");
      	$('#bkc029').val(year+"-"+month+"-"+day);
		
      	$("#button_save").attr("disabled",true);
/////      	$("#fundStatus").attr("disabled",true);
		var aaz267value = "<%=aaz267value%>";
	
		//默认意见时间为当天
		if(aaz267value == 0){
			var myDate = new Date;
			var year = myDate.getFullYear();
			var month = (myDate.getMonth()+1).toString().length==1?"0"+(myDate.getMonth()+1).toString():(myDate.getMonth()+1).toString();
			var day = myDate.getDate().toString().length == 1?"0"+ myDate.getDate().toString():myDate.getDate().toString();
		
			$("#aae036").val(year+"-"+month+"-"+day);
			$("#bke019").val(year+"-"+month+"-"+day);
			$("#bke020").val(year+"-"+month+"-"+day);
			$("#bke034").val(year+"-"+month+"-"+day);
			
			//统筹区编码
			$('#aaa027').val("<%=aaa027%>");	        
	        $('#aae011').val("<%=userName%>");
		}else{
			oldItemDate= $("#mainForm").serialize();
		}
	}
	
	//去除左右两边的空格
	function trim(str){
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}
	
	function wf_set_admit(){//设置有效期开始时间
		
		var myDate = new Date;
		var year = myDate.getFullYear();
		var month = (myDate.getMonth()+1).toString().length ==1?"0"+(myDate.getMonth()+1).toString():(myDate.getMonth()+1).toString();
		var day = myDate.getDate().toString().length ==1?"0"+myDate.getDate().toString():myDate.getDate().toString();
		var today = year+"-"+month+"-"+day;
		
		var is_admit_effect = $("#aae030").val();//有效期开始时间
		
		//根据选择的申请项目设置申请使用有效期
		//家庭病床为三个月,其它门特项目为一年
		var apply_content = $("#bka006").val();
		switch (apply_content) {
		case "140":
			if(is_admit_effect == "" || is_admit_effect == null){
				ldDate = new Date();
				ldDate.setMonth(ldDate.getMonth()+3);
			}else{
				ldDate = parseISO8601(is_admit_effect);
				ldDate.setMonth(ldDate.getMonth()+3);
			}
			ldDate.setDate(ldDate.getDate()-1);
			year = ldDate.getFullYear();
			month = (ldDate.getMonth()+1).toString().length == 1?"0"+(ldDate.getMonth()+1).toString():ldDate.getMonth().toString();
			day = ldDate.getDate().toString().length == 1?"0"+ldDate.getDate().toString():ldDate.getDate().toString();
			$("#aae031").val(year + "-" + month + "-" + day);
			break;
		case "169"://case:16L//丙肝门特申请业务期限为6个月//肺癌靶向治疗、丙肝治疗有效期为六个月
			if(is_admit_effect == "" || is_admit_effect == null){
				ldDate = new Date();
				ldDate.setMonth(ldDate.getMonth()+6);
			}else{
				ldDate = parseISO8601(is_admit_effect);
				ldDate.setMonth(ldDate.getMonth()+6);//录入时间加6个月
			}
			ldDate.setDate(ldDate.getDate()-1);
			year = ldDate.getFullYear();
			month = (ldDate.getMonth()+1).toString().length == 1?"0"+(ldDate.getMonth()+1).toString():ldDate.getMonth().toString();
			day = ldDate.getDate().toString().length == 1?"0"+ldDate.getDate().toString():ldDate.getDate().toString();
			$("#aae031").val(year + "-" + month + "-" + day);
		case "16L":
			if(is_admit_effect == "" || is_admit_effect == null){
				ldDate = new Date();
				ldDate.setMonth(ldDate.getMonth()+5);
				ldDate.setDate(ldDate.getDate()-1);
				year = ldDate.getFullYear();
				month = (ldDate.getMonth()+1).toString().length == 1?"0"+(ldDate.getMonth()+1).toString():ldDate.getMonth().toString();
				day = ldDate.getDate().toString().length ==1?"0"+ldDate.getDate().toString():ldDate.getDate().toString();
				$("#aae031").val(year + "-" + month + "-" + day);
			}else{
				$("#aae031").val("2099-12-31");
			}
			break;
			
		case "167":
			if(is_admit_effect == "" || is_admit_effect == null){
				$("#aae030").val(today);
			}
				$("#aae031").val("");
			break;
		default:
			if(is_admit_effect == "" || is_admit_effect == null){//当前日期加1年
				ldDate = new Date;
				ldDate.setFullYear(ldDate.getFullYear()+1);
			}else{//最后一次审批日期加1年
				ldDate = parseISO8601(is_admit_effect);
				ldDate.setFullYear(ldDate.getFullYear()+1);
			}
				ldDate.setDate(ldDate.getDate()-1);
				year = ldDate.getFullYear();
				month = (ldDate.getMonth()+1).toString().length ==1?"0"+(ldDate.getMonth()+1).toStirng():(ldDate.getMonth()+1).toString();
				day = ldDate.getDate().toString().length ==1?"0"+ldDate.getDate().toString():ldDate.getDate().toString();
				$("#aae031").val(year+ "-" + month + "-" + day);
				break;
		}
	}


	function wf_set_admit_date(){//设置有效期结束时间
    	
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = (myDate.getMonth()+1).toString().length==1?"0"+(myDate.getMonth()+1).toString():(myDate.getMonth()+1).toString();
		var day = myDate.getDate().toString().length==1?"0"+myDate.getDate().toString():myDate.getDate().toString();
		var today = year + "-" + month + "-" + day;
		
		var is_admit_effect = $("#aae030").val();//获取有效期开始时间
		var is_admit_date = $("#aae031").val();//获取有效期结束时间
		var c;
		
		
		//根据选择的申请项目设置使用有效期
		//家庭病床为三个月,其它项目为一年
		var apply_content = $("#bka006").val();
		if(is_admit_effect != ""){
		switch (apply_content) {
		case "140":
			ldDate = parseISO8601(is_admit_effect);
			ldDate.setMonth(ldDate.getMonth()+3);
			ldDate.setDate(ldDate.getDate()-1);
				
			year = ldDate.getFullYear();
			month = (ldDate.getMonth()+1).toString().length ==1?"0"+(ldDate.getMonth()+1).toString():(ldDate.getMonth()+1).toString();
			day = ldDate.getDate().toString().length ==1?"0"+ldDate.getDate().toString():ldDate.getDate().toString();
			admit_date = year + "-" + month + "-" + day;
			if(is_admit_date > admit_date){
				popupAlert("该门特项目的有效期结束时间不能大于3个月!");
				$("#aae031").val(admit_date);
			}
		break;
		case "16L": case "169"://肺癌靶向治疗有效期为6个月,丙肝门特申请期限为6个月
			ldDate = parseISO8601(is_admit_date);
			ldDate.setMonth(ldDate.getMonth()+6);
			ldDate.setDate(ldDate.getDate()-1);
			
			year = ldDate.getFullYear();
			month = (ldDate.getMonth()+1).toString().length ==1?"0"+(ldDate.getMonth()+1).toString():(ldDate.getMonth()+1).toString();
			day = ldDate.getDate().toString().length ==1?"0"+ldDate.getDate().toString():ldDate.getDate().toString();
			admit_date = year + "-" + month + "-" + day;
			if(is_admit_date > admit_date){
				popupAlert("该门特项目的有效期结束时间不能大于6个月!");
				$("#aae031").val(admit_date);
			}
		break;
		case "167":
			if(is_admit_effect == "" || is_admit_effect == null){
				$("#aae030").val(today);
			}
				$("#aae031").val("");
			break;
		default:
			//最后一次审批期限加1年
			ldDate=parseISO8601(is_admit_effect);
			ldDate.setFullYear(ldDate.getFullYear()+1);
			ldDate.setDate(ldDate.getDate()-1);
			
			year = ldDate.getFullYear();
			month = (ldDate.getMonth()+1).toString().length ==1?"0"+(ldDate.getMonth()+1).toString():(ldDate.getMonth()+1).toString();
			day = ldDate.getDate().toString().length ==1?"0"+ldDate.getDate().toString:ldDate.getDate().toString();
			admit_date = year + "-" + month + "-" + day;
			if(is_admit_date > admit_date){
				popupAlert("该门特项目结束时间不能大于1年!");
				$("#aae031").val(admit_date);
			}
			break;
			}
		}
	}
	function wf_set_date(apply_content,is_admit_date){//
		
		 var myDate = new Date();
		 var year = myDate.getFullYear();
		 var month = (myDate.getMonth()+1).toString().length==1?"0"+(myDate.getMonth()+1).toString():(myDate.getMonth()+1).toString();
		 var day = myDate.getDate().toString().length==1?"0"+myDate.getDate().toString():myDate.getDate().toString();
		 var today= year+"-"+month+"-"+day;

		 var ldDate;//审核开始时间
		 var lsDate;//审核结束时间
		
		 //根据选择的申请项目设置使用有效期
		 //家庭病床三个月,其它门特项目为一年
		 var apply_content = $("#bka006").val();
		switch (apply_content) {
		case "140":
			if(is_admit_date=="" || is_admit_date==null ||is_admit_date<today){
				$("#aae030").val(today);
				ldDate=new Date();
				ldDate.setMonth(ldDate.getMonth()+3);
				
			}else{ ////最后一次审批期限+3个月

				ldDate=parseISO8601(is_admit_date);
				ldDate.setMonth(ldDate.getMonth()+3);
				lsDate=parseISO8601(is_admit_date);
				lsDate.setDate(lsDate.getDate()+1);

			    year = lsDate.getFullYear();
			    month = (lsDate.getMonth()+1).toString().length==1?"0"+(lsDate.getMonth()+1).toString():(lsDate.getMonth()+1).toString();
			    day = lsDate.getDate().toString().length==1?"0"+lsDate.getDate().toString():lsDate.getDate().toString();		
			    $("#aae030").val(year+"-"+month+"-"+day);	
			}
			ldDate.setDate(ldDate.getDate()-1);
		    year = ldDate.getFullYear();
		    month = (ldDate.getMonth()+1).toString().length==1?"0"+(ldDate.getMonth()+1).toString():(ldDate.getMonth()+1).toString();
		    day = ldDate.getDate().toString().length==1?"0"+ldDate.getDate().toString():ldDate.getDate().toString();		
		    $("#aae031").val(year+"-"+month+"-"+day);
			break;
		case "169"://丙肝门特申请期限为六个月
			if(is_admit_date == "" || is_admit_date == null){//当前日期+6个月
				$("#aae030").val(today);
				ldDate = new Date();
				ldDate.setMonth(ldDate.getMonth()+6);
			}else{//最后一次审批期限+6个月
				ldDate = parseISO8601(is_admit_date);
				ldDate.setMonth(ldDate.getMonth()+6);
				lsDate = parseISO8601(is_admit_date);
				lsDate.setDate(lsDate.getDate()+1);//
				
				year = lsDate.getFullYear();
				month = (lsDate.getMonth()+1).toString().length ==1?"0"+(lsDate.getMonth()+1).toString():(lsDate.getMonth()+1).toString();
				lsDate = lsDate.getDate().toString().length == 1?"0"+lsDate.getDate().toString():lsDate.getDate().toString();
			}
			ldDate.setDate(ldDate.getDate()-1);
			
			year = ldDate.getFullYear();
			month = (ldDate.getMonth()+1).toString().length ==1?"0"+(ldDate.getMonth()+1).toString():(ldDate.getMonth()+1).toString();
			ldDate = ldDate.getDate().toString().length == 1?"0"+ldDate.getDate().toString():ldDate.getDate().toString();
			$("#aae031").val(year + "-" + month + "-" + day);
			break;
		case "16L"://肺癌靶向治疗、丙肝治疗期限为6个月
			$("#aae030").val(today);
			ldDate = new Date();
			ldDate.setMonth(ldDate.getMonth()+6);
			
			year = ldDate.getFullYear();
			month = (ldDate.getMonth()+1).toString().length ==1?"0"+(ldDate.getMonth()+1).toString():(ldDate.getMonth()+1).toString();
			day = ldDate.getDate().toString().length == 1?"0"+(ldDate.getMonth()+1).toString():ldDate.getDate().toString();
			$("#aae031").val(year + "-" + month + "-" + day);
			break;
		case "167":
			$("#aae030").val(today);
			$("#aae031").val("");
			break;
		case "164":case "165":
			if(is_admit_date == "" || is_admit_date == null || is_amdit_date <today){
				$("#aae030").val(today);
				ldDate = new Date();
				ldDate.setFullYear(ldDate.getFullYear()+1);
			}else{
				if(is_apply_count == "3"){
					$("#aae030").val(today);
					ldDate = parseISO8601(is_admit_date);
				}else{
					ldDate = parseISO8601(is_admit_date);
					ldDate.setFullYear(ldDate.getFullYear()+1);
					lsDate = parseISO8601(is_admit_date);
					lsDate.setDate(ldDate.getDate()+1);
					
					year = lsDate.getFullYear();
					month = (lsDate.getMonth()+1).toString().length ==1?"0"+(lsDate.getMonth()+1).toString():(lsDate.getMonth()+1).toString();
					day = lsDate.getDate().toString().length ==1?"0"+lsDate.getDate().toString:lsDate.getDate().toString();
					$("#aae030").val(year + "-" + month + "-" + day)
				}
			}
				ldDate.setDate(ldDate.getDate()-1);
		    	year = ldDate.getFullYear();
		    	month = (ldDate.getMonth()+1).toString().length==1?"0"+(ldDate.getMonth()+1).toString():(ldDate.getMonth()+1).toString();
		    	day = ldDate.getDate().toString().length==1?"0"+ldDate.getDate().toString():ldDate.getDate().toString();		
		   		$("#aae031").val(year+"-"+month+"-"+day);
				break;
		default:
			if(is_admit_date == "" || is_admit_date == null || is_admit_date < today){//当前日期+1年
				$("#aae030").val(today);
				ldDate = new Date();
				ldDate.setFullYear(ldDate.getFullYear()+1);
			}else{//最后一次审批日期加一年
				ldDate = parseISO8601(is_admit_date);
				ldDate.setFullYear(ldDate.getFullYear()+1);
				lsDate = parseISO8601(is_admit_date);
				lsDate.setDate(lsDate.getDate()+1);
				
				year = ldDate.getFullYear();
				month = (ldDate.getMonth()+1).toString().length ==1?"0"+(ldDate.getMonth()+1).toString():(ldDate.getMonth()+1).toString();
				day = ldDate.getDate().toString().length ==1?"0"+ldDate.getDate().toString():ldDate.getDate().toString();
				$("#aae030").val(year+"-"+month+"-"+day);
				
			}
				//β地中海贫血根据YBRJ-0226需求，期限改为一年
				ldDate.setDate(ldDate.getDate()-1);
			    year = ldDate.getFullYear();
			    month = (ldDate.getMonth()+1).toString().length==1?"0"+(ldDate.getMonth()+1).toString():(ldDate.getMonth()+1).toString();
			    day = ldDate.getDate().toString().length==1?"0"+ldDate.getDate().toString():ldDate.getDate().toString();		
			    $("#aae031").val(year+"-"+month+"-"+day);
			break;
		}
			 wf_verify_hosp_treat();
	}
	
	
	//校验本院是否可以申请该项目
	function wf_verify_hosp_treat(){
		var bka006 = $("#bka006").val();
		var akb020 = $("#akb020").val();
		postJSON("<%=path%>/medicare/MtmmSpecialApplyAction!verifyHospTreat.action",{"mediSpecDto.bka006":bka006,"mediSpecDto.akb020":akb020},afterVerifyHospTreat);
	}
	
	function afterVerifyHospTreat(json){
		if(!checkJSONResult(json)){
			return;
		}
		if(json.message !=""){
			popupInfo(json.message);
			clearall();
		}else{
			//校验是否重复申请
			if(is_admit_date !=""){
				ld_effect = $("#aae030").val();
				var myDate = new Date();
				myDate.setMonth(myDate.getMonth()+1);
				var year = myDate.getFullYear();
				var month = (myDate.getMonth()+1).toString().length ==1?"0"+(myDate.getMonth()+1).toString():(myDate.getMonth()+1).toString();
				var day = myDate.getDate().toString().length ==1?"0"+myDate.getDate().toString():myDate.getDate().toString();
				
				ld_valid = year + "-" + month + "-" + day;
			}
			var saveItemData = $("#mainForm").serialize();
			//获取本待遇类型icd,家族病床也需要选择疾病
			if($("#bka006").val() == "140"){
				$("#disease").attr("disabled",false);
				$("#bke003").val("");
			}else{
				$("#disease").attr("disabled",true);
				postJSON("<%=path%>/medicare/MtmmSpecialApplyAction!getBizInfo.action",saveItemData,queryBizInfo);
			}
		}
	}
	
	function queryBizInfo(json){
		if(!checkJSONResult(json)){
			return;
		}
		if(json.message !=""){
			popupInfo(json.message);
			clearall();
		}else{
			var select = document.getElementById("bke003");
			if(json.data.length != 0){
				//获取特殊业务申请可用疾病信息
				select.options.length = 0;
			for(i=0;i<json.data.length;i++){
				//[{code_wb=NNIFGNGUGNEO, serial_icd=12, icd=B18.101, disease=慢性活动型乙型病毒性肝炎, code_py=MXHDXYXBDXGY}]
				var dise_code = json.data[i].disease;
				var dise_name = json.data[i].icd;
				var option = new Option(dise_code,dise_name);
				select.add(option);
				}
			}else{
				select.options.length = 0;//置空
			}
		}
	}
	//选择疾病信息
	function chooseDis(){
		popupDialog({
			url: "<%=path%>/common/CommonManagerAction!chooseDisease.action",
			onClosed: function() {
				var ret = this.returnValue;
				if(ret != null){
					var select = document.getElementById("bke003");
					select.options.length = 0;
					var option = new Option(ret.aka121,ret.aka120);
					select.add(option);
				}
			}
		}, 600, 600);
	}
	//获取最近一次的有效申请(获取同类申请信息)
	function wf_get_latest_apply(){
//		var aka083 =  $("#aka083").val();
		var bka006 =  $("#bka006").val();
		var indi_id = $("#aac001").val();
		var akb020 = $("#akb020").val();
		if (powersi.isnull(indi_id)) {
			popupAlert("请先获取参保人员信息！");
			return;
		}
		postJSON("<%=path%>/medicare/MtmmSpecialApplyAction!verifySPApply.action",{"mediSpecDto.bka006":bka006,"mediSpecDto.aac001":indi_id,"mediSpecDto.akb020":akb020},getLatestApplyDate);
	}
	
	function getLatestApplyDate(json){
		var old_hosptail_name;//最大的申请医院编号
		var old_admit_effect;//最大的申请的开始日期
		var old_admit_date;//最大申请的结束日期
		var old_serial_apply;//最大申请序列号
		
		var new_hosptail_name;
		var new_admit_effect;
		var new_admit_date;
		var new_serial_apply
		
		if(!checkJSONResult(json)){
			return;
		}
		if(json.message != ""){
			popupInfo(json.message);
			clearall();
		}else{
			if($("#bka006").val() == "164" || $("#bka006").val() == "165"){
				is_admit_date = json.data.admitDate;
				is_apply_count = json.data.applyCount;
				old_hosptail_name = json.data.hosptail_name;
				old_admit_effect = json.data.admit_effect;
				old_admit_date = json.data.admit_date;
				old_serial_apply = json.data.serial_apply;
				if(is_apply_count){
					if(!confirm("该参保人已在'"+old_hosptail_name+"'存在有效门特放化疗申请'"+old_admit_effect+"'至'"+old_admit_date+"'，本次申请结束时间为'"+is_admit_date+"'。")){
						return;
					}
				}
				$("#bka085").val(old_serial_apply);
				wf_set_date($("#bka006").val(),is_admit_date);
			}else{
				is_admit_date = json.data.max_date;
				wf_set_date($("#bka006").val(),is_admit_date);
			}
		}
	}


	//note这里做了很多校验
	function apply_content(sel){
		wf_get_latest_apply();
	}
	
	function saveInfo(){

		var saveItemData = $("#mainForm").serialize();
		if($("#arg_value").val() ==""){
			popupAlert("请先输入申请人信息查询!");
			return;
		}
		if(!checkForm()){
			return;
		}
		//校验开始日期必须小于或等于结束日期
		if($("#aae030").val() != "" && $("#aae031").val() != ""){
			if($("#aae030").val() > $("#aae031").val()){
				popupAlert("开始日期必须小于或等于结束日期!");
				return;
			}
		}
		if(!confirm("是否保存申请信息!")){
			return;
		}else{
			if($("#aae031").val()!=""){
				if(is_admit_date >= $("#aae031").val()){
					if(!confirm("此人已经有截止至"+is_admit_date+"同类门特项目记录,~r~n是否继续!")){
						return;
					}
				}
			}
		}
		postJSON("<%=path%>/medicare/MtmmSpecialApplyAction!saveSpeBsInfo.action",saveItemData, afterSaveItem);
	}

	function afterSaveItem(json) {
		if (!checkJSONResult(json)) {
			return;
		} else {
			if (json.data == "") {
				popupAlert("保存信息失败!");
				clearall();//重置
			} else {
		     	popupInfo(json.data);
		     	$("#button_save").attr("disabled",true);
		     	$("#fundStatus").attr("disabled",true);
			}
		}
		
	}
	
	function clearall() {
		$("#aac001").val("");
		$("#aac003").val("");
		$("#aac004").val("");
		$("#aac066").val("");
		$("#aac002").val("");
		$("#aac006").val("");
		$("#bka008").val("");
		$("#aac007").val("");
		$("#bka006").val("");
		$("#arg_value").val("");
		$("#aae030").val("");
		$("#aae031").val("");
		$("#bke014").val("");
		$("#bke015").val("");
		$("#bke016").val("");
		$("#bke017").val("");
		$("#bke018").val("");
		$("#bke019").val("");
		$("#bke020").val("");
		$("#bke013").val("");
		$("#bke034").val("");
		$("#bke011").val("");
		$("#bke012").val("");
		$("#aae013").val("");
		$("#bke003").val("");
		$("#bka004").val("");
		$("#aab069").val("");
		$("#baa027").val("");
		$("#tracestring").val("");
		var myDate = new Date;
		var year = myDate.getFullYear();
		var month = (myDate.getMonth() + 1).toString().length == 1 ? "0"
				+ (myDate.getMonth() + 1).toString() : (myDate.getMonth() + 1).toString();
		var day = myDate.getDate().toString().length == 1 ? "0"+ myDate.getDate().toString() : myDate.getDate().toString();

		$("#bke019").val(year + "-" + month + "-" + day);
		$("#bke020").val(year + "-" + month + "-" + day);
		$("#bke034").val(year + "-" + month + "-" + day);
	}
	//基金状态查询
	function fundStatusInfo(){
		var aac001 = powersi.trim($("#aac001").val());
		if (powersi.isnull(aac001)) {
			popupAlert("请输入参数进行查询!");
			return;
		}
		var aae140 = powersi.trim($("#aae140").val());
		if (powersi.isnull(aae140)) {
			return;
		}
		popupDialog(
				{
					url : "${rootPath}/common/CommonManagerAction!queryPersonFund.action?inHospitalDTO.aac001="
							+ aac001 + "&inHospitalDTO.aae140=" + aae140,
					onClosed : function() {
						var retValue = this.returnValue;
						if (retValue) {

						} else {

						}
					}
				}, 400, 700);
	}
	function readic() {
		try {
			var objCard = document.getElementById("cardControl");
			if (objCard.object == null) {
				popupAlert("请先安装读卡插件");
			}
		} catch (e) {
			popupAlert("请先安装读卡插件");
		}
	}
	//查询业务申请人员基本信息
	   function queryPresonInfo(){
		   if (window.event.keyCode == 13) {
				var tracestring = powersi.trim($("#tracestring").val());
				if (powersi.isnull(tracestring)) {
					return;
				}
				$("#tracestring").attr("disabled", "disabled");
				findAac002(tracestring);
				$("#tracestring").removeAttr("disabled");
			}
	}
	   function findAac002(tracestring){
		  
			var indi_id = 0;
			var argValue = tracestring.substr(0);
		   //调用业务申请人员基本信息action
		   postJSON("<%=path%>/medicare/MtmmSpecialApplyAction!queryMediPersonInfo.action",
				   {"mediSpecDto.arg_name":indi_id,"mediSpecDto.arg_value":argValue},function(json){
			   if(!checkJSONResult(json)){
				   return;
			   }			   
				/* if (json.errortype==0) {
					$.each(json.data,function(key,value){
					    $("#"+key).val(value);
					});
				}else{
					popupInfo(json.message);
					return;
				} */
			   if (json.data.personinfo.length > 1) {//一个身份证对应多个电脑号，弹出选择窗口
					var personinfo = json.data.personinfo;
					$("#openDiv").remove();
					$("form").append("<div id='openDiv' ><div id='divGrid'></div><div class='space-y'></div></div>");
					$("#divGrid").ligerGrid({
				            columns: [
				                    { display: '姓名', name: 'aac003', width: '60'},
				                    { display: '电脑号', name: 'aac001', width: '80'},
					                { display: '社会保障号码', name: 'aac002', width: '100'},
					                { display: '单位编码', name: 'aab001', width: '100' },
					                { display: '单位名称', name: 'bka008', width: '100' }
					                ], 
				            height: 360,
				            width: '100%',
				            rowHeight: 28,
				            data:personinfo,
				            headerRowHeight: 29,
				            pageSizeOptions: [5, 10, 20],
				            pageStatMessage: '显示 {from} - {to}，共 {total} 条',
				            checkbox: true,
				            isMultiSelect:false,
				            rownumbers: true,
				            usePager:false,
				            showReload: false,
				            onSelectRow:function(data,rowid,rowdata){
				            	var indi_id=data['aac001'];
				            	postJSON(
								rootPath
										+ "/medicare/MtmmSpecialApplyAction!queryMediPersonInfo.action?mediSpecDto.arg_name=indi_id&mediSpecDto.arg_value="
										+ indi_id,
								function(json) {
									if (!checkJSONResult(json)) {
										return;
									}
									$.each(json.data.personinfo[0],
											function(key, value) {
												if (!powersi.isnull(value)) {
													$("#" + key).val(value);
												}
											});
									$("#aab069").val(json.data.personinfo[0].bka008);
									$("[name='mediSpecDto.bka004']").val(
											json.data.personinfo[0].bka004);
									$("[name='mediSpecDto.aac004']").val(
											json.data.personinfo[0].aac004);
								});
				        	   dlg.close();
				            }
				       }); 
					    var dlg =popupDiv('#openDiv', '选择参保人信息 ', 500, {
					  		showMax: true, 
					  		isHidden: false
					  	}); 
				}else{
					
					$.each(json.data.personinfo[0],
							function(key, value) {
								if (!powersi.isnull(value)) {
									$("#" + key).val(value);
								}
							});
					
					$("#aab069").val(json.data.personinfo[0].bka008);
					$("[name='mediSpecDto.bka004']").val(
							json.data.personinfo[0].bka004);
					$("[name='mediSpecDto.aac004']").val(
							json.data.personinfo[0].aac004);
				}	
		   });
			
			//启用门特(门慢)项目下拉列表
			//   $('#aka083').attr('disabled',false);
			$("#button_save").attr("disabled", false);
			$("#fundStatus").attr("disabled", false);
		}
		
						
	</script>
</body>
</powersi:html>