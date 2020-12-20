<%@ tag pageEncoding="GBK" body-content="empty" small-icon=""
	display-name="�ϴ�ԤԼ�Һź�Դ" description="�ϴ�ԤԼ�Һź�Դ"%>
<%@ taglib prefix="s" uri="http://www.powersi.com.cn/tags"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>

<powersi:panelbox key="ԤԼ�Һź�Դ">
	<powersi:panelbox-toolbar>
		<powersi:button id="btn_enter" key="button_ok" onclick="insertDoctorSourceInfo()" />
		<powersi:button id="btn_delete" key="button_delete" onclick="deleteDoctorSourceInfo()" />
		<powersi:button id="btSaveDoctorSourceInfo" label="�ϴ���Ϣ" onclick="saveDoctorSourceInfo()" />
		<powersi:button id="btSelect" label="��ѯ�ѱ���" onclick="selectDoctorSource()" />
	</powersi:panelbox-toolbar>
	<powersi:editorlayout>
		<powersi:editorlayout-row>
			<powersi:codeselect id="aaz307" name="inHospitalDTO.aaz307"
						label="ҽԺ����" cssClass="select2" list="#request.bka019List"
						headerKey="" headerValue="��ѡ��..." required="true"
						onchange="selectbka503()" showValue="true" />
			<powersi:codeselect id="bka503" name="inHospitalDTO.bka503"
						label="ҽԺҽʦ" cssClass="select2" list="#request.bka503List"
						headerKey="" headerValue="��ѡ��..." onchange="setZcAndZy()" required="true"/>
			<powersi:textfield id="d_acd231" name="d_acd231"  key="acd231"  label="ְ��" readonly="true"/>
		</powersi:editorlayout-row>
		<powersi:editorlayout-row>
			<powersi:textfield id="d_aae030" name="d_aae030"  key="aae030"  required="true" label="��������" mask="date" format="dateFmt:'yyyy-MM-dd'" />
			<powersi:textfield id="d_bae031" name="d_bae031"  key="bae031"  required="true"  label="������"/>
			<powersi:textfield id="d_bae032" name="d_bae032"  key="bae032"  required="true"  label="����ʱ���"/>
		</powersi:editorlayout-row>
		<powersi:editorlayout-row>
			<powersi:textfield id="d_bae587" name="d_bae587"  key="bae587"  required="true"  label="�ܺ�Դ"/>
			<powersi:textfield id="d_bae588" name="d_bae588"  key="bae588"  required="true"  label="ʣ���Դ"/>
			<powersi:textfield id="d_bae589" name="d_bae589"  key="bae589"  label="����ص�"/>
		</powersi:editorlayout-row>
		<powersi:editorlayout-row>
			<powersi:textfield id="d_akc225" name="d_akc225"  key="akc225"  label="�Һŷѱ�׼"/>
		</powersi:editorlayout-row>
		<powersi:editorlayout-row>
			<powersi:textarea id="d_bac045" name="d_bac045" key="bac045" label="רҵ" readonly="true"></powersi:textarea>
			<powersi:textarea id="d_abk027" name="d_abk027" key="abk027" label="���˼��" disabled="true"></powersi:textarea>
			<powersi:textarea id="d_aae013" name="d_aae013" key="aae013" label="˵��"></powersi:textarea>
		</powersi:editorlayout-row>
	</powersi:editorlayout>
	
	<powersi:datagrid id="d_grid"  exportFileName="'ҽԺԤԼ�Һź�Դ��ѯ'"  height="100%"  useCount="false"  checkbox="true"
       		showExportExcel="true" showExportExcel2007="true"  showExportPdf="true"  enabledSort="true" delayLoad="true"  pageSize="20">
		<powersi:datagrid-column name="aaz307" display="���ұ��" width="10%" />
		<powersi:datagrid-column name="aaz386" display="��������" width="15%" />
		<powersi:datagrid-column name="bka503" display="ҽ�����" width="10%" />
		<powersi:datagrid-column name="aac003" display="ҽ������" width="10%" />
		<powersi:datagrid-column name="acd231" display="ְ��" width="10%" code="bkc272"/>
		<powersi:datagrid-column name="bac045" display="רҵ" width="10%" hide="true"/>
		<powersi:datagrid-column name="abk027" display="���˼��" width="10%" hide="true"/>
		<powersi:datagrid-column name="aae030" display="��������" width="8%" format="dateFmt:'yyyy-MM-dd'"/>
		<powersi:datagrid-column name="bae031" display="������" width="8%" />
		<powersi:datagrid-column name="bae032" display="����ʱ���" width="15%" />
		<powersi:datagrid-column name="bae587" display="�ܺ�Դ��" width="6%" />
		<powersi:datagrid-column name="bae588" display="ʣ���Դ" width="6%" />
		<powersi:datagrid-column name="bae589" display="����ص�" width="20%" />
		<powersi:datagrid-column name="akc225" display="�Һŷѱ�׼" width="6%" />
		<powersi:datagrid-column name="aae013" display="˵��" width="20%"/>
	</powersi:datagrid>
</powersi:panelbox>

<powersi:form id="inputDoctorSourceInfo" namespace="/inhospital" action="AppointmentManagerAction!saveDoctorSourceInfos.action">
	<powersi:hidden id="doctorsourceinfo" name="doctorsourceinfo" />
</powersi:form>

<script type="text/javascript">
/*����ҽ��ҽʦ*/
function selectbka503() {
	//��Ժ����
	var aaz307 = $("#aaz307").val();
	if (powersi.isnull(aaz307)) {
		return;
	}
	
	$("#bka503").empty();
	$("#bka503").append("<option value='' >" + "��ѡ��..." + "</option>");
	//$("#bka503").change();
	
	postJSON(
			"${rootPath}/inhospital/AppointmentManagerAction!loadBka503List.action",
			{
				"doctorSourceInfoDTO.aaz307" : aaz307
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

function setZcAndZy(){
	var bka503Obj = document.getElementById("bka503"); 
	var index =bka503Obj.selectedIndex;
	var bka503Value = bka503Obj.options[index].value;
	var bka503Arry = bka503Value.split("|");
	var bkc269 = bka503Arry[1];  
	if (powersi.isnull(bkc269)) {
		return;
	}
	postJSON(
			"${rootPath}/inhospital/AppointmentManagerAction!loadDoctorZcAndZyList.action",
			{
				"bkc269" : bkc269
			}, function(json) {
				if (!checkJSONResult(json)) {
					return;
				}
				if (json.data != "no") {
					$.each(json.data, function(key, value) {
						$("#d_acd231").val("");
						$("#d_bac045").val("");
						$("#d_abk027").val("");
						var valueArry = value.split("|");
						var bkc281 = valueArry[0];
						var bkc291 = valueArry[1];
						
						$("#d_acd231").val(key);
						$("#d_bac045").val(bkc281);
						$("#d_abk027").val(bkc291);
					});
				}
				if (!powersi.isnull(json.message)) {
					alert(json.message);
				}
			});
}



	function insertDoctorSourceInfo() {
		var aaz307Obj = document.getElementById("aaz307"); 
		var index =aaz307Obj.selectedIndex;
		var aaz307Text = aaz307Obj.options[index].text;
		var aaz307Value = aaz307Obj.options[index].value;
		
		var bka503Obj = document.getElementById("bka503"); 
		var index =bka503Obj.selectedIndex;
		var bka503Text = bka503Obj.options[index].text;
		var bka503Value = bka503Obj.options[index].value;
		
		if (powersi.isnull($("#aaz307").val())) {
			alert("δ¼����ұ��");
			return;
		}
		if (powersi.isnull($("#bka503").val())) {
			alert("δ¼��ԤԼҽ�����");
			return;
		}
		if (powersi.isnull($("#d_acd231").val())) {
			alert("δ¼��ҽ��ְ��");
			return;
		}
		if (powersi.isnull($("#d_bac045").val())) {
			alert("δ¼��ҽ��רҵ");
			return;
		}
		if (powersi.isnull($("#d_aae030").val())) {
			alert("δ¼���������");
			return;
		}
		if (powersi.isnull($("#d_bae031").val())) {
			alert("δ¼�������");
			return;
		}
		if (powersi.isnull($("#d_bae032").val())) {
			alert("δ¼�����ʱ���");
			return;
		}
		if (powersi.isnull($("#d_bae587").val())) {
			alert("δ¼���ܺ�Դ");
			return;
		}
		if (powersi.isnull($("#d_bae588").val())) {
			alert("δ¼��ʣ���Դ");
			return;
		}
		if (parseFloat($("#d_bae587").val()) == 0) {
			alert("�ܺ�Դ���ܵ���0");
		}
		if (isNaN($("#d_bae587").val()) * 1) {
			alert("�ܺ�Դ��������");
			$("#d_bae587").focus();
			return;
		}
		if (parseFloat($("#d_bae588").val()) == 0) {
			alert("ʣ���Դ���ܵ���0");
		}
		if (isNaN($("#d_bae588").val()) * 1) {
			alert("ʣ���Դ��������");
			$("#d_bae588").focus();
			return;
		}
		
		
		
		var aaz307 = aaz307Value;      
		var aaz386 = aaz307Text;  
		
		var bka503Arry = bka503Value.split("|");
		var bka503 = bka503Arry[0];  
		var aac003 = bka503Text;  
		var acd231 = $("#d_acd231").val();  
		var bac045 = $("#d_bac045").val();  
		var abk027 = $("#d_abk027").val();  
		var aae030 = $("#d_aae030").val();  
		var bae031 = $("#d_bae031").val();  
		var bae032 = $("#d_bae032").val();  
		var bae587 = $("#d_bae587").val();  
		var bae588 = $("#d_bae588").val();  
		var bae589 = $("#d_bae589").val();  
		var akc225 = $("#d_akc225").val();  
		var aae013 = $("#d_aae013").val();  
		
		var jsonDoctorSourceInfo = {
				"aaz307" : aaz307, 
				"aaz386" : aaz386, 
				"bka503" : bka503, 
				"aac003" : aac003, 
				"acd231" : acd231, 
				"bac045" : bac045, 
				"abk027" : abk027, 
				"aae030" : aae030, 
				"bae031" : bae031, 
				"bae032" : bae032, 
				"bae587" : bae587, 
				"bae588" : bae588, 
				"bae589" : bae589, 
				"akc225" : akc225, 
				"aae013" : aae013
		};
		d_grid.add(jsonDoctorSourceInfo);
		$("#d_aaz307").focus();
		//$("#d_aaz307").val("");     
		//$("#d_aaz386").val(""); 
		//$("#d_bka503").val(""); 
		//$("#d_aac003").val(""); 
		//$("#d_acd231").val(""); 
		//$("#d_bac045").val(""); 
		//$("#d_abk027").val(""); 
		$("#d_aae030").val(""); 
		$("#d_bae031").val(""); 
		$("#d_bae032").val(""); 
		$("#d_bae587").val(""); 
		$("#d_bae588").val(""); 
		$("#d_bae589").val(""); 
		$("#d_akc225").val(""); 
		$("#d_aae013").val("");

	}
	
	function deleteDoctorSourceInfo() {
		if (typeof (d_grid.getSelectedRows()) == "undefined"
				|| d_grid.getSelectedRows() == null
				|| d_grid.getSelectedRows() == "") {
			alert("��ѡ��Ҫɾ������Ϣ");
			return;
		}
		if (confirm("�Ƿ�ɾ����ѡ�����Ϣ?") == true) {
			d_grid.deleteSelectedRow();
			$("#btSaveDoctorSourceInfo").removeAttr("disabled");
		}
	}
	
	/*�ϴ���Ϣ*/
	function saveDoctorSourceInfo() {
		if (d_grid.getRowsCount() <= 0) {
			alert("����¼����Ϣ");
			return;
		}
		$("#btSaveDoctorSourceInfo").attr("disabled", "disabled");
		var doctorsourceinfo = d_grid.getData();
		doctorsourceinfo = powersi.tostring(doctorsourceinfo);
		$("#doctorsourceinfo").val(encodeURI(doctorsourceinfo));
		var saveItemData = $("#inputDoctorSourceInfo").serialize();
	  	if (!confirm("��ȷ���ύ����ԤԼ�Һź�Դ��?")) {
			return;
		}
		postJSON(
				"${rootPath}/inhospital/AppointmentManagerAction!saveDoctorSourceInfos.action",
				saveItemData, importSaveInfo);
	}
	
	function importSaveInfo(json) {
		if (!checkJSONResult(json)) {
			$("#btSaveDoctorSourceInfo").removeAttr("disabled");
			return;
		}
		if (!powersi.isnull(json.message)) {
			alert(json.message);
		}
	}
	
	/*��ѯ�ѱ����ԤԼ�Һź�Դ*/
	function selectDoctorSource() {
		postJSON("${rootPath}/inhospital/AppointmentManagerAction!queryDoctorSourceInfos.action", 
				function(json){
					if(!checkJSONResult(json)){
					    return;
				    }
		    	//���ؽ������datagrid
				d_grid.loadData(json.data);
				$("#btSaveDoctorSourceInfo").attr("disabled", "disabled");
		});
	}
</script>
