<%@page import="com.powersi.ssm.biz.medicare.common.util.BizHelper"%>
<%@page import="com.powersi.hygeia.framework.ParameterMapping"%>
<%@page import="java.util.Date"%>
<%@page import="com.powersi.hygeia.framework.util.DateFunc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%
	boolean isPic = "1".equals(ParameterMapping.getStringByCode("need_pictures","1"));
	request.setAttribute("hospital_id",BizHelper.getAkb020());
	Object cameraInfo = session.getAttribute("cameraInfo");
	String loginUser = BizHelper.getLoginUser().toUpperCase();
	request.setAttribute("argName", "#{'idcard':'社会保障号','indi_id':'电脑号','iccardno':'IC卡号','insr_code':'保险号'}");
%>
<powersi:html>
<head>
	<powersi:head title="异地门诊特殊病收费" />
	<%@ include file="/pages/util/header/combogrid.jsp"%>
</head>
<body>
	<powersi:form id="bizForm" namespace="/diagnose"
		action="DiagnoseRegisterAction!register.action">
		<powersi:panelbox key="查询条件" allowCollapse="false">
			<powersi:panelbox-toolbar>
				<powersi:radio id="operFlag" name="operFlag"
					list="#{'1': '收费操作', '2':'改费操作'}" value='1' colspan="2"
					onclick="dealoperFlag()" />
				<powersi:button id="btnCalc0" key="button_calc0" onclick="calc(0);" disabled="true" />
				<powersi:button id="btnCalc1" key="button_calc1" onclick="calc(1);" disabled="true" />
				<powersi:button id="btnReset" key="button_clear" onclick="resetpage();" disabled="false" />
			</powersi:panelbox-toolbar>
			<powersi:editorlayout cols="7%,12%,5%,8%,8%,13%,9%,13%,9%,13%">
				<powersi:editorlayout-row>
					<powersi:codeselect id="argName" name="diagnoseInfoDTO.arg_name"
						label="查询条件" cssClass="select2" list="${argName }" />
					<td colspan="2"><powersi:textfield id="querystring" name="querystring" 
						title="请输入信息回车" placeholder="请输入信息回车" readonly="false"
						onkeydown="getPersonInfo(this)" buttonText="读卡"
						buttonId="readic_button" buttonDisabled="false" /></td>
					<powersi:textfield id="idcard" key="社会保障号码"
						name="diagnoseInfoDTO.idcard" readonly="true" />
					<powersi:textfield id="corp_name" key="单位名称"
						name="diagnoseInfoDTO.corp_name" readonly="true" />
					<powersi:textfield id="name" key="姓名"
						name="diagnoseInfoDTO.name" readonly="true" />
				</powersi:editorlayout-row>
			</powersi:editorlayout>
		</powersi:panelbox>
		<tags:mediBizInfo_special_charge_remote />
  		<tags:mediFeeInfo_datagrid_special_remote />
    	<tags:mediHisPayInfo />
		<powersi:hidden id="reduceflag" key="退改费类型"
			name="diagnoseInfoDTO.reduceflag" value="0" />
		<powersi:hidden id="bke548" name="inHospitalDTO.bke548" />
		<powersi:hidden id="center_id" name="diagnoseInfoDTO.center_id" />
		<powersi:hidden id="aac148" name="diagnoseInfoDTO.aac148" />
		<powersi:hidden id="bke054" name="diagnoseInfoDTO.bke054" label="一站式标识"/>
		<powersi:hidden id="caa027" name="inHospitalDTO.caa027" value="4303-zg"/>
		<powersi:hidden id="aae013" name="diagnoseInfoDTO.aae013" />
		<powersi:hidden id="hospital_id" name="diagnoseInfoDTO.hospital_id" value="${hospital_id}"/>
		<powersi:hidden id="bkz300" name="diagnoseInfoDTO.bkz300" />  
		<powersi:hidden id="argnames"/>
        <powersi:hidden id="query_flag" name="diagnoseInfoDTO.query_flag" value="0"  />
	</powersi:form>
	<powersi:errors />
	<script type="text/javascript" src="${rootPath}/resource/js/clinicUtils.js"></script>
</body>
</powersi:html>
<script type="text/javascript">
	var cameraInfo = '<%=cameraInfo%>';
	var isReadCard = "0";
	function readIcCard(){
		isReadCard = "1";
		if("0" == $("#reduceflag").val()){
			getPerson();
		} else {
			afterChoosePerson();
		}
	}

	function dealoperFlag() {
		var operFlag = $(':radio[name="operFlag"]:checked').val();
		init();
		if (operFlag == 1) {
			$("#stext").attr("disabled", false);
			$("#price").attr("disabled", false);
			$("#dosage").attr("disabled", false);
			$("#money").attr("disabled", false);
			$("#btn_enter").attr("disabled", false);
			$("#btn_delete").attr("disabled", false);
			$("#reduceflag").val("0");//收费
            $("#query_flag").val("0");//收费
		} else {
			$("#stext").attr("disabled", true);
			$("#price").attr("disabled", true);
			$("#dosage").attr("disabled", true);
			$("#money").attr("disabled", true);
			$("#btn_enter").attr("disabled", true);
			$("#btn_delete").attr("disabled", true);
			$("#reduceflag").val("1");//退费
            $("#query_flag").val("1");//退费
		}
	}

	function calc(str) {
		if (!checkForm()) {
			return;
		}

		if($("#argName").val()==="qrcode"){
			$("#aae013").val("1");
		}

		if ($("#indi_id").val() == '' || $("#indi_id").val() == -1) {
			popupAlert("请先检索到人员信息后再录入费用计算！");
			return $("#queryString").focus();
		}
		//NTS20072200316 湘潭市异地门特业务收费时优化 异地门特通过身份证不需要采集照片，此功能先暂时屏蔽 陈洁  20200722
		<%-- if(<%=isPic%>){
			if($("#argName").val()=="idcard" && $("#reduceflag").val()=="0" &&
				($("#dlrimg").attr("src")=="" || $("#dlrimg").attr("src")==undefined) &&
				isReadCard=="0"){
				popupAlert("未检测到照片，请重新采集！");
				return;
			}
		} --%>

		var feeinfo = gridFeeDetail.getData();
		feeinfo = powersi.tostring(feeinfo);
		$('#feeinfo').val(encodeURI(feeinfo));
		if (gridFeeDetail.getRowsCount() <= 0) {
			popupAlert("请先录入费用后再计算！");
			return;
		} 
		if (str == "0") {
			var saveItemData = $("#bizForm").serialize();
			postJSON(
					"${rootPath}/medicare/DiagnoseRegisterAction!diagnoseCalcSave_remote.action",
					saveItemData, importCalcInfo);
		} else {
			var saveItemData = $("#bizForm").serialize();
			postJSON(
					"${rootPath}/medicare/DiagnoseRegisterAction!diagnoseCalcEnPay_remote.action",
					saveItemData, importCalcInfo);
		}
	}

	function importCalcInfo(json) {
		if (!checkJSONResult(json)) {
			return;
		}
		popupSuccess(json.message, "提 示", function(){
			if (json.message == '异地业务收费成功！') {
				printreport();
			}
		});
		if (json.message == '异地业务试算成功！') {
			$("#em_jsq").val('');
			document.all.em_jsq.focus();
			$("#btnCalc1").attr("disabled", false);
		}
		if (json.message == '异地业务收费成功！') {
			var serial_no = json.data[0].serial_no;
			$("#serial_no").val(serial_no);
			$("#btnFace").attr("disabled", true);
			$("#btnCalc0").attr("disabled", true);
			$("#btnCalc1").attr("disabled", true);
			$("#btnPrint").attr("disabled", false);
			$("#querystring").attr("disabled", true);
		}
		var ld_zfy = json.data[0].bcfy;
		var ld_fund_pay = json.data[0].jjzf;
		var ld_cash = json.data[0].xjzf;
		var ld_zh = json.data[0].grzhzf;
		$("#st_bcfy").val((parseFloat(ld_zfy)).toFixed(2));
		$("#st_jjzf").val(parseFloat(ld_fund_pay).toFixed(2));
		$("#st_xjzf").val((parseFloat(ld_cash)).toFixed(2));
		$("#em_grzhzf").val((parseFloat(ld_zh)).toFixed(2));
	}

	function init() {
		$("#querystring").val('');
		/*签名串在页面刷新时进行清空 陈洁 20190801  */
		$("#bkz300").val('');
		$("#serial_apply").val('');
		$("#indi_id").val('');
		$("#idcard").val('');
		$("#name").val('');
		$("#sex").val('');
		$("#birthday").val('');
		$("#bka888").val('');
		$("#dlrimg").attr("src","")
		$("#pers_type").val('');
		$("#pers_name").val('');
		$("#corp_name").val('');
		$("#official_code").val('');
		$("#last_balance").val('');
		
		/* 业务信息 */
        $("#official_name").val('');
		$("#admit_effect").val('');
		$("#admit_date").val('');
		$("#serial_no").val('');
		$("#diagnose").val('');
		$("#in_disease_name").val('');
		$("#diagnose_date").val('<%=DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss")%>');
		$("#diagnose_date_reg").val('');
		$("#special_in_seg").val('');
		$("#audit_limit").val('');
		/* 业务信息 */
		
		$("#corp_id").val('');
		$("#telephone").val('');
		$("#fee_date").val('<%=DateFunc.dateToString(new Date(), "yyyyMMdd")%>');
	

		$("#st_jjzf").val('0.00');
		$("#st_self_com").val('0.00');
		$("#st_self_own").val('0.00');
		$("#st_bcfy").val('0.00');
		$("#em_grzhzf").val('0.00');
		$("#st_last_balance").val('0.00');
		$("#st_xjzf").val('0.00');
		$("#em_jsq").val('0.00');
		$("#st_out").val('0.00');

		$("#his_item_name").val('');
		$("#input_man").val('');
		$("#price").val('');
		$("#dosage").val('');
		$("#money").val('');
		$("#baa027_name").val('');

		$("#btnSave").attr("disabled", false);
		$("#btnCalc0").attr("disabled", false);
		$("#btnCalc1").attr("disabled", true);
		$("#stext").attr("readonly", false);
		$("#argName option:selected").val('idcard');
		$("#argnames").val('idcard');
		$("#querystring").attr("disabled", false);
		$("#querystring").val('');
		gridFeeDetail.reset();
		$("#querystring").focus();
	}

	/*重置界面*/
	function resetpage() {
		init();
	}

	function getPersonInfo(para){
		if (para == "readic" || event.keyCode == '13') {
			var querystring = powersi.trim($("#querystring").val());
			if (powersi.isnull(querystring)) {
				alert("请输入有效查询条件");
				return;
			}
			$("#argnames").val($("#argName").val());
			if('idcard' == $("#argnames").val()){
				$("#argName option:first").prop('selected', 'selected'); 
				$("#argName option:selected").val('idcard');
				$("#argName").change();
				$("#argName").val('idcard');
				$("#argName").change();
			}
			if ("0" == $("#reduceflag").val())
				getPerson();
			else
				afterChoosePerson();
		}
	}
	
	function getPerson(para) {
			var treatment_type = powersi.trim($("#treatment_type").val());
			if (powersi.isnull(treatment_type)) {
				alert("请选择待遇类型再获取人员信息!");
				return;
			}
			var querystring = powersi.trim($("#querystring").val());
			if (powersi.isnull(querystring)) {
				alert("请输入有效查询条件!");
				return;
			}
			var diagnose_date = powersi.trim($("#diagnose_date").val());
			if (!powersi.isnull(diagnose_date)) {
				$("#diagnose_date").val(diagnose_date);
			}
			$("#treatment_type").val(treatment_type);
			$("#treatment_type").change();
			$("#querystring").val(querystring);
			if (para == "readic") {
				$("#argName").val("iccardno");
			} else {
				$("#bke548").val('');
			}
			$("#querystring").attr("disabled", true);
			var indi_id = "0";
			postJSON(
					"${rootPath}/diagnose/GetPersonInfoAction!getPersonInfo_special_remote.action?diagnoseInfoDTO.arg_name="
							+ $("#argName").val()
							+ "&diagnoseInfoDTO.arg_value="
							+ $("#querystring").val()
							+ "&diagnoseInfoDTO.caa027="
							+ $("#caa027").val()
							+ "&diagnoseInfoDTO.biz_type="
							+ $("#biz_type").val(),
					function(json) {
						$("#bke548").val('');	//读卡返回
						if (!checkJSONResult(json)) {
							$("#querystring").attr("disabled", false);
							init();
							return;
						}
						if (json.message == 'multi-row') {
							choosepersonlist(querystring);
							return;
						}
						if (json.errortype == '0') {
							$.each(json.data.personinfo, function(key,
									value) {
								if (!powersi.isnull(value)) 
									$("#" + key).val(value);
								if(key=="bka888"){
									if(value!="正常") {
										$("#bka888").css("color","red");
										popupAlert("您好!此参保人基金冻结状态为【已冻结】,将不能进行基金报销,请知悉!");
									}else{
										$("#bka888").css("color","black");
									}
								}
								if (key="center_id"){
									if(value=="439900"){
										$("#baa027_name").val("湖南省省直");
									}
								}
							});
							$("#diagnose_date_reg").val($("#diagnose_date").val());
							$("#treatment_type_reg").val($("#treatment_type").val());
							$("#diagnose_date").prop("disabled", true);
							$("#treatment_type").prop("disabled", true);
							if ("0" == json.data.personinfo.official_code){
								$("#official_code").val("000");
							}
							if (json.data.spinfo != null){
								var spinfo = json.data.spinfo[0];
								$("#serial_apply").val(spinfo.serial_apply);
								$("#diagnose").val(spinfo.icd);
								$("#in_disease_name").val(spinfo.disease);
								$("#admit_effect").val(spinfo.admit_effect);
								$("#admit_date").val(spinfo.admit_date);
								$("#special_in_seg").val(spinfo.special_in_seg);
								$("#audit_limit").val(spinfo.audit_limit);
							}
						} 
						if (!powersi.isnull(json.message)) {
							popupInfo(json.message);
						}
					});
		}

	function choosepersonlist(querystring) {
		popupDialog(
				{
					url : "${rootPath}/diagnose/GetPersonInfoAction!chooseperson.action?diagnoseInfoDTO.arg_value="
							+ querystring,
					onClosed : function() {
						var ret = this.returnValue;
						if (ret) {
							indi_id = ret.indi_id;
							postJSON(
									"${rootPath}/diagnose/GetPersonInfoAction!getPersonInfo_special_remote.action?diagnoseInfoDTO.arg_name=indi_id&diagnoseInfoDTO.arg_value="
											+ indi_id
											+ "&diagnoseInfoDTO.treatment_type="
											+ $("#treatment_type").val()
											+ "&diagnoseInfoDTO.diagnose_date="
											+ $("#diagnose_date").val()
											+ "&diagnoseInfoDTO.biz_type="
											+ $("#biz_type").val(),
									function(json) {
									if (!checkJSONResult(json)) {
										$("#querystring").attr("disabled", false);
										init();
										return;
									}
										if (json.errortype == '0') {
											$.each(json.data.personinfo, function(key,
																				  value) {
												if (!powersi.isnull(value))
													$("#" + key).val(value);
												if(key=="bka888"){
													if(value!="正常") {
														$("#bka888").css("color","red");
														popupAlert("您好!此参保人基金冻结状态为【已冻结】,将不能进行基金报销,请知悉!");
													}else{
														$("#bka888").css("color","black");
													}
												}
												if (key="center_id"){
													if(value=="439900"){
														$("#baa027_name").val("湖南省省直");
													}
												}
											});
											$("#diagnose_date_reg").val($("#diagnose_date").val());
											$("#treatment_type_reg").val($("#treatment_type").val());
											$("#diagnose_date").prop("disabled", true);
											$("#treatment_type").prop("disabled", true);
											if ("0" == json.data.personinfo.official_code){
												$("#official_code").val("000");
											}
											if (json.data.spinfo != null){
												var spinfo = json.data.spinfo[0];
												$("#serial_apply").val(spinfo.serial_apply);
												$("#diagnose").val(spinfo.icd);
												$("#in_disease_name").val(spinfo.disease);
												$("#admit_effect").val(spinfo.admit_effect);
												$("#admit_date").val(spinfo.admit_date);
												$("#special_in_seg").val(spinfo.special_in_seg);
												$("#audit_limit").val(spinfo.audit_limit);
											}
										}
										if (!powersi.isnull(json.message))
										popupInfo(json.message);
									
								});
						}
					}
				}, 500, 600);
	}
	
	
	function afterChoosePerson() {
		popupDialog(
				{
					url : "${rootPath}/diagnose/GetPersonInfoAction!getPersonBusi_remote.action?diagnoseInfoDTO.arg_name="
						    + $("#argnames").val()
							+ "&diagnoseInfoDTO.arg_value="
							+ $("#querystring").val()
							+ "&diagnoseInfoDTO.biz_type="
							+ $("#biz_type").val()
							+ "&diagnoseInfoDTO.treatment_type="
							+ $("#treatment_type").val(),
					onClosed : function() {
						var ret = this.returnValue;
						if (ret != null) {
							var serial_no = ret.serial_no;
							var fee_batch = ret.fee_batch;
							postJSON(
									"${rootPath}/medicare/GetPersonInfoAction!getPersonBusiDetail_remote.action?serial_no=" + serial_no + "&fee_batch=" + fee_batch,
									function(json) {
										if (!checkJSONResult(json)) 
											return;
										$("#idcard").val(ret.idcard);
										$("#name").val(ret.name);
										$("#corp_name").val(ret.corp_name);
										$("#pers_type").val(ret.pers_type);
										$("#sex").val(ret.sex);
										$("#birthday").val(ret.birthday);

										$("#indi_id").val(ret.indi_id);
										
										$("#treatment_type").val(ret.treatment_type);
										$("#treatment_type_reg").val(ret.treatment_type);
										$("#in_disease_name").val(ret.disease);
										$("#telephone").val(ret.telephone);
										$("#serial_no").val(ret.serial_no);
										$("#serial_apply").val(ret.serial_apply);
										$("#diagnose").val(ret.icd);
                                        $("#in_disease_name").val(ret.disease);
                                        $("#diagnose_date").val(ret.diagnose_date);
										$("#center_id").val(ret.center_id.trim());

										if (ret.center_id.trim() =="439900"){
											$("#baa027_name").val("湖南省省直");
										}

										$("#btnCalc0").attr("disabled", false);
										var operFlag = $(':radio[name="operFlag"]:checked').val();
										if (operFlag == "1") {
											return $("#stext").focus();
										} else {
											//退费，获取就医登记号和费用批次号，装载明细到前台选择
											if (json.data == "no") {
												alert("没有找到就医明细数据，请检查是否还未收费！");
											} else {
												gridFeeDetail
														.loadData(json.data.feeinfo);
											}
										}
									});
						}
					}
				}, 500, 600);
	}

</script>
