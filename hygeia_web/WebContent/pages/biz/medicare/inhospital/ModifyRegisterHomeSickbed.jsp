<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<powersi:html>
<head>
<powersi:head title="住院修改" />
<script type="text/javascript" src="${rootPath}/resource/js/clinicUtils.js"></script>
</head>
<body>
	<powersi:form id="modifyRegisterHomeSickbed" namespace="/inhospital"
		action="InhospitalManagerAction!modifyRegisterHomeSickbed.action">
		<powersi:panelbox key="查询条件">
			<powersi:panelbox-toolbar>
				<powersi:button id="btSaveModifyRegister"  label="保存" onclick="saveModifyRegister()"  				key="button_save_register"/>
				<powersi:button id="btModifyRegisterReset" label="重置"  onclick="modifyRegisterHomeSickbedReset()"  key="button_reset"/>
				<powersi:reset id="btReset" label="重置" cssStyle="display:none;" />
			</powersi:panelbox-toolbar>
			<powersi:editorlayout  cols="10%,10%,15%,8%,12%,8%,12%,10%,15%">
				<powersi:codeselect id="argName" name="inHospitalDTO.argName"
					label="" cssClass="select2" 
					list="#{'akc190':'住院号','aac002':'社会保障号','aaz217':'就医登记号' }" />
				<td>
					<powersi:textfield id="querystring" name="inHospitalDTO.querystring" title="请输入信息回车"
						placeholder="请输入信息回车！" readonly="false" onkeyup="findModifyRegisterAaz217HomeSickbed()"
						buttonDisabled="false" />
				</td>
				<powersi:textfield id="aac002" name="inHospitalDTO.aac002"
					label="社会保障号" readonly="true" />
				<powersi:textfield id="bka008" name="inHospitalDTO.bka008"
					label="单位名称" readonly="true" />
				<powersi:textfield id="aac003" name="inHospitalDTO.aac003"
					label="姓名" readonly="true" />
			</powersi:editorlayout>
		</powersi:panelbox>
		<powersi:panelbox key="住院信息">
			<powersi:editorlayout cols="8">
				<powersi:editorlayout-row>
					<powersi:hidden id="caa027" name="inHospitalDTO.caa027" />
					<powersi:hidden id="aaa027" name="inHospitalDTO.aaa027" />
					<powersi:hidden id="akc193" name="inHospitalDTO.akc193" />
					<powersi:hidden id="bka019_hid" name="inHospitalDTO.bka019_hid" />
					<powersi:hidden id="bka021_hid" name="inHospitalDTO.bka021_hid" />
					<powersi:hidden id="ake020_hid" name="inHospitalDTO.ake020_hid" />
					<powersi:hidden id="ake022_hid" name="inHospitalDTO.ake022_hid" />
					<powersi:hidden id="kcd1id" name="inHospitalDTO.kcd1id" />
					<powersi:hidden id="isInpPsw" value="false"/>
					
					<powersi:textfield id="aac004_name" name="inHospitalDTO.aac004_name" label="性  别" readonly="true" />
					<powersi:textfield id="aac001" name="inHospitalDTO.aac001" label="电脑号" readonly="true" />
					<powersi:textfield id="bka035_name" name="inHospitalDTO.bka035_name" label="人员类别" readonly="true" />
					<powersi:textfield id="aaa027_name" name="inHospitalDTO.aaa027_name" label="医保分中心" readonly="true" />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:textfield id="akb021" name="inHospitalDTO.akb021" label="医院名称" readonly="true" />
					<powersi:textfield id="aka130_name" name="inHospitalDTO.aka130_name" label="业务类型" readonly="true" />
					<powersi:textfield id="aae140_name" name="inHospitalDTO.aae140_name" label="险种类型" readonly="true" />
					<powersi:textfield id="aaz217" name="inHospitalDTO.aaz217" label="就医登记号" readonly="true" />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:textfield id="aae030" name="inHospitalDTO.aae030" label="入院日期"  mask="date" required="true" readonly="false" />
					<powersi:textfield id="bka006_name" name="inHospitalDTO.bka006_name" label="待遇类型" readonly="true" />
					<powersi:textfield id="akc190" name="inHospitalDTO.akc190" label="住院号" required="true" readonly="false" />
					<powersi:textfield id="bkz101" name="inHospitalDTO.bkz101" 
						label="入院诊断" title="请输入入院诊断" onkeydown="keydown(this)" 
						required="true" readonly="true" buttonText="选择" buttonId="akc193_button"
						buttonDisabled="false" onbuttonclick="chooseDisease('bkz101', 'akc193', 'akf001')" />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:codeselect id="akf001" name="inHospitalDTO.akf001"
						label="入院科室" cssClass="select2" list="#request.akf001List"
						headerKey="" headerValue="请选择..." required="true"
						onchange="selectBka021()" showValue="false" />
					<powersi:codeselect id="bka021" name="inHospitalDTO.bka021"
						label="入院病区" cssClass="select2" list="#request.bka021List"
						headerKey="" headerValue="请选择..." required="true"
						onchange="selectAke020()" />
					<powersi:codeselect id="ake020" name="inHospitalDTO.ake020"
						label="床位号" cssClass="select2" list="#request.ake022List"
						headerKey="" headerValue="请选择..." required="true"
						onchange="selectAke022()" />
					<powersi:codeselect id="ake022" name="inHospitalDTO.ake022"
						label="主治医生" cssClass="select2" list="#request.ake022List"
						headerKey="" headerValue="请选择..." />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:codeselect id="bka061" name="inHospitalDTO.bka061"
						label="病情严重程度" cssClass="select2" codeType="bka061"
						headerKey="" headerValue="请选择..." showValue="false"  />
					<powersi:textfield id="aae011" name="inHospitalDTO.aae011"
						label="登记人工号" readonly="true" />
					<powersi:textfield id="bka015" name="inHospitalDTO.bka015"
						label="登记人" readonly="true" />
					<powersi:textfield id="aae006" name="inHospitalDTO.aae006"
						label="联系地址" readonly="false" />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row>
					<powersi:textfield id="ake024" name="inHospitalDTO.ake024"
						label="病情备注" colspan="3" readonly="false" />
				</powersi:editorlayout-row>
			</powersi:editorlayout>
		</powersi:panelbox>
		<powersi:panelbox key="其它诊断信息">		
			<powersi:panelbox-toolbar>
				<powersi:button id="btn_selDiagnoseinfo" label="其它诊断" onclick="chooseGridDiagnoseinfo()" />
				<powersi:button id="btn_deleteDiagnoseinfo" label="删除" key="button_delete" onclick="doDelete()" />
			</powersi:panelbox-toolbar>
			<powersi:datagrid id="gridDiagnoseinfo"  delayLoad="true" showReload="false" autoWidth="true" enabledSort="false"
				alternatingRow="true" checkbox="true" colDraggable="false" height="200" pageSize="100" rownumbers="true" > 
           		<powersi:datagrid-column display="编码" name="aka120" width="30%"  />
           		<powersi:datagrid-column display="名称" name="aka121" width="30%" />
           		<powersi:datagrid-column display="类型" name="bke559" width="0%" hide="true"  />
           	 	<powersi:datagrid-column display="序号" name="bke558" width="0%" hide="true"  />
       		</powersi:datagrid>
      			<powersi:hidden id="diagnoseinfo" name="diagnoseinfo" />
		</powersi:panelbox>
		<powersi:hidden id="bke548" name="inHospitalDTO.bke548" />
		<powersi:hidden id="bka006" name="inHospitalDTO.bka006" />
		<powersi:hidden id="bke548" name="inHospitalDTO.bke548" />
		<powersi:hidden id="baa027" name="inHospitalDTO.baa027" />
		<!-- 有效时间隐藏域 -->
	 	<powersi:hidden id="aae030" name="inHospitalDTO.aae030"/>
	 	<powersi:hidden id="aae031" name="inHospitalDTO.aae031"/>
	</powersi:form>
	
	<powersi:panelbox cssStyle="display:none;">
		<powersi:form id="gridKcd1Logform" namespace="/inhospital"
			action="InhospitalManagerAction!selectKcd1Log.action">
			<powersi:hidden id="aaz217_hid" name="inHospitalDTO.aaz217"  />
		</powersi:form>
	</powersi:panelbox>
	<powersi:panelbox key="历史修改记录">
		<powersi:datagrid id="gridKcd1Log" formId="gridKcd1Logform" delayLoad="true"
			showReload="false"  autoWidth="true" enabledSort="false"
			alternatingRow="true"  colDraggable="false" height="200" pageSize="30" > 
            <powersi:datagrid-column display="修改人" name="bka015" width="10%"  />
            <powersi:datagrid-column display="修改时间" name="aae036" width="10%"  />
            <powersi:datagrid-column display="修改前入院日期" name="aae030" width="15%" format="{0,date,yyyy-MM-dd}" />
            <powersi:datagrid-column display="修改前入院诊断" name="bkz101" width="10%"  />
 			<powersi:datagrid-column display="修改前住院号" name="akc190" width="10%"  />
 			<powersi:datagrid-column display="修改前科室" name="bka020" width="10%"  />
 			<powersi:datagrid-column display="修改前病区" name="bka022" width="10%"  />
 			<powersi:datagrid-column display="修改前床位号" name="ake020" width="10%"  />
		</powersi:datagrid>
	</powersi:panelbox>		
	<powersi:errors />
	<script type="text/javascript">
		var firstLoad = true;
		$(document).ready(function() {
			$("#querystring").focus();
		});

		function readIcCard() {
			findModifyRegisterAaz217HomeSickbedByBka100();
		}
		
		function findModifyRegisterAaz217HomeSickbedByBka100() {
			var modifyRegisterData = $("#modifyRegisterHomeSickbed").serialize();
			postJSON(
					"${rootPath}/inhospital/InhospitalManagerAction!findModifyRegisterAaz217HomeSickbed.action",
					modifyRegisterData, function(json) {
						if (!checkJSONResultNew(json)) {
							return;
						}
						$.each(json.data, function(key, value) {
							if (!powersi.isnull(value)) {
								$("#" + key).val(value);
							}
						});
						$("#akf001").change();
					});
		}

		function saveModifyRegister() {
			if (!checkForm()) {
				return;
			}
			var kcd1id = powersi.trim($("#kcd1id").val());
			if (powersi.isnull(kcd1id)) {
				return;
			}
			var aaz217 = powersi.trim($("#aaz217").val());
			if (powersi.isnull(aaz217)) {
				return;
			}
			var aac003 = $("#aac003").val();
			popupConfirm("您确认保存[" + aac003 + "]的家庭病床住院登记信息吗?", "确认", function(isOk){
				if(isOk){
					initDiagnoseinfo();
					$("#btSaveModifyRegister").prop("disabled", true);
					var modifyRegisterHomeSickbedData = $("#modifyRegisterHomeSickbed").serialize();
					postJSON(
							"${rootPath}/inhospital/InhospitalManagerAction!modifyRegisterHomeSickbed.action",
							modifyRegisterHomeSickbedData, function(json) {
								$("#btSaveModifyRegister").prop("disabled", false);
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
								submitGridKcd1Logform();
							});
						}
					});
			}

		function modifyRegisterHomeSickbedReset() {
			$("#querystring").val("");
			$("#argName").val("akc190");
			$("#argName").change();
			$("#btReset").click();
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
			firstLoad = true;
			gridDiagnoseinfo.reset();
			gridKcd1Log.reset();
		}

		function findModifyRegisterAaz217HomeSickbed() {
			if (window.event.keyCode == 13) {
				$("#bke548").val("");
				var querystring = powersi.trim($("#querystring").val());
				var argName = $("#argName").val();
				modifyRegisterHomeSickbedReset();
				$("#querystring").val(querystring);
				$("#argName").val(argName);
				$("#argName").change();
				if (powersi.isnull(querystring)) {
					return;
				}
				postJSON(
						"${rootPath}/inhospital/InhospitalManagerAction!findModifyRegisterAaz217HomeSickbed.action"
								+ "?inHospitalDTO.argName=" + $("#argName").val()
								+ "&inHospitalDTO.querystring=" + querystring,
								 function(json) {
									if (!checkJSONResultNew(json)) {
										return;
									}
									$.each(json.data, function(key, value) {
										if (!powersi.isnull(value)) {
											$("#" + key).val(value);
										}
									});
									$("#akf001").change();
									$("#bka061").change();
									loadDiagnoseInfo();
		 							submitGridKcd1Logform();
								});
			}
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
			var ake022 = $("#ake022").val();
			if (powersi.isnull(ake022)) {
				return;
			}
			//入院床位号
			var ake020 = $("#ake020").val();
			$("#ake022").empty();
			$("#ake022").append("<option value='' >" + "请选择..." + "</option>");
			$("#ake022").change();
			
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
						var ake022_hid = $("#ake022_hid").val();
						if (!powersi.isnull(ake022_hid)) {
							$("#ake022").val(ake022_hid);
							$("#ake022").change();
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
			$("#ake022").empty();
			//医保医师
			$("#ake022").empty();
			$("#ake022").append("<option value='' >" + "请选择..." + "</option>");
			$("#ake022").append("<option value='' >" + "请选择..." + "</option>");
			$("#ake022").change();
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
						var ake020_hid = $("#ake020_hid").val();
						var bka021_hid = $("#bka021_hid").val();
						if (!powersi.isnull(ake020_hid)) {
							if(bka021==bka021_hid) {
								var a = [];
								a.push('<option value="');
								a.push(ake020_hid);
								a.push('"');
								a.push(">");
								a.push(ake020_hid);
								a.push("</option>");
								$("#ake020").append(a.join(''));
							}
							$("#ake020").val(ake020_hid);
							$("#ake020").change();
						}
					});
		}

		/*加载病区*/
		function selectBka021() {
			//入院科室
			var akf001 = $("#akf001").val();
			//入院病区
			$("#bka021").empty();
			//入院床位号
			$("#ake022").empty();
			//医保医师
			$("#ake022").empty();
			$("#bka021").append("<option value='' >" + "请选择..." + "</option>");
			$("#ake022").append("<option value='' >" + "请选择..." + "</option>");
			$("#ake022").append("<option value='' >" + "请选择..." + "</option>");
			$("#bka021").change();
			$("#ake022").change();
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
						var bka021_hid = $("#bka021_hid").val();
						if (!powersi.isnull(bka021_hid)) {
							$("#bka021").val(bka021_hid);
							$("#bka021").change();
						}
					});
		}
		
		function initDiagnoseinfo() {
			var diagnoseinfo = gridDiagnoseinfo.getData();
			diagnoseinfo = powersi.tostring(diagnoseinfo);
			$("#diagnoseinfo").val(encodeURI(diagnoseinfo));
		}

		function submitGridKcd1Logform(){
			$("#aaz217_hid").val(powersi.trim($("#aaz217").val()));
			var aaz217_hid = powersi.trim($("#aaz217_hid").val());
			if (powersi.isnull(aaz217_hid)) {
				return;
			}
			$("#gridKcd1Logform").submit();
		}
		
		var num_diagnose_sn = 1;
		function chooseGridDiagnoseinfo() {
			var bka006 = $("#bka006").val();

			var url = "";
			var baa027 = $("#baa027").val();
			var centerId = "0";
			if (baa027 != ''&& baa027 != undefined) {
				centerId = baa027.substr(0, 4);
			}

			//106种单病种，查询当前大病种下的小病种作为副诊断信息
			//106种单病种，不需要申请 【20180227 新增需求】
			var aaz266 = $("#aaz266").val();
			var is106 = ("1"==aaz266?true:false);
			
			if(is106){
				var aka120 = $("#bka026").val();
				url = "${rootPath}/common/CommonManagerAction!chooseDisease.action?ka06dto.caa027="
						+ $("#caa027").val()
						+ "&aka120=" + aka120;
			}else{
				url = "${rootPath}/common/CommonManagerAction!chooseDisease.action?ka06dto.caa027="
					+ $("#caa027").val();
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
		
		function loadDiagnoseInfo() {
		 	var aaz217=$("#aaz217").val();
			if (powersi.isnull(aaz217)) {
				popupAlert("请先查询出信息!", "提示", "info");
				return;
			}
			postJSON(
					"${rootPath}/inhospital/InhospitalManagerAction!loadDiagnoseInfos.action",
					{
						"aaz217" : aaz217
					}, function(json) {
						if (!checkJSONResultNew(json)) {
							return;
						}
						if (json.data != "no" && json.data != null && json.data != "null") {
							 for(var i=0;i<json.data.length;i++){
								 if(num_diagnose_sn<=parseInt(json.data[i].bke558)){
									  num_diagnose_sn=parseInt(json.data[i].bke558)+1;
								}
							 }
							gridDiagnoseinfo.loadData(json.data);   
						}
						if (!powersi.isnull(json.message)) {
							popupAlert(json.message);
						}
					});
		}
	</script>
</body>
</powersi:html>