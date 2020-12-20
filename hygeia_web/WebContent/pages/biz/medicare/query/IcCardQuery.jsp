<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String type = (String)request.getParameter("type");
%>

<!DOCTYPE HTML>
<html>
<powersi:head title="�籣������" />
<script src="${rootPath}/resource/js/md5.js" type="text/javascript"></script>
  <body>
  	<powersi:form id="mainForm" name="mainForm" action="cardActivateAction!queryPersonCardInfo.action" namespace="/common" method="post" >
    	<powersi:panelbox key="panel_query" allowCollapse="false">
        	<powersi:editorlayout cols="8">
				<powersi:codeselect id="argName" label="��ѯ����" cssClass="select2" list="#{'aac002':'��ᱣ�Ϻ�'}" />
					<td colspan="2"><powersi:textfield id="querystring" readonly="true"
							name="querystring" title="��������Ϣ�س�" placeholder=""
							onkeydown="" buttonText="����" 
							buttonId="readic_button" buttonDisabled="false"/></td>			
       		</powersi:editorlayout>
    	</powersi:panelbox>
		
		<powersi:panelbox title="�籣����Ϣ" allowCollapse="false">
								<powersi:panelbox-toolbar>
									<powersi:button id="save" key="button_save" value="����" onclick="saveinfo()" buttonIcon="icon-check"/>
					     		</powersi:panelbox-toolbar>
     	  <powersi:datagrid id="cardinfo"  height="200" delayLoad="true">
					<powersi:datagrid-column name="issuer_code"        id="issuer_code"  	  label="����������������"       width="150"/>
					<powersi:datagrid-column name="sscard_no"   	   id="sscard_no"   	  label="��ᱣ�Ϻ�"            width="180"/>
					<powersi:datagrid-column name="card_no"            id="card_no"   		  label="����"                  width="100"/>
					<powersi:datagrid-column name="identifier_code"    id="identifier_code"   label="��ʶ����"               width="280"/>
					<powersi:datagrid-column name="name" 	           id="name"   			  label="����"                  width="100"/>
					<powersi:datagrid-column name="card_reset_info"    id="card_reset_info"   label="����λ��Ϣ"             width="100"/>
					<powersi:datagrid-column name="spec_version" 	   id="spec_version"      label="�淶�汾"      			width="50"/>
					<powersi:datagrid-column name="issue_date" 	       id="issue_date"        label="��������"    			width="200"/>
					<powersi:datagrid-column name="card_validity" 	   id="card_validity"     label="����Ч��"      			width="100"/>
					<powersi:datagrid-column name="terminal_no" 	   id="terminal_no"       label="�ն˻����"      		width="100"/>
					<powersi:datagrid-column name="equipment_no" 	   id="equipment_no"      label="�ն��豸��"      		width="200"/>
			</powersi:datagrid> 
     	</powersi:panelbox>
		
		<powersi:panelbox title="ҽ��ϵͳ��Ա��Ϣ" allowCollapse="false">
								
			<powersi:datagrid id="auditgrid"  height="200" delayLoad="true">
					<powersi:datagrid-column name="aac001"           id="aac001"   label="���Ժ�"       width="100"/>
					<powersi:datagrid-column name="aac003"   		 id="aac003"   label="����"         width="200"/>
					<powersi:datagrid-column name="aac004"           id="aac004"   label="�Ա�"       render="sex" width="100"/>
					<powersi:datagrid-column name="aac002" 	         id="aac002"   label="��ᱣ�Ϻ�"    width="200"/>
					<powersi:datagrid-column name="aac006" 	         id="aac006"   label="��������"      width="100"/>
					<powersi:datagrid-column name="aaz502" 	         id="aaz502"   label="�Ƿ񼤻�"    render="cardStatu"  width="100"/>
					<powersi:datagrid-column name="aaz500" 	         id="aaz500"   label="�籣����"         width="100"/>
			</powersi:datagrid>
     	</powersi:panelbox>
     	
		<powersi:hidden id="bke548" name="inHospitalDTO.bke548" />
		<powersi:hidden id="caa027" name="inHospitalDTO.caa027" value="4303-zg"/>
		<powersi:hidden id="aaa027" name="diagnoseInfoDTO.aaa027" />
		<powersi:hidden id="sbkjh" value="1" />
    </powersi:form> 
    <powersi:errors/>
    
<script type="text/javascript">

//����
function saveinfo(){
	var row= cardinfo.getSelectedRow();
	if (row == null) {
		popupAlert("��ѡ��һ����Ҫ���м���ļ�¼��", "��ʾ", "info");
		return;
	}	
	var querystring=row.sscard_no;
	var aab034=row.issuer_code;
	var aac002=row.sscard_no;
	var aaz500=row.card_no;
	postJSON(
			"${rootPath}/diagnose/GetPersonInfoAction!getPersonInfo.action?diagnoseInfoDTO.arg_name="
					+ "aac002"
					+ "&diagnoseInfoDTO.arg_value="
					+ querystring
					+ "&diagnoseInfoDTO.bka006="
					+ "110"
					+ "&diagnoseInfoDTO.aaz509="
					+ "1"
					+ "&diagnoseInfoDTO.aka130="
					+ "11",
		function(json){
		if (!checkJSONResult(json)) {
			return;
		}		
		if (json.message == 'multi-row') {
			choosepersonlist(querystring,aab034,aac002,aaz500);
			return;
		}
		postJSON("${rootPath}/common/CommonManagerAction!queryPersonCardInfo.action?inHospitalDTO.aac001="+json.data.personinfo.aac001
				+"&inHospitalDTO.baa027="+aab034
				+"&inHospitalDTO.aac002="+aac002
				+"&inHospitalDTO.aaz500="+aaz500,
				function(json){
				if (!checkJSONResult(json)) {
					return;
				}				
				popupAlert(json.data.message);
				if(json.data.issuccess=='1'){
					getPersonbyaac002(querystring);
				}
			});		
		});

}

function choosepersonlist(querystring,aab034,aac002,aaz500) {
	var row= cardinfo.getSelectedRow();
	popupDialog(
			{
				url : "${rootPath}/diagnose/GetPersonInfoAction!chooseperson.action?diagnoseInfoDTO.arg_value="
						+ querystring,
				onClosed : function() {
					var ret = this.returnValue;
					if (ret) {
						indi_id = ret.aac001;
						postJSON("${rootPath}/common/CommonManagerAction!queryPersonCardInfo.action?inHospitalDTO.aac001="+indi_id
								+"&inHospitalDTO.baa027="+aab034
								+"&inHospitalDTO.aac002="+aac002
								+"&inHospitalDTO.aaz500="+aaz500,
								function(json){
								if (!checkJSONResult(json)) {
									return;
								}				
								popupAlert(json.data.message);
								if(json.data.issuccess=='1'){
									getPersonbyaac002(querystring);
								}
							});						
					}
				}
			}, 500, 600);
}

function readIcCard() {
	getPerson();
}

function getPerson(para){
	if(!powersi.isnull($("#bke548").val())){
		var icFieldStr = "issuer_code|sscard_no|card_no|identifier_code|name|card_reset_info|"
			+ "spec_version|issue_date|card_validity|terminal_no|equipment_no|";
				
		var _bke548 = $("#bke548").val().split('|');
		
		var issuer_code = _bke548[0];
		var sscard_no = _bke548[1];
		var card_no = _bke548[2];
		var identifier_code = _bke548[3];
		var name = _bke548[4];
		var card_reset_info = _bke548[5];
		var spec_version = _bke548[6];
		var issue_date = _bke548[7];
		var card_validity = _bke548[8];
		var terminal_no = _bke548[9];
		var equipment_no = _bke548[10];
		
		var jsonFee = {
			"issuer_code" : issuer_code,
			"sscard_no" : sscard_no,
			"card_no" : card_no,
			"identifier_code" : identifier_code,
			"name" : name,
			"card_reset_info" : card_reset_info,
			"spec_version" : spec_version,
			"issue_date" : issue_date,
			"card_validity" : card_validity,
			"terminal_no" : terminal_no,
			"equipment_no" : equipment_no
		};

		cardinfo.add(jsonFee);
	}
}


function getPersonbyaac002(para) {
		var querystring = powersi.trim($("#querystring").val());
		if (powersi.isnull(querystring)) {
			alert("��������Ч��ѯ����!");
			return;
		}
		postJSON("${rootPath}/common/CommonManagerAction!queryAC01Info.action?inHospitalDTO.argName="
						+ $("#argName").val()
						+ "&inHospitalDTO.aac002="
						+querystring,
				function(json){
					if (!checkJSONResult(json)) {
						return;
					}				
					auditgrid.loadData(json.data);
				});
	}

function sex(row, index, value){
	var str = value;
	if(value == "1"){
		str = "��";
	}else if(value == "2"){
		str = "Ů";
	}else if(value == "9"){
		str = "δ˵���Ա�";
	}
	return str;
}

function cardStatu(row, index, value){
	var str = value;
	if(value == "0"){
		str = "���";
	}else if(value == "1"){
		str = "����";
	}else if(value == "2"){
		str = "��ʧ";
	}else if(value == "3"){
		str = "Ӧ������";
	}else if(value == "9"){
		str = "ע��";
	}
	return str;
}
</script>  
</body>
</html>
