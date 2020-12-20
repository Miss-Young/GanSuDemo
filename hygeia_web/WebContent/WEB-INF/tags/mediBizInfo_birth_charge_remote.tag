<%@tag import="java.util.Date"%>
<%@tag import="com.powersi.hygeia.framework.util.DateFunc"%>
<%@tag import="com.powersi.ssm.biz.medicare.common.util.BizHelper"%>
<%@ tag pageEncoding="GBK" body-content="empty" small-icon=""
	display-name="ҽ��ҵ����Ϣ" description="ҽ��ҵ����Ϣ"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%
    String bka006Filter = " data_value like '511%'";
    String center_id = BizHelper.getAaa027();
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
		$("#diagnose_date").val('<%=DateFunc.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss")%>');
		$("#fee_date").val('<%=DateFunc.dateToString(new Date(), "yyyyMMdd")%>');
		$("#treatment_type").val("511");
	}
);

/*
* �������
*/
function chooseDis() {
	popupDialog(
			{
				url : "${rootPath}/common/CommonManagerAction!chooseDisease_remote.action",
				onClosed : function() {
					var retValue = this.returnValue;
					if (retValue) {
						$("#in_disease_name").val(retValue.disease);
						$("#diagnose").val(retValue.icd);
						$("#icd").val(retValue.icd);
					} else {
						$("#in_disease_name").val("");
						$("#icd").val("");
						$("#diagnose").val("");
						return $("#diagnose").focus();
					}
				}
			}, 500, 600);
}

/*
 * �ı������س�ʱ�����¼�
 */
function keyDown(para) {
	if (event.keyCode == '13') {
		var filed_name = para.id;
		if ('fromdate' == filed_name) {
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
</script>
	<powersi:editorlayout cols="15%,9%,13%,9%,15%,9%,15%,7%,18%">
	<tr>
		<td rowspan="6" colspan="1" align="center" style="border: 1px solid #d5e4f1;" >
			<div id="imgdiv" >
				<img id="dlrimg" height="100px" width="140px" style="max-height : 100%; max-width: 100%;">
				<powersi:hidden id="kc90id" name="diagnoseInfoDTO.kc90id" />
			</div>
		</td>
		<powersi:textfield id="last_balance" name="diagnoseInfoDTO.last_balance" key="�����˻����"
			readonly="true" cssStyle="color:red;" />
		<powersi:textfield id="pers_name" name="diagnoseInfoDTO.pers_name" key="��Ա���" disabled="true"/>
	    <powersi:hidden id="pers_type" name="diagnoseInfoDTO.pers_type" />
		<powersi:codeselect id="sex" name="diagnoseInfoDTO.aac004_name" key="�Ա�"
			headerValue="" headerKey="0" codeType="aac004" disabled="true" />
		<powersi:hidden id="sex" name="diagnoseInfoDTO.sex" />
		<powersi:textfield id="birthday" key="��������"
			name="diagnoseInfoDTO.birthday" readonly="true" />
	</tr>
	<tr>
		<powersi:textfield id="baa027_name" name="diagnoseInfoDTO.baa027_name" key="��������"
			readonly="true" />
		<powersi:hidden id="baa027" name="diagnoseInfoDTO.baa027" />
		<powersi:textfield id="official_name" name="diagnoseInfoDTO.official_name" key="����Ա����"
			 disabled="true" />
		<powersi:hidden id="official_code" name="diagnoseInfoDTO.official_code" />
		<powersi:textfield id="bka888" key="���𶳽����" name="diagnoseInfoDTO.bka888"
			readonly="true"/>
		<powersi:textfield id="indi_id" name="diagnoseInfoDTO.indi_id" key="���Ժ�"
			readonly="true" />
	</tr>
	<tr>
		<powersi:codeselect id="treatment_type" name="diagnoseInfoDTO.treatment_type" key="��������"
			codeType="bka006" codeFilter="<%=bka006Filter%>" codeLocal="<%=center_id%>"
			disabled="true" />
		<powersi:textfield id="diagnose_date" name="diagnoseInfoDTO.diagnose_date" key="��������"
			onKeyDown="keyDown(this)"  readonly="true" />
		<powersi:textfield id="in_disease_name" name="diagnoseInfoDTO.in_disease_name" key="�������" required="true"
						   onKeyDown="keyDown(this)" onbuttonclick="chooseDis()" buttonId="disinse"
			readonly="true" />
		<powersi:textfield id="telephone" name="diagnoseInfoDTO.telephone" key="��ϵ�绰"
			readonly="true" />
        <powersi:hidden id="diagnose" key="���ļ�������" name="diagnoseInfoDTO.diagnose" />
	</tr>
	<tr>
		<powersi:textfield id="audit_limit" key="����������ָ��" readonly="true" />
		<powersi:textfield id="special_in_seg" key="����ָ��" readonly="true" />
		<powersi:textfield id="serial_no" name="diagnoseInfoDTO.serial_no" key="��ҽ�ǼǺ�"
						   readonly="true" />
		<td colspan="1">
			<span style="vertical-align : middle; float: right">��Чʱ��</span>
		</td>
		<td colspan="1">
			<div id="div-demo" class="input-group input-daterange">
				<powersi:textfield id="admit_effect" name="diagnoseInfoDTO.admit_effect"  readonly="true" />
				<span class="input-group-addon">-</span> 
				<powersi:textfield id="admit_date"  name="diagnoseInfoDTO.admit_date" readonly="true" />
			</div>
		</td>
	</tr>
	<tr>
		<powersi:textfield id="identify_code" name="diagnoseInfoDTO.identify_code" key="�����϶���"
							readonly="true" />
		<powersi:textfield id="certificate_no" name="diagnoseInfoDTO.certificate_no" key="׼��֤��"
						   readonly="true" />
		<powersi:textfield id="childbirth_no" name="diagnoseInfoDTO.childbirth_no" key="�������"
						   readonly="true" />
		<td colspan="1">
			<span style="vertical-align : middle; float: right">ҽ����</span>
		</td>
		<td colspan="1">
			<div id="div-demo1" class="input-group input-daterange">
				<powersi:textfield id="begin_date" name="diagnoseInfoDTO.begin_date" readonly="true" />
				<span class="input-group-addon">-</span>
				<powersi:textfield id="end_date" name="diagnoseInfoDTO.end_date" readonly="true" />
			</div>
		</td>

	</tr>
	<tr>
		<powersi:textfield id="birth_type" name="diagnoseInfoDTO.birth_type" key="����������"
							readonly="true" />
		<powersi:textfield id="birth_type_name" name="diagnoseInfoDTO.birth_type_name" key="�����������"
						   readonly="true" />
	</tr>
		<powersi:hidden id="treatment_type_reg" name="diagnoseInfoDTO.treatment_type" />
		<powersi:hidden id="diagnose_date_reg" name="diagnoseInfoDTO.diagnose_date" />
		<powersi:hidden id="corp_id" key="��λ���Ժ�" name="diagnoseInfoDTO.corp_id" />
		<%--<powersi:hidden id="aab019" name="diagnoseInfoDTO.aab019" />--%>
		<powersi:hidden id="serial_apply" key="�������к�" name="diagnoseInfoDTO.serial_apply" />
		<powersi:hidden id="biz_type" name="diagnoseInfoDTO.biz_type" value="51" />
		<powersi:hidden id="icd" name="diagnoseInfoDTO.icd" />
</powersi:editorlayout>
