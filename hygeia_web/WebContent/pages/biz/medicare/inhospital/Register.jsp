<%@page import="com.powersi.ssm.biz.medicare.common.util.BizHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%
	String loginUser = BizHelper.getLoginUser().toUpperCase();
	if(loginUser.endsWith("TEST")){
		request.setAttribute("argName", "#{'aac001':'电脑号','aac002':'社会保障号'}");
	}else{
		request.setAttribute("argName", "#{'aac002':'社会保障号'}");
	}
	//TS19102100146 - 湘潭县分级诊疗相关政策调整【业务实现】
	//在本次住院的信息里增加一个差别化支付的下拉框选择 默认为0 add by 李嘉伦 20191024
	
	//【NTS20050800118】电子凭证动态库开发	 钟声 2020/05/05
    request.setAttribute("loginUser",BizHelper.getLoginUser());
    request.setAttribute("loginUserName",BizHelper.getUserName());
	request.setAttribute("akb020",BizHelper.getAkb020());
	//NTS20102600223 电子凭证机具设备管控  陈诗豪 20201027
	request.setAttribute("akb021",BizHelper.getAkb021());
	request.setAttribute("aaa027",BizHelper.getAaa027());
%>
<powersi:html>
<head>
<powersi:head title="住院登记" />
<script type="text/javascript" src="${rootPath}/resource/js/clinicUtils.js"></script>
</head>
<body>
	<%-- 【NTS20050800118】电子凭证动态库开发	NationECCode_ocx动态库注册 钟声 2020/05/05--%>
    <div style="display: none;">
        <object id="NationECCode_ocx"
                codeBase="${rootPath}/resource/cab/NationECCode_ocx.cab#version=1,0,0,1"
                width="0" height="0" border="0"
                classid="clsid:8EEF7302-1FC8-4BA0-8EA5-EC29FDBCA45B"></object>
     <%-- 【NTS20120101270】医保系统新增获取扫码设备SN码校验医保电子凭证设备准入需求 陈诗豪 2020/12/02--%>           
        <object id="idNldata" classid="CLSID:FEB51B1F-4C74-4305-8806-65605D529E22" codebase="NLDatastream_COM.cab#version=1,0,0,1"></object>
		            
    </div>
	<powersi:form id="register" namespace="/inhospital"
		action="InhospitalManagerAction!register.action">
		<powersi:panelbox key="查询条件">
			<powersi:panelbox-toolbar>
				<!--  【NTS20050800118】电子凭证动态库开发 唤醒扫码机 by 钟声 20200505 -->
                <div id="operFlag">
                    <td>电子凭证</td>
					<!-- 【NTS20052500228】使用支付宝设备点击二维码获取人员信息时，
                        只需要操作人员选择二维码还是刷脸的形式直接唤醒设备进行扫二维码或刷脸操作。
                        不需要参保人员在支付宝设备上进行选择。 龚喜洋  2020/05/26 -->
					<select id="transType" class="select" onchange="" style="width:100px;">
						<option value="0" selected="" style="width: 50px">微信解码</option>
						<option value="1" style="width: 50px" selected>支付宝解码</option>
						<option value="2" style="width: 50px" >支付宝刷脸</option>
					</select>
                </div>&nbsp;
                <powersi:button id="btnVoucher" label="获取电子凭证" onclick="callScanMachine()" disabled="false" />
                <!--  end  -->	
				<powersi:button id="readele_btn" key="扫码" />
				<powersi:button id="btSaveRegister" label="保存登记" key="button_save_register" 
					onclick="saveRegister()" />
				<powersi:button id="btFundStatusQuery" label="基金状态" key="button_query"
					onclick="fundStatusQuery()" />
				<powersi:button id="btcumulative" label="查询累计" key="button_query"
					onclick="cumulativeQuery()" />
				<powersi:button id="btRegisterReset" label="重置" key="button_reset"
					onclick="resetpage()" />
				<powersi:reset id="btReset" label="重置界面_hi" cssStyle="display:none;" />
			</powersi:panelbox-toolbar>
			<powersi:editorlayout cols="10%,10%,15%,8%,12%,8%,12%,10%,15%">
				<powersi:editorlayout-row>
					<powersi:codeselect id="argName" name="inHospitalDTO.argName"
						label="" cssClass="select2" list="${argName }" />
					<td>
						<powersi:textfield id="querystring" name="inHospitalDTO.querystring"
							title="请输入信息回车" placeholder="请输入信息回车!" readonly="false"
							onkeyup="findAac001()" buttonText="读卡" buttonId="readic_button"
							buttonDisabled="false"  />
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
			<powersi:editorlayout cols="8">
				<powersi:editorlayout-row>
					<powersi:textfield id="aac004_name"
						name="inHospitalDTO.aac004_name" label="性  别" readonly="true" />
 					<powersi:textfield id="bka035_name"
						name="inHospitalDTO.bka035_name" label="人员类别" readonly="true" />
				    <powersi:textfield id="bka010" name="inHospitalDTO.bka010"
						label="住院次数" readonly="true" />
					<powersi:textfield id="bka888_name"
						name="inHospitalDTO.bka888_name" label="基金状况" readonly="true" cssStyle="color:red;"/>
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:textfield id="bacu18"
						name="inHospitalDTO.bacu18" label="帐户余额" readonly="true" cssStyle="color:red;"/>
					<powersi:textfield id="aac148_name"
						name="inHospitalDTO.aac148_name" label="补助类型" readonly="true" />
					<powersi:textfield id="aac013_name"
						name="inHospitalDTO.aac013_name" label="人员状态" readonly="true" />
					<powersi:textfield id="bac001_name"
						name="inHospitalDTO.bac001_name" label="公务员级别" readonly="true"  />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:textfield id="baa027_name"
						name="inHospitalDTO.baa027_name" label="人员所属中心" readonly="true"  />
					<powersi:textfield id="district"
						name="inHospitalDTO.district" label="区/县" readonly="true" />
					<powersi:textfield id="bkm625"
						name="inHospitalDTO.bkm625" label="乡镇/街道" readonly="true" />
					<powersi:textfield id="bkm624"
						name="inHospitalDTO.bkm624" label="村/社区" readonly="true" />
				</powersi:editorlayout-row>
			</powersi:editorlayout>
		<powersi:panelbox key="上次住院">
			<powersi:editorlayout cols="8">
				<powersi:editorlayout-row>
					<powersi:textfield id="akb021_last"
						name="inHospitalDTO.akb021_last" label="医院名称" readonly="true" />
					<powersi:textfield id="aka121_last"
						name="inHospitalDTO.aka121_last" label="诊  断" readonly="true" />
					<powersi:textfield id="aae030_last"
						name="inHospitalDTO.aae030_last" label="入院日期" readonly="true" />
					<powersi:textfield id="aae031_last"
						name="inHospitalDTO.aae031_last" label="出院日期" readonly="true" />
				</powersi:editorlayout-row>
			</powersi:editorlayout>
		</powersi:panelbox>
		<powersi:panelbox key="本次登记">
			<powersi:editorlayout cols="8">
				<powersi:editorlayout-row>
					<%-- TS19102100146 - 湘潭县分级诊疗相关政策调整【业务实现】 增加差别化待遇支付 add by 李嘉伦20191024--%>
					<powersi:checkboxlist id="aka241" name="inHospitalDTO.aka241" codeFilter="data_value = '1'"
						label="差别化待遇支付" codeType="aka241" value="1" />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:hidden id="caa027" name="inHospitalDTO.caa027" value="4303-zg"/>
					<powersi:hidden id="aaa027" name="inHospitalDTO.aaa027" />
					<powersi:hidden id="baa027" name="inHospitalDTO.baa027" />
					<powersi:hidden id="aae140" name="inHospitalDTO.aae140" />
					<powersi:hidden id="akc193" name="inHospitalDTO.akc193" />
					<powersi:hidden id="bka035" name="inHospitalDTO.bka035" />
					<powersi:hidden id="aaz266" value="inHospitalDTO.aaz266" />
					<powersi:hidden id="isInpPsw" value="true"/>
					<powersi:hidden id="applytype" name="inHospitalDTO.applyType" />
					<powersi:hidden id="aac148" name="inHospitalDTO.aac148" />
					<powersi:hidden id="bac001" name="inHospitalDTO.bac001" />
					<powersi:hidden id="aka130" name="inHospitalDTO.aka130" />
					<powersi:hidden id="bke548" name="inHospitalDTO.bke548" />
					<powersi:hidden id="aab001" name="inHospitalDTO.aab001" />
					<powersi:hidden id="aac006" name="inHospitalDTO.aac006" />
					<powersi:hidden id="bka977_name" name="inHospitalDTO.bka977_name" />
					<powersi:hidden id="aab999" name="inHospitalDTO.aab999" label="单位管理码"/>
					<powersi:hidden id="aab019" name="inHospitalDTO.aab019" label="单位类型"/>
					<powersi:hidden id="bke054" name="inHospitalDTO.bke054" label="一站式标识"/>
					<powersi:hidden id="aaz267" name="inHospitalDTO.aaz267" label="特殊业务申请序列号"/>
					<powersi:hidden id="aac001" name="inHospitalDTO.aac001" />
					<powersi:hidden id="bke301" name="inHospitalDTO.bke301" />
					<powersi:hidden id="aka101" name="inHospitalDTO.aka101" />
					<powersi:hidden id="aac004" name="inHospitalDTO.aac004" />

					<powersi:hidden id="aae013" name="inHospitalDTO.aae013" />
					<powersi:hidden id="aaf013" name="inHospitalDTO.aaf013" />
					<powersi:hidden id="aaz070" name="inHospitalDTO.aaz070" />
					<powersi:hidden id="baf003" name="inHospitalDTO.baf003" />
					<powersi:hidden id="bkm623" name="inHospitalDTO.bkm623" /> 
					<!-- TS19072500248 - 【需求开发】读卡进行密码签名验证 ，前台获取 ，后台验证  陈洁 20190801  -->
		            <powersi:hidden id="bkz300" name="inHospitalDTO.bkz300" />
					<!--【NTS20051100306】 【医保】通过电子凭证办理的待遇业务需要有相关记录，确保后续能够统计查询  龚喜洋  2020/06/04 -->
					<powersi:hidden id="aka242" name="inHospitalDTO.aka242" value="0"/>
					<!--【NTS20071500412】 【医保】通过电子凭证办理的结算需要发送消息通知，需要传电子凭证，身份证，姓名给后台  方然青  2020/07/20 -->
					<powersi:hidden id="ecIndexNo" name="inHospitalDTO.ecIndexNo" value=""/>
					<!--【NTS20082000023】 【医保】通过电子凭证办理的结算需要发送消息电子凭证中台回流接口  陈诗豪  2020/08/20 -->
					<powersi:hidden id="idNo" name="inHospitalDTO.idNo" value=""/>
					<powersi:hidden id="idType" name="inHospitalDTO.idType" value=""/>
					<powersi:hidden id="ecToken" name="inHospitalDTO.ecToken" value=""/>
					<!--【NTS20120101270】 【医保】医保系统新增获取扫码设备SN码校验医保电子凭证设备准入需求  陈诗豪  2020/12/02 -->
					<powersi:hidden id="sn_code" name="inHospitalDTO.sn_code" value=""/>
					<powersi:textfield id="aaa027_name"
						name="inHospitalDTO.aaa027_name" label="医保分中心" readonly="true" />
					<powersi:textfield id="akb021" name="inHospitalDTO.akb021"
						label="医院名称" readonly="true" />
					<powersi:textfield id="aka130_name"
						name="inHospitalDTO.aka130_name" label="业务类型" readonly="true" />
					<powersi:textfield id="aae140_name"
						name="inHospitalDTO.aae140_name" label="险种类型" readonly="true" />					
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>					
					<powersi:textfield id="aae030" name="inHospitalDTO.aae030"
						label="入院日期" mask="date" required="true" readonly="false" />
					<powersi:codeselect id="bka006" name="inHospitalDTO.bka006"
						label="待遇类型" cssClass="select2" codeType="bka006"
						codeFilter="data_value like '12_' and data_value <> '126' and data_value <> '124' and data_value <> '12M' "
						codeLocal="${inHospitalDTO.aaa027}" required="true"
						displayonly="false" showValue="false" headerKey="0" onchange="getSPinfo()"/>
					<powersi:textfield id="akc190" name="inHospitalDTO.akc190"
						label="住院号" onkeydown="keydown(this)" required="true"
						readonly="false" />
					<powersi:textfield id="bkz101"
						name="inHospitalDTO.bkz101" label="入院诊断" title="请输入入院诊断"
						onkeydown="keydown(this)" required="true"
						readonly="true" buttonText="选择" buttonId="bka026_button"
						buttonDisabled="false" onbuttonclick="chooseDisease()" />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:codeselect id="akf001" name="inHospitalDTO.akf001"
						label="入院科室" cssClass="select2" list="#request.akf001List"
						headerKey="" headerValue="请选择..." required="true"
						onchange="selectBka021()" showValue="false" />
					<powersi:codeselect id="bka021" name="inHospitalDTO.bka021"
						label="入院病区" cssClass="select2" list="#request.bka021List"
						headerKey="" headerValue="请选择..." required="true"
						onchange="selectAke020()" showValue="false" />
					<powersi:codeselect id="ake020" name="inHospitalDTO.ake020"
						label="床位号" cssClass="select2" list="#request.ake020List"
						headerKey="" headerValue="请选择..." required="true"
						onchange="selectAke022()" showValue="false" />
					<powersi:codeselect id="ake022" name="inHospitalDTO.ake022"
						label="主治医生" cssClass="select2" list="#request.ake022List"
						headerKey="" headerValue="请选择..." showValue="false" />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:textfield id="bka245" name="inHospitalDTO.bka245"
						label="预付款"  readonly="false" />
					<powersi:codeselect id="bka061" name="inHospitalDTO.bka061"
						label="病情严重程度" cssClass="select2" readonly="false" codeType="bka061"
						headerKey="" headerValue="请选择..." showValue="false"
						codeLocal="${inHospitalDTO.aaa027}" />
					<powersi:textfield id="aae004" name="inHospitalDTO.aae004"
						label="联系人" readonly="false" />
					<powersi:textfield id="aae005" name="inHospitalDTO.aae005"
						label="联系电话" readonly="false" required="true"/>	
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:textfield id="aae006" name="inHospitalDTO.aae006"
						label="联系地址" colspan="3" readonly="false" />
					<powersi:textfield id="ake024" name="inHospitalDTO.ake024"
						label="病情备注" colspan="3" readonly="false" />
				</powersi:editorlayout-row>
			</powersi:editorlayout>
		</powersi:panelbox>
		<powersi:panelbox key="其它诊断信息">		
			<powersi:panelbox-toolbar>
				<powersi:button id="btn_selDiagnoseinfo" label="其它诊断" key="button_query" onclick="chooseGridDiagnoseinfo()" />
				<powersi:button id="btn_deleteDiagnoseinfo" label="删除" key="button_delete" onclick="doDelete()" />
			</powersi:panelbox-toolbar>
		 	<powersi:datagrid id="gridDiagnoseinfo"  delayLoad="true" showReload="false" 
		 		autoWidth="true" enabledSort="false" alternatingRow="true" checkbox="true" 
		 		colDraggable="false" height="200" pageSize="10" rownumbers="true" > 
		 		<powersi:datagrid-column display="序号" name="bke558" width="0%" hide="true"  />
	            <powersi:datagrid-column display="编码" name="aka120" width="40%"  />
	            <powersi:datagrid-column display="名称" name="aka121" width="60%" />
	            <powersi:datagrid-column display="类型" name="bke559" width="0%" hide="true"  />
     		</powersi:datagrid>
    		<powersi:hidden id="diagnoseinfo" name="diagnoseinfo" />
		</powersi:panelbox>
	</powersi:form>
	 <!--  【NTS20050800118】电子凭证动态库开发 支付宝扫码机唯一流水号存储 by 钟声 20200505 -->
       <powersi:hidden id="outBizNo" /> 
	<powersi:errors />
	<!--  【NTS20050800118】电子凭证动态库开发 电子凭证接口请求js by 钟声 20200505 -->
	<script type="text/javascript" src="${rootPath}/resource/js/medicaretag/electronicVoucher.js"></script>
	<script type="text/javascript">
	    var aaa027 = $("#aaa027").val().substring(0,4);

		var saveRegisterFlag = false;
		var objCard = null;
		$(document).ready(function() {
			$("#querystring").focus();
		});

		function readIcCard() {
			var querystring = powersi.trim($("#querystring").val());
			getPerson(querystring);
		}

		/*初始化*/
		function init() {
			saveRegisterFlag = false;
			$("#bkz300").val("");
			$("#bke301").val("");
			$("#bac001").val("");
			$("#aab999").val("");
			$("#aka101").val("");
			$("#aac004").val("");
			$("#aac006").val("");
			$("#aab001").val("");
			$("#aab019").val("");
			$("#bka035").val("");
			$("#bke054").val("");
			
			$("#aaa027").val("");
			$("#akc193").val("");
			$("#baa027").val("");
			$("#aae140").val("");
			$("#bke548").val("");
			$("#querystring").val("");
			$("#bka977_name").val("");
			$("#aac001").val("");
			$("#aac002").val("");
			$("#aac003").val("");
			$("#querystring").prop("disabled", false);
			$("#btSaveRegister").prop("disabled", true);
			//待遇类型
			//$("#bka006").val("120");
			//入院科室
			$("#akf001").val("");
			//入院病区
			$("#bka021").empty();
			//入院床位号
			$("#ake020").empty();
			//医保医师
			$("#ake022").empty();
			$("#bka021").append("<option value='' >" + "请选择..." + "</option>");
			$("#ake020").append("<option value='' >" + "请选择..." + "</option>");
			$("#ake022").append("<option value='' >" + "请选择..." + "</option>");
			$("#bka021").change();
			$("#ake020").change();
			$("#ake022").change();
			$("#akf001").change();
			//$("#bka006").change();
			$("#alc023").val("2");
			$("#bka510").val("1");
			$("#bka061").val("");
			$("#bka061").change();
			$("#argName option:selected").val('aac002');
			$("#argName").change();
			gridDiagnoseinfo.reset();
			//电子凭证 钟声
			electronicVoucher = null;
			//【NTS20051100306】 【医保】通过电子凭证办理的待遇业务需要有相关记录，确保后续能够统计查询  龚喜洋  2020/06/04
			$("#aka242").val("0");
			$("#ecIndexNo").val("");
			$("#idNo").val("");
			$("#idType").val("");
			$("#ecToken").val("");
		}

		/*重置界面*/
		function resetpage() {
			var bka006 = $("#bka006").val();
			$("#btReset").click();
			$("#bka006").val(bka006);
			init();
		}

		function keydown(param) {
			if (event.keyCode == "13") {
				var filed_name = param.id;
				if ("akc190" == filed_name) {
					var akc190 = powersi.trim($("#akc190").val());
					if (powersi.isnull(akc190)) {
						return $("#akc190").focus();
					}
					return $("#bkz101").focus();
				}
				if ("bkz101" == filed_name) {
					return chooseDisease();
				}
				if ("bka018" == filed_name) {
					return choosebka018();
				}
			}
		}

		/*
		 * 待遇类型判断
		 */
		var res = true;
		function selectbka006() {
			var register = $("#btSaveRegister").prop("disabled");
			var registerData = $("#register").serialize();
			if (res) {
				res = register;
			}
			postJSON(
					"${rootPath}/inhospital/InhospitalManagerAction!selectbka006.action",
					registerData, function(json) {
						if (!checkJSONResultNew(json)) {
							$("#btSaveRegister").prop("disabled", true);
							return;
						}
						$("#btSaveRegister").prop("disabled", res);
					});
		}

		/*多疾病录入*/
		function choosebka018() {
			popupDialog(
					{
						url : "${rootPath}/common/CommonManagerAction!chooseDiseases.action",
						onClosed : function() {
							var retValue = this.returnValue;
							if (retValue) {
								$("#bka018").val(retValue.bka018);
								return $("#bka018").focus();
							} else {
								$("#bka018").val("");
								return $("#bka018").focus();
							}
						}
					}, 500, 600);
		}

		/*可录入状态*/
		function inputOn() {
			$("#querystring").prop("disabled", false);
		}

		/*不可录入状态*/
		function inputOff() {
			/*规避重复操作处理_不可用*/
			$("#querystring").prop("disabled", true);
		}

		/*查询参保信息*/
		function findAac001() {
			if (window.event.keyCode == 13) {
				var querystring = powersi.trim($("#querystring").val());
				var argName = powersi.trim($("#argName").val());
				if (powersi.isnull(querystring)) {
					popupAlert("请输入有效查询条件!");
					return;
				}
				var aae030 = powersi.trim($("#aae030").val());
				if (!powersi.isnull(aae030)) {
					$("#aae030").val(aae030);
				}
				$("#querystring").val(querystring);
				$("#argName").val(argName);
				$("#argName").change();
 				if('aac002'==argName){//如果是身份证获取人员信息，需先校验身份信息
 					checkIcCard(querystring);
 				}else{
					getPerson(querystring);
 				}
			}
		}

		/*住院登记界面要支持：身份证号码、电脑号、社保卡号*/
		function getPerson(querystring) {
			var argName = powersi.trim($("#argName").val());
			if (powersi.isnull(querystring)) {
				$("#querystring").val("");
			} else {
				$("#querystring").val(querystring);
				if('aac002'==argName){
					$("#aac002").val(querystring);
				}
			}
			var registerData = $("#register").serialize();
			$("#querystring").attr("disabled", true);
			postJSON(
					"${rootPath}/inhospital/InhospitalManagerAction!findAac001.action",
					registerData, function(json) {
						if (!checkJSONResultNew(json)) {
							init();
							return;
						}
						/* if (json.data.nocardreminderflag == "1"){
							var kz07 = JSON.parse(json.data.kz07info);
							popupAlert("社保卡已制卡未领取, 请及时领取！" + "领卡地址：" + kz07.baz013 + ", 银行联系电话：" + kz07.baz015);
						} */
						if (json.data != "no" && json.data.length > 1) {
							if (powersi.isnull(querystring)) {
								chooseAac002(argName, json.message);
								$("#querystring").val(json.message);
							} else {
								chooseAac002(argName, querystring);
							}
							return;
						}
						if (json.data != "no") {
							$.each(json.data, function(key, value) {
								if (!powersi.isnull(value)) {
									$("#" + key).val(value);
								}
								if(key=="bka888_name"){
									//alert(JSON.stringify(json.data));
									//return;
									if(value!="正常") {
										//TS19051400133 结算云（医院端）-  （门诊业务管理、住院业务管理、生育住院管理、家庭病床管理、异地就医管理）-  
										//办业务读卡后，如果此人的基金是冻结状态，则弹出一个提示框提示一下这个人基金冻结 cj 20190515
										popupAlert("您好!此参保人基金冻结状态为【已冻结】,将不能进行基金报销,请知悉!");
									}
								}
							});
						}
						if (!powersi.isnull(json.message)) {
							popupInfo(json.message);
						}
						afterFindAac001();
					});
		}

		/*查询并选择参保信息*/
		function chooseAac002(argName, querystring) {
			var aka130 = powersi.trim($("#aka130").val());
			if (powersi.isnull(aka130)) {
				return;
			}
			var caa027 = powersi.trim($("#caa027").val());
			if (powersi.isnull(caa027)) {
				return;
			}
			popupDialog(
					{
						url : "${rootPath}/common/CommonManagerAction!choosePersonAac001.action"
							+ "?inHospitalDTO.argName=" + argName 
							+ "&inHospitalDTO.querystring=" + querystring 
							+ "&inHospitalDTO.aka130=" + aka130
							+ "&inHospitalDTO.caa027=" + caa027,
						onClosed : function() {
							var retValue = this.returnValue;
							if (retValue) {
								accessAac001(retValue.aac001);
							}
						}
					}, 500, 600);
		}

		/*根据电脑号查询参保信息*/
		function accessAac001(aac001) {
			if (powersi.isnull(powersi.trim(aac001))) {
				return;
			}
			$("#bke548").val("");
			$("#querystring").val(powersi.trim(aac001));
			$("#bka977_name").val("1");
			$("#aac001").val(powersi.trim(aac001));
			$("#argName").val("aac001");
			$("#argName").change();
			//$("#tracestring").val(powersi.trim(aac001));
			var registerData = $("#register").serialize();
			postJSON(
					"${rootPath}/inhospital/InhospitalManagerAction!findAac001.action",
					registerData, function(json) {
						$("#bka977_name").val("");
						if (!checkJSONResultNew(json)) {
							init();
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
						afterFindAac001();
					});
		}

		function afterFindAac001() {
			$("#btSaveRegister").prop("disabled", false);
		}

		/*加载医保医师*/
		function selectAke022() {
			//入院科室
			var akf001 = $("#akf001").val();
			if (powersi.isnull(akf001)) {
				return;
			}
			//入院病区
			var bka021 = $("#bka021").val();
			if (powersi.isnull(bka021)) {
				return;
			}
			//入院床位号
			var ake020 = $("#ake020").val();
			$("#ake022").empty();
			$("#ake022").append("<option value='' >" + "请选择..." + "</option>");
			$("#ake022").change();
			if (powersi.isnull(ake020)) {
				return;
			}
			postJSON(
					"${rootPath}/inhospital/InhospitalManagerAction!loadAke022List.action",
					{
						"inHospitalDTO.akf001" : akf001
					}, function(json) {
						if (!checkJSONResultNew(json)) {
							return;
						}
						if (json.data != "no") {
							var a = [];
							$.each(json.data, function(key, value) {
								a.push('<option value="');
								a.push(key);
								a.push('"');
								a.push(">");
								a.push(value);
								a.push("</option>");
							});
							$("#ake022").append(a.join(''));
						}
						if (!powersi.isnull(json.message)) {
							popupInfo(json.message);
						}
					});
		}

		/*加载床位号*/
		function selectAke020() {
			//入院科室
			var akf001 = $("#akf001").val();
			if (powersi.isnull(akf001)) {
				return;
			}
			//入院病区
			var bka021 = $("#bka021").val();
			//入院床位号
			$("#ake020").empty();
			//医保医师
			$("#ake022").empty();
			$("#ake020").append("<option value='' >" + "请选择..." + "</option>");
			$("#ake022").append("<option value='' >" + "请选择..." + "</option>");
			$("#ake020").change();
			$("#ake022").change();
			if (powersi.isnull(bka021)) {
				return;
			}
			postJSON(
					"${rootPath}/inhospital/InhospitalManagerAction!loadAke020List.action",
					{
						"inHospitalDTO.bka021" : bka021
					}, function(json) {
						if (!checkJSONResultNew(json)) {
							return;
						}
						if (json.data != "no") {
							var a = [];
							$.each(json.data, function(key, value) {
								a.push('<option value="');
								a.push(key);
								a.push('"');
								a.push(">");
								a.push(value);
								a.push("</option>");
							});
							$("#ake020").append(a.join(''));
						}
						if (!powersi.isnull(json.message)) {
							popupInfo(json.message);
						}
					});
		}

		/*加载病区*/
		function selectBka021() {
			var akf001 = $("#akf001").val();	//入院科室
			$("#bka021").empty();	//入院病区
			$("#ake020").empty();	//入院床位号
			$("#ake022").empty();	//医保医师
			
			$("#bka021").append("<option value='' >" + "请选择..." + "</option>");
			$("#ake020").append("<option value='' >" + "请选择..." + "</option>");
			$("#ake022").append("<option value='' >" + "请选择..." + "</option>");
			
			$("#bka021").change();
			$("#ake020").change();
			$("#ake022").change();
			if (powersi.isnull(akf001)) {
				return;
			}
			postJSON(
					"${rootPath}/inhospital/InhospitalManagerAction!loadBka021List.action",
					{
						"inHospitalDTO.akf001" : akf001
					}, function(json) {
						if (!checkJSONResultNew(json)) {
							return;
						}
						if (json.data != "no") {
							var a = [];
							$.each(json.data, function(key, value) {
								a.push('<option value="');
								a.push(key);
								a.push('"');
								a.push(">");
								a.push(value);
								a.push("</option>");
							});
							$("#bka021").append(a.join(''));
						}
						if (!powersi.isnull(json.message)) {
							popupInfo(json.message);
						}
					});
		}

		/*基金状态*/
		function fundStatusQuery() {
			var aac001 = powersi.trim($("#aac001").val());
			if (powersi.isnull(aac001)) {
				return;
			}
			var aae140 = powersi.trim($("#aae140").val());
			if (powersi.isnull(aae140)) {
				return;
			}
			var caa027 = powersi.trim($("#caa027").val());
			if (powersi.isnull(caa027)) {
				return;
			}
			var aka130 = powersi.trim($("#aka130").val());
			if (powersi.isnull(aka130)) {
				return;
			}
			popupDialog(
					{
						url : "${rootPath}/common/CommonManagerAction!queryPersonFund.action?inHospitalDTO.aac001="
								+ aac001 + "&inHospitalDTO.aae140=" + aae140 + "&inHospitalDTO.caa027=" 
								+ caa027 + "&inHospitalDTO.aka130=" + aka130,
						onClosed : function() {
							var retValue = this.returnValue;
							if (retValue) {

							} else {

							}
						}
					}, 400, 700);
		}

		/*累计查询*/
		function cumulativeQuery() {
			var aac001 = powersi.trim($("#aac001").val());
			if (powersi.isnull(aac001)) {
				return;
			}
			var baa027 = powersi.trim($("#baa027").val());
			if (powersi.isnull(baa027)) {
				return;
			}
			var caa027 = powersi.trim($("#caa027").val());
			if (powersi.isnull(caa027)) {
				return;
			}
			var aka130 = powersi.trim($("#aka130").val());
			if (powersi.isnull(aka130)) {
				return;
			}
			popupDialog(
					{
						url : "${rootPath}/common/CommonManagerAction!cumulativeQuery.action?inHospitalDTO.aac001="
								+ aac001 + "&inHospitalDTO.baa027=" + baa027 + "&inHospitalDTO.caa027=" + caa027
								+ "&inHospitalDTO.aka130=" + aka130,
						onClosed : function() {
							var retValue = this.returnValue;
							if (retValue) {

							} else {

							}
						}
					}, 400, 600);
		}

		/*保存住院登记*/
		function saveRegister() {
			if (!checkForm()) {
				return;
			}
			if(electronicVoucher !== null){
				if(checkVoucher()){
					return;
				}
				//【NTS20051100306】 【医保】通过电子凭证办理的待遇业务需要有相关记录，确保后续能够统计查询  龚喜洋  2020/06/04
				$("#aka242").val("1"); // 1表示电子凭证办理的业务
			}
			inputOff();

			if($("#argName").val()==="qrcode"){
				$("#aae013").val("1");
			}

			var aac003 = powersi.trim($("#aac003").val());
			var aaz266 = powersi.trim($("#aaz266").val());
			popupConfirm("您确认保存[" + aac003 + "]的住院登记信息吗?", "确认", function(isOk){
				if(isOk){
					initDiagnoseinfo();
					$("#btSaveRegister").prop("disabled", true);
					var registerData = $("#register").serialize();
					postJSON(
							"${rootPath}/inhospital/InhospitalManagerAction!register.action?inHospitalDTO.aaz266="+aaz266,
							registerData, function(json) {
								$("#btSaveRegister").prop("disabled", false);
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
								afterSaveRegister();
								saveRegisterFlag = true;
								if (!powersi.isnull(json.message)) {
									popupInfo(json.message);
								}
								//【NTS20051200240】湘潭-医保电子凭证支付通知需求  支付通知 by 钟声 2020/5/13
								if(electronicVoucher !== null){
									sendMessage( "settle",true,"${loginUser}","${loginUserName}",
											"0","0","0");
								}
							});
				}
				inputOn();
			});
		}

		function afterSaveRegister() {
			$("#btSaveRegister").prop("disabled", true);
		}
		
		function initDiagnoseinfo() {
			var diagnoseinfo = gridDiagnoseinfo.getData();
			diagnoseinfo = powersi.tostring(diagnoseinfo);
			$("#diagnoseinfo").val(encodeURI(diagnoseinfo));
		}

		var num_diagnose_sn = 1;
		function chooseGridDiagnoseinfo() {
			var bka006 = $("#bka006").val();
			var caa027 = $("#caa027").val();
			if("121"==bka006){
				postJSON(
						"${rootPath}/inhospital/InhospitalManagerAction!is106Disease.action?ka06dto.aka120="+$("#akc193").val(),
						function(json) {
							if (!checkJSONResultNew(json)) {
								return;
							}
							var url = "";
							if("1"==json.data){
								$("#aaz266").val(json.data);
								url = "${rootPath}/inhospital/InhospitalManagerAction!choose106SubDisease.action"
								+ "?ka06dto.aka120="+$("#akc193").val();
							}else{
								url = "${rootPath}/common/CommonManagerAction!chooseDisease.action?ka06dto.aka035=2";
							}
								popupDialog({
									url : url,
									onClosed : function() {
										var retValue = this.returnValue;
										if (retValue) {
					
											var jsonFee = {
												"aka120" : retValue.aka120,
												"aka121" : retValue.aka121,
												"bke558" : num_diagnose_sn++,
												"bke559" : "1"
											};
											gridDiagnoseinfo.add(jsonFee);
										}
									}
								}, 500, 600);
						});
			}else{
				popupDialog({
					url : "${rootPath}/common/CommonManagerAction!chooseDisease.action",
					onClosed : function() {
						var retValue = this.returnValue;
						if (retValue) {
	
							var jsonFee = {
								"aka120" : retValue.aka120,
								"aka121" : retValue.aka121,
								"bke558" : num_diagnose_sn++,
								"bke559" : "1"
							};
							gridDiagnoseinfo.add(jsonFee);
						}
					}
				}, 500, 600);
			}
		}

		function doDelete() {
			if (typeof (gridDiagnoseinfo.getSelectedRows()) == "undefined"
					|| gridDiagnoseinfo.getSelectedRows() == null
					|| gridDiagnoseinfo.getSelectedRows() == "") {
				popupAlert("请选择要删除的其它诊断", "提示", "info");
				return;
			}
			popupConfirm("是否删除已选择的其它诊断?", "确认", function(isOk) {
				gridDiagnoseinfo.deleteSelectedRow();
			});
		}
		
		function chooseDisease() {
			var bka006 = $("#bka006").val();
			var bke301 = $("#bke301").val();
			var condiation = "";
			if("128"==bka006||"129"==bka006){
				condiation = "?ka06dto.aka035=6&ka06dto.bke301="+bke301;
			}
			if("121"==bka006){
				condiation = "?ka06dto.aka035=2";
			}
			popupDialog(
					{	
						url : "/hygeia_web/common/CommonManagerAction!chooseDisease.action"+condiation,
						onClosed : function() {
							var retValue = this.returnValue;
							if (retValue) {
								$("#bkz101").val(retValue.aka121);
								$("#akc193").val(retValue.aka120);
								return $("#akf001").focus();
							} else {
								$("#bkz101").val("");
								$("#akc193").val("");
							}
							return $("#akc193").focus();
						}
					}, 500, 600);
		}
		
		
		function getSPinfo(){
			var bka006 = $("#bka006").val();
			if("12X"==bka006){
				var aac001 = $("#aac001").val();
				accessAac001(aac001);
			}
		}
		//【NTS20050800118】电子凭证动态库开发   用于获取扫码机返回的电子凭证,并进行查询 钟声 2020/04/29
	    function callScanMachine(){
	        var transType  = $("#transType").val();
	        if(transType !=='0'){//获取唯一业务流水号  outBizNo
	            var outBizNo = getOutBizNo();
	            $("#outBizNo").val(outBizNo);
	        }
	        //NTS20102600223 电子凭证机具设备管控  陈诗豪 20201027
	        var bka021 = "${akb021}";
            var aaa027 = "${aaa027}";
	        var resultMap =  machineScanning(transType,"${loginUser}","${loginUserName}","${akb020}","01301",outBizNo,bka021,aaa027);
	        if(resultMap.code===0){
	            var idNo ;
	            var ecIndexNo;
	            var idType;
				var ecToken;
	            if(transType === '0'){
	                electronicVoucher = resultMap.data;
	                idNo = electronicVoucher.idNo;
	                ecIndexNo = electronicVoucher.ecIndexNo;
	                idType = electronicVoucher.idType;
					ecToken = electronicVoucher.ecToken;
	            }else {
	                electronicVoucher = resultMap.extra;
	                idNo = electronicVoucher.idNo;
	                ecIndexNo = electronicVoucher.ecIndexNo;
	                idType = electronicVoucher.idType;
					ecToken = electronicVoucher.ecToken;
	            }
	            $("#ecIndexNo").val(ecIndexNo);
	            $("#idNo").val(idNo);
				$("#ecToken").val(ecToken);
				$("#idType").val(idType);
	            $("#aka242").val("1");
	            $("#querystring").val(idNo);
	            $("#argName option:first").prop('selected', 'selected');
	            $("#argName option:selected").val('aac002');
	            getPerson(idNo);
	        }else {
	            //失败
	            electronicVoucher = null;
	            alert(resultMap.message);
	        }
	    }
	</script>
</body>
</powersi:html>