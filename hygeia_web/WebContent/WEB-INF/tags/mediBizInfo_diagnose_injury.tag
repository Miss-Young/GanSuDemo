<%@ tag pageEncoding="GBK" body-content="empty" small-icon=""
	display-name="医疗业务信息" description="医疗业务信息"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%
	String bka006Filter = " data_value like '41%' ";
%>
<script type="text/javascript">
	$(document).ready(
			function() {
				var month = curDate.getMonth() + 1 < 10 ? "0" + (curDate.getMonth() + 1)
						: curDate.getMonth() + 1 ;
				var day = curDate.getDate() < 10 ? "0" + (curDate.getDate()) : curDate
						.getDate();
				var hours = curDate.getHours() < 10 ? "0" + (curDate.getHours())
						: curDate.getHours();
				var min = curDate.getMinutes() < 10 ? "0" + (curDate.getMinutes())
						: curDate.getMinutes();
				var seconds = curDate.getSeconds() < 10 ? "0" + (curDate.getSeconds())
						: curDate.getSeconds();
				var curDateStr = curDate.getFullYear() +"-"+ month +"-"+ day +" "+ hours +":" + min +":" + seconds;
				$("#bka017").val(curDateStr);
				$("#bka051").val(curDateStr);
			});

	function setFeeTime() {
		var bka017 = $("#bka017").val();
		var curDate = bka017;
		$("#bka051").val(bka017);
		var start = new Date(bka017.substr(0, 4) + "-" + bka017.substr(4, 2)
				+ "-" + bka017.substr(6, 2));
		var now = new Date();
		if (start > now) {
			alert('门诊日期不能大于当天！');
			$("#bka017").focus();
			return;
		}
	}

	function chooseDis(str) {
		popupDialog(
				{
					url : "${rootPath}/common/CommonManagerAction!chooseDisease.action",
					onClosed : function() {
						var ret = this.returnValue;
						if (ret != null) {
							$("#bka026_name").val(ret.aka121);
							$("#bka026").val(ret.aka120);
							return $("#stext").focus();
						}
					}
				}, 500, 600);
	}
	
	/*多疾病录入*/
	function choosebka018(){
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

	/*加载病区*/
	function selectbka021() {
		//入院科室
		var bka019 = $("#bka019").val();
		//入院病区
		$("#bka021").empty();
		//入院床位号
		$("#bka023").empty();
		//医保医师
		$("#bka503").empty();
		$("#bka021").append("<option value='' >" + "请选择..." + "</option>");
		$("#bka023").append("<option value='' >" + "请选择..." + "</option>");
		$("#bka503").append("<option value='' >" + "请选择..." + "</option>");
		$("#bka021").change();
		$("#bka023").change();
		$("#bka503").change();
		if (powersi.isnull(bka019)) {
			return;
		}
		postJSON(
				"${rootPath}/inhospital/InhospitalManagerAction!loadBka021List.action",
				{
					"inHospitalDTO.bka019" : bka019
				}, function(json) {
					if (!checkJSONResult(json)) {
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
						alert(json.message);
					}
				});
	}

	/*加载医保医师*/
	function selectbka503() {
		//入院科室
		var bka019 = $("#bka019").val();
		if (powersi.isnull(bka019)) {
			return;
		}
		//入院病区
		var bka021 = $("#bka021").val();
		if (powersi.isnull(bka021)) {
			return;
		}
		$("#bka503").empty();
		$("#bka503").append("<option value='' >" + "请选择..." + "</option>");
		$("#bka503").change();
		postJSON(
				"${rootPath}/inhospital/InhospitalManagerAction!loadBka503List.action",
				{
					"inHospitalDTO.bka019" : bka019
				}, function(json) {
					if (!checkJSONResult(json)) {
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
						$("#bka503").append(a.join(''));
					}
					if (!powersi.isnull(json.message)) {
						alert(json.message);
					}
				});
	}

	function keyDown(para) {
		if (event.keyCode == '13') {
			var filed_name = para.id;
			if ('bka017' == filed_name) {
				return $("#bka025").focus();
			}
			if ('bka025' == filed_name) {
				return $("#bka043").focus();
			}
			if ('bka043' == filed_name) {
				return $("#bka026_name").focus();
			}
			if ('bka026_name' == filed_name) {
				return chooseDis('bka026');
			}
			if('bka018' == filed_name){
				return choosebka018();
			}
		}
	}
</script>
<powersi:panelbox title="业务信息">
	<powersi:editorlayout cols="8">
		<tr>
			<powersi:codeselect id="bka004_name" key="人员类别"
				name="diagnoseInfoDTO.bka004" codeType="bka004" disabled="true" />
			<powersi:hidden id="bka004" name="diagnoseInfoDTO.bka004" />
			<powersi:codeselect id="baa027_name" key="人员所属统筹区"
				name="diagnoseInfoDTO.baa027" codeType="aaa027" disabled="true" />
			<powersi:hidden id="baa027" name="diagnoseInfoDTO.baa027" />
			<powersi:textfield id="bka008" key="单位名称"
				name="diagnoseInfoDTO.bka008" readonly="true" />
			<powersi:textfield id="bka017" name="diagnoseInfoDTO.bka017"
				mask="datetime" key="门诊日期" onKeyDown="keyDown(this)"
				onchange="setFeeTime()" required="true" />
			<powersi:hidden id="bka017_reg" name="diagnoseInfoDTO.bka017" />
			<powersi:hidden id="aac006" key="出生日期" name="diagnoseInfoDTO.aac006" />
			<powersi:hidden id="bka005" key="公务员级别" name="diagnoseInfoDTO.bka005" />
			<powersi:hidden id="aac004" key="性别" name="diagnoseInfoDTO.aac004" />
			<powersi:hidden id="aaz267" key="选点序列号" name="diagnoseInfoDTO.aaz267" />
			<powersi:hidden id="aka130" name="diagnoseInfoDTO.aka130"
				key="aka130" value="41" />
			<powersi:hidden id="aae140" key="险种" name="diagnoseInfoDTO.aae140"
				value="410" />
			<powersi:hidden id="bka001" key="费用批次" name="diagnoseInfoDTO.bka001" />
			<powersi:hidden id="aab001" key="单位电脑号" name="diagnoseInfoDTO.aab001" />
			<powersi:hidden id="aab019" name="diagnoseInfoDTO.aab019" />
			<powersi:hidden id="bka039" key="完成情况" name="diagnoseInfoDTO.bka039" />
			<powersi:hidden id="bka026" name="diagnoseInfoDTO.bka026" />
			<powersi:hidden id="bka022" key="病区名称" name="diagnoseInfoDTO.bka022" />
			<powersi:hidden id="bka020" key="科室名称" name="diagnoseInfoDTO.bka020" />
			<powersi:hidden id="bka042" key="工伤生育号" name="diagnoseInfoDTO.bka042"
				value="0" />
			<powersi:hidden id="blz516" key="医疗期ID" name="diagnoseInfoDTO.blz516" />
			<powersi:hidden id="aae030" key="开始时间" name="diagnoseInfoDTO.aae030" />
			<powersi:hidden id="aae031" key="结束时间" name="diagnoseInfoDTO.aae031" />
		</tr>
		<tr>
			<powersi:textfield id="bka025" key="挂号" name="diagnoseInfoDTO.bka025"
				readonly="false" onKeyDown="keyDown(this)" required="true" />
			<powersi:textfield id="bka043" key="处方号"
				name="diagnoseInfoDTO.bka043" readonly="false"
				onKeyDown="keyDown(this)" />
			<powersi:textfield id="aaz217" key="就医登记号"
				name="diagnoseInfoDTO.aaz217" readonly="true" />
			<powersi:textfield id="bka026_name" key="疾病诊断" readonly="true"
				name="bka026_name" buttonText="..." buttonId="disinse"
				onKeyDown="keyDown(this)" onbuttonclick="chooseDis('bka026')"
				required="true" />
		</tr>
		<tr>
			<powersi:codeselect id="bka006" key="待遇类型"
				name="diagnoseInfoDTO.bka006" codeType="bka006"
				codeFilter="<%=bka006Filter%>" codeSort="1" required="true" />
			<powersi:codeselect id="bka019" name="diagnoseInfoDTO.bka019"
				label="科室" cssClass="select2" list="#request.bka019List"
				headerKey="" headerValue="请选择..." required="true"
				onchange="selectbka021()" showValue="true" />
			<powersi:codeselect id="bka021" name="diagnoseInfoDTO.bka021"
				label="病区" cssClass="select2" list="#request.bka021List"
				headerKey="" headerValue="请选择..." required="true"
				onchange="selectbka503()" showValue="false" />
			<powersi:codeselect id="bka503" name="diagnoseInfoDTO.bka503"
				label="医保医师" cssClass="select2" list="#request.bka503List"
				headerKey="" headerValue="请选择..." showValue="false" />
		</tr>
		<tr>
		    <powersi:textfield id="bka018"  key="多诊断" readonly="true" 
		        name="diagnoseInfoDTO.bka018" buttonText="..." buttonId="bka018_button"
		        onkeydown="keyDown(this)"  onbuttonclick="choosebka018()" 
		        required="false"  colspan="8" />	
		</tr>
	</powersi:editorlayout>
</powersi:panelbox>