<%@tag import="java.util.HashMap"%>
<%@tag import="java.util.Map"%>
<%@tag import="java.util.ArrayList"%>
<%@tag import="java.util.List"%>
<%@tag import="java.util.Date"%>
<%@tag import="com.powersi.hygeia.framework.util.DateFunc"%>
<%@tag import="com.powersi.ssm.biz.medicare.common.util.BizHelper"%>
<%@ tag pageEncoding="GBK" body-content="empty" small-icon=""
	display-name="ҽ��ҵ����Ϣ" description="ҽ��ҵ����Ϣ"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%
    String bka006Filter = " data_value like '18%'";
    String aaa027 = BizHelper.getAaa027();
%>
<style>
#imgdiv {
	height: 100px !important;
	width: 140px !important;
	border: 1px solid #d5e4f1;
	max-width: 100%; 
	max-height: 100%;
	background: url(${rootPath}/login/images/default.png) repeat 0px 0px;
	background-size:100% 100%;
}
</style>
<script type="text/javascript">
$(document).ready(
	function() {
		$("#aae030").val('<%=DateFunc.dateToString(new Date(), "yyyyMMdd")%>');
		$("#ake007").val('<%=DateFunc.dateToString(new Date(), "yyyyMMdd")%>');
		$("#bka006").val("180");
	});
	
/*
 * �ı������س�ʱ�����¼�
 */
function keyDown(para) {
	if (event.keyCode == '13') {
		var filed_name = para.id;
		if ('aae030' == filed_name) {
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
	}
}

function selectAke001(){
	$("#ake001_big").val(item[0].ake002);
}
</script>

<powersi:script>
	var ake001Grid;
	var item = [];
	/*cbxΪtrue��ʾ��ѡ��false��ʾ��ѡ,���в���������ʹ��js��ֵ(id['������']=����ֵ)*/
	function getGridOptions(cbx){
		<powersi:datagrid id="gridOptions" frozen="false" selectRowButtonOnly="false"
			usePager="false">
			<powersi:datagrid-column display="��ҩҩƷ" name="ake002" width="40%" minWidth="100" />
			<powersi:datagrid-column display="�����޶�" name="akb081" width="30%" minWidth="80" />
			<powersi:datagrid-column display="ʣ���޶�" name="bkb017" width="30%" minWidth="80" />
		</powersi:datagrid>
		gridOptions["checkbox"] = cbx;
		ake001Grid = gridOptions;
		return gridOptions;
	}
	
	function loadBigGrid(){
		var ake002 = $("#ake002").val().split(",");
		var ake001 = $("#ake001").val().split(",");
		var akb081 = $("#akb081").val().split(",");
		var bkb017 = $("#bkb017").val().split(",");
		$.each(ake002, function(i, aa){
			var bigMap ={};
			bigMap.ake001 = ake001[i];
			bigMap.ake002 = ake002[i];
			bigMap.akb081 = akb081[i];
			bigMap.bkb017 = bkb017[i];
			item.push(bigMap);
		});
		ake001Grid["data"] = item;
		$("#ake001_big").val(item[0].ake002);
	}
	
</powersi:script>
<powersi:editorlayout cols="15%,9%,13%,8%,20%,9%,15%,6%,15%">
	<tr>
		<td rowspan="5" colspan="1" align="center" style="border: 1px solid #d5e4f1;" >
			<div id="imgdiv" >
				<img id="dlrimg" height="100px" width="140px" style="max-height : 100%; max-width: 100%;">
				<powersi:hidden id="kc90id" name="diagnoseInfoDTO.kc90id" />
			</div>
		</td>
		<powersi:textfield id="bacu18" name="diagnoseInfoDTO.bacu18" key="�����˻����"
			readonly="true" cssStyle="color:red;" />
		<powersi:codeselect id="bka035" name="diagnoseInfoDTO.bka035_name" key="��Ա���"
			headerKey="0" headerValue="" codeType="bka035" disabled="true"/>
	    <powersi:hidden id="bka035" name="diagnoseInfoDTO.bka035" />
		<powersi:codeselect id="aac004" name="diagnoseInfoDTO.aac004_name" key="�Ա�"
			headerKey="0" headerValue="" codeType="aac004" disabled="true" />
		<powersi:hidden id="aac004" name="diagnoseInfoDTO.aac004" />
		<powersi:textfield id="aac006" name="diagnoseInfoDTO.aac006" key="��������"
			readonly="true" />
	</tr>
	<tr>
		<powersi:textfield id="baa027_name" name="diagnoseInfoDTO.baa027_name" key="��������"
			readonly="true"/>
		<powersi:hidden id="baa027" name="diagnoseInfoDTO.baa027" />
		<powersi:codeselect id="bac001" name="diagnoseInfoDTO.bac001" key="����Ա����"
			 headerKey="0" headerValue="" codeType="bac001" disabled="true" />
		<powersi:hidden id="bac001" name="diagnoseInfoDTO.bac001" />
		<powersi:textfield id="bka888" key="���𶳽����" name="diagnoseInfoDTO.bka888"
			readonly="true"/>
		<powersi:textfield id="aac001" name="diagnoseInfoDTO.aac001" key="���Ժ�" 
			readonly="true" value=""/>
	</tr>
	<tr>
		<powersi:codeselect id="bka006" name="diagnoseInfoDTO.bka006" key="��������" 
			codeType="bka006" codeFilter="<%=bka006Filter%>" codeLocal="<%=aaa027%>" 
			disabled="true" />
		<powersi:textfield id="aae030" name="diagnoseInfoDTO.aae030" key="��ҩ����" 
			onKeyDown="keyDown(this)" readonly="true"/>
		<powersi:textfield id="aaz267" name="diagnoseInfoDTO.aaz267" key="�����"   
			readonly="true" />
		<powersi:textfield id="aae005" name="diagnoseInfoDTO.aae005" key="��ϵ�绰"  
			readonly="true" />
	</tr>
	<tr>
		
		<powersi:textfield id="bkz101" name="diagnoseInfoDTO.bkz101" key="�������" 
			readonly="true" />
		
		<td colspan="1">
			<span style="vertical-align : middle; float: right">��Чʱ��</span>
		</td>
		<td colspan="1">
			<div id="div-demo" class="input-group input-daterange">
				<powersi:textfield id="bkm030" name="diagnoseInfoDTO.bkm030"  readonly="true" /> 
				<span class="input-group-addon"><i class="icon-calendar"></i></span> 
				<powersi:textfield id="bkm031"  name="diagnoseInfoDTO.bkm031" readonly="true" />
			</div>
		</td>
		<powersi:combobox id="ake001_big" label="��ҩҩƷ" hideGridOnLoseFocus="true" 
			colspan="3" selectBoxWidth="600" selectBoxHeight="180" onSelected="selectAke001"
			grid="getGridOptions(false)"/>
	</tr>
	<tr>
		<powersi:textfield id="aaz217" name="diagnoseInfoDTO.aaz217" key="��ҽ�ǼǺ�"
			readonly="true" />
		
		<powersi:hidden id="ake001" name="diagnoseInfoDTO.ake001" />
		<powersi:hidden id="ake002" name="diagnoseInfoDTO.ake002" />
		<powersi:hidden id="akb081" name="diagnoseInfoDTO.akb081" key="�����޶�" />
		<powersi:hidden id="bkb017" name="diagnoseInfoDTO.bkb017" key="ʣ���޶�" />
	</tr>
</powersi:editorlayout>
<powersi:hidden id="bka006_reg" name="diagnoseInfoDTO.bka006" />
<powersi:hidden id="aab001" key="��λ���Ժ�" name="diagnoseInfoDTO.aab001" />
<powersi:hidden id="aab019" name="diagnoseInfoDTO.aab019" />
<powersi:hidden id="aka130" name="diagnoseInfoDTO.aka130" value="18" />
<powersi:hidden id="aae140" name="diagnoseInfoDTO.aae140" />
<powersi:hidden id="reducefeebatch" key="��������" name="diagnoseInfoDTO.reducefeebatch" />
<powersi:hidden id="bka001" key="��������" name="diagnoseInfoDTO.bka001" />
<powersi:hidden id="bka039" key="������" name="diagnoseInfoDTO.bka039" />
<powersi:hidden id="akc193" name="diagnoseInfoDTO.akc193" />
<powersi:hidden id="bka016" name="diagnoseInfoDTO.bka016" />
<powersi:hidden id="bka011" name="diagnoseInfoDTO.bka011" />
<powersi:hidden id="bka012" name="diagnoseInfoDTO.bka012" />
<powersi:hidden id="kc21id" key="����" name="diagnoseInfoDTO.kc21id" />