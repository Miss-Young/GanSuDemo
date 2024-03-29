<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%@ taglib prefix="biz" uri="http://www.powersi.com.cn/biztags"%>
<%@ page import="com.powersi.ssm.biz.medicare.common.util.BizHelper"%>
<%
	request.setAttribute("path", request.getContextPath() + "/medicarespecial/specialManager");
	String aaa027 = BizHelper.getAaa027();
	String hospital_id = BizHelper.getAkb020();
	String hospital_name = BizHelper.getAkb021();
	String loginUser = BizHelper.getLoginUser();
	String userName = BizHelper.getUserName();
%>

<powersi:html>
	<base target="_self">
	<powersi:head title="大病特药申请详情" />
<body>
	<powersi:form id="appHisForm" name="appHisForm" action="specialManager!getOtherAppInfList.action" namespace="/medicarespecial">
		<powersi:hidden name="dto.aaz267"/>
		<powersi:hidden name="dto.aac001"/>
		<powersi:hidden id="aka083His" name="dto.aka083"/>
		<powersi:hidden name="dto.aaa027"/>
		<powersi:hidden name="dto.caa027"/>
		<powersi:hidden name="dto.comFlag" value="4"/>
	</powersi:form>
	<powersi:form id="drugForm" name="diseaseForm" action="specialManager!getOtherAppInfList.action" namespace="/medicarespecial">
		<powersi:hidden name="dto.aaz267"/>
		<powersi:hidden name="dto.aaa027"/>
		<powersi:hidden name="dto.caa027"/>
		<powersi:hidden name="dto.comFlag" value="3"/>
	</powersi:form>
	<powersi:form id="hospForm" name="hospForm" action="specialManager!getOtherAppInfList.action" namespace="/medicarespecial">
		<powersi:hidden name="dto.aaz267"/>
		<powersi:hidden name="dto.aaa027"/>
		<powersi:hidden name="dto.caa027"/>
		<powersi:hidden name="dto.comFlag" value="1"/>
	</powersi:form>
	<powersi:form id="assBizForm" name="assBizForm" action="specialManager!getOtherAppInfList.action" namespace="/medicarespecial">
		<powersi:hidden name="dto.aaz267"/>
		<powersi:hidden name="dto.aaa027"/>
		<powersi:hidden name="dto.caa027"/>
		<powersi:hidden name="dto.comFlag" value="5"/>
	</powersi:form>
	<powersi:form id="mainForm" action="specialManager!getQueryDetailPage.action" namespace="/medicarespecial">
		<!-- 隐藏元素层 -->
		<div style="display: none">
			<powersi:textfield id="pageFlag" name="dto.pageFlag" label="页面标志"/>
			<powersi:textfield id="aae140" name="dto.aae140" key="aae140" label="险种类型"/>
			<powersi:textfield id="aka083" name="dto.aka083" key="aka083" value="180" label="申请类型"/>
			<powersi:textfield id="aaa027" name="dto.aaa027" key="aaa027" value="<%= aaa027  %>"  label="统筹区编码"/>
			<powersi:textfield id="aka130" name="dto.aka130" key="aka130" value="18" label="业务类型"/>
			<powersi:textfield id="bka006" name="dto.bka006" key="bka006" value="180" label="待遇类型"/>
			<powersi:textfield id="aaz267" name="dto.aaz267" key="aaz267" label="特殊业务申请ID"/>
			<powersi:textfield id="comFlag" name="dto.comFlag" key="comFlag" label="通用标志，没有特定用途，根据实际情况传递参数进行判断"/>
		</div>
		
		<powersi:panelbox title="基本信息">
			<powersi:panelbox-toolbar>
					<powersi:button key="button_close" data-hotkey='alt+B' value="关 闭" onclick="closeDialog();" />				
			</powersi:panelbox-toolbar>
			
			<powersi:editorlayout cols="8">
				<tr>
					<powersi:textfield id="aac001" name="dto.aac001" key="aac001" readonly="true" label="个人电脑号" />
					<powersi:textfield id="aac003" name="dto.aac003" key="aac003" disabled="true" label="姓名" />
					<powersi:codeselect id="aac004" name="dto.aac004" key="aac004" disabled="true" codeType="aac004" headerValue=" " headerKey="" label="性别" />
					<powersi:textfield id="aac002" name="dto.aac002" key="aac002" disabled="true" label="身份证号" />
				</tr>
				<tr>
					<powersi:textfield id="aac006" name="dto.aac006" key="aac006" disabled="true" label="出生日期"/>
					<powersi:codeselect id="bka035" name="dto.bka035" key="bka035" disabled="true" codeType="bka035" headerValue=" " headerKey="" label="人员类别"/>
					<powersi:textfield id="aab069" name="dto.aab069" key="aab069" disabled="true" label="单位名称" colspan="3"/>
				</tr>
				<tr>
					<powersi:textfield id="akb021" name="dto.akb021" required="true" disabled="true" label="申请医院"/>
					<powersi:textfield id="aae127" name="dto.aae127" required="true" key="aae127" disabled="true" label="申请日期" />
					<powersi:textfield id="aae030" name="dto.aae030" required="true" key="aae030" disabled="true" label="生效日期" />
					<powersi:textfield id="aae031" name="dto.aae031" required="true" key="aae031" disabled="true" label="失效日期" />
				</tr>
				<tr>
					<powersi:textfield id="bke033" name="dto.bke033" key="bke033" disabled="true" label="联系电话" />
					<powersi:textfield id="aae011" name="dto.aae011" disabled="true" label="经办人"/>
					<powersi:codeselect id="aae016" name ="dto.aae016" codeType="aae016_spapp" disabled="true" label="审核状态" />
					<td colspan="2"/>
				</tr>
			</powersi:editorlayout>
		</powersi:panelbox>
		
		<powersi:groupbox title="详细信息">
			<powersi:editorlayout cols="8">
				<tr>
					<powersi:textfield id="aka121" name="dto.aka121" required="true" disabled="true" label="申请病种" />
					<powersi:hidden id="aka120" name="dto.aka120" disabled="true" label="疾病编码" />
					<powersi:textfield id="bkb023" name="dto.bkb023" required="true" disabled="true" label="专家鉴定病种" />
					<powersi:hidden id="bke025" name="dto.bke025" disabled="true" label="疾病编码" />
					<powersi:textfield id="aae019" name="dto.aae019" validate="money" maxlength="12" key="aae019" disabled="true" label="申请限额"/>
					<td colspan="2"/>
				</tr>
				<tr>
					<powersi:textarea id="bke002" rows='1' name="dto.bke002" key="bke002" colspan="3" disabled="true" label="诊断依据" />  
					<powersi:textarea id="aae013" rows='1' name="dto.aae013" key="aae013" maxlength="165" colspan="3" disabled="true" label="备注" />  
				</tr>
			</powersi:editorlayout>
		</powersi:groupbox>
		
		<powersi:groupbox title="初审意见">
			<powersi:editorlayout cols="8">
				<tr>
					<powersi:textfield id="bkz201" name="dto.bkz201" required="true" disabled="true" label="初审病种" />
					<powersi:textfield id="aee333" name="dto.aee333" validate="money" maxlength="12" key="aee333" disabled="true" label="初审限额"/>
					<powersi:textfield id="bke021" name="dto.bke021" disabled="true" label="初审人"/>
					<powersi:textfield id="bke022" name="dto.bke022" required="true" key="bke022" disabled="true" label="初审日期" />
				</tr>
				<tr>
					<powersi:textarea id="bke024" rows='1' name="dto.bke024" key="bke024" colspan="8" disabled="true" label="初审意见" />  
				</tr>
			</powersi:editorlayout>
		</powersi:groupbox>
		
		<powersi:groupbox title="复审意见">
			<powersi:editorlayout cols="8">
				<tr>
					<powersi:textfield id="bkz202" name="dto.bkz202" required="true" disabled="true" label="复审病种" />
					<powersi:textfield id="akb081" name="dto.akb081" validate="money" maxlength="12" key="akb081" disabled="true" label="复审限额"/>	
					<powersi:textfield id="aae014" name="dto.aae014" disabled="true" label="复审人"/>
				<powersi:textfield id="aae015" name="dto.aae015" required="true" key="aae015" disabled="true" label="复审日期" />
				</tr>
				<tr>
					<powersi:textarea id="aae189" rows='1' name="dto.aae189" key="aae189" colspan="8" disabled="true" label="复审意见" />  
				</tr>
			</powersi:editorlayout>
		</powersi:groupbox>
		
		<table class="table_none" >
			<tbody>
				<tr>
					<td valign="top" width="50%" >
						<powersi:panelbox title="特殊药品">
							<powersi:datagrid id="gridDrug" formId="drugForm"   
								height="200" pageSize="100" enabledSort="true"
								pageSizeOptions="[100]" delayLoad="true"
								onLoadedData="function(dg){if(dg.getTotal()>0){dg.setParm('dto.totalResult',dg.getTotal());}}"
								pageParmName="dto.currentPage" pagesizeParmName="dto.pageSize">
								<powersi:datagrid-column name="ake001" display="药品项目编码" width="20%" />
								<powersi:datagrid-column name="ake002" display="药品项目名称" width="50%" />
								<powersi:datagrid-column name="aae019" display="限额" width="20%" />
							</powersi:datagrid>
						</powersi:panelbox>
					</td>
					
					<td valign="top" width="50%" >
						<powersi:panelbox title="定点医疗机构">
							<powersi:datagrid id="gridHosp" formId="hospForm" 
								height="200" pageSize="3" enabledSort="true"
								pageSizeOptions="[3,10,20,50,100]" delayLoad="true"
								onLoadedData="function(dg){if(dg.getTotal()>0){dg.setParm('dto.totalResult',dg.getTotal());}}"
								pageParmName="dto.currentPage" pagesizeParmName="dto.pageSize">
								<powersi:datagrid-column name="akb020" display="定点医疗机构编码" width="30%" />
								<powersi:datagrid-column name="akb021" display="定点医疗机构名称" width="60%" />
							</powersi:datagrid>
						</powersi:panelbox>
					</td>
				</tr>
			</tbody>
		</table>
		
		<powersi:groupbox title="关联业务信息（单击展开）"  isCollapse="true">
			<powersi:datagrid id="gridAssBiz" formId="assBizForm" 
				height="30%" pageSize="5" enabledSort="true" pageSizeOptions="[5, 10, 20, 100]" delayLoad="true"
				onLoadedData="function(dg){if(dg.getTotal()>0){dg.setParm('dto.totalResult',dg.getTotal());}}"
				pageParmName="dto.currentPage" pagesizeParmName="dto.pageSize">
				<powersi:datagrid-column name="aka130" display="业务类型" data="aka130List" render="renderDictionary" width="8%"/>
				<powersi:datagrid-column name="bka006" display="待遇类型" data="bka006List" render="renderDictionary" width="8%"/>
				<powersi:datagrid-column name="akb021" display="医疗机构" width="14%"/>
				<powersi:datagrid-column name="bkz101" display="入院疾病诊断" width="14%"/>
				<powersi:datagrid-column name="bkz102" display="出院疾病诊断" width="14%"/>
				<powersi:datagrid-column name="aae036" display="登记日期" width="8%"/>
				<powersi:datagrid-column name="aae030" display="入院日期" width="8%"/>
				<powersi:datagrid-column name="aae031" display="出院日期" width="8%"/>
				<powersi:datagrid-column name="akc194" display="结算日期" width="8%"/>
				<powersi:datagrid-column name="biz_flag" display="在院状态" width="3%"/>
				<powersi:datagrid-column name="aae100" display="有效状态" data="aae100List" render="renderDictionary" width="3%"/>
			</powersi:datagrid>
		</powersi:groupbox>
		
		<powersi:groupbox title="申请历史记录（单击展开）"  isCollapse="true">
			<powersi:datagrid id="gridAppHis" formId="appHisForm" 
				height="30%" pageSize="5" enabledSort="true" pageSizeOptions="[5, 10, 20, 100]" delayLoad="true"
				onLoadedData="function(dg){if(dg.getTotal()>0){dg.setParm('dto.totalResult',dg.getTotal());}}"
				pageParmName="dto.currentPage" pagesizeParmName="dto.pageSize">
				<powersi:datagrid-column name="aka083" hide="true" isExport="false"/><powersi:datagrid-column name="aka083_name" display="申请类型" data="aka083" code="aka083"  isSort="false" width="15%"/>
				<powersi:datagrid-column name="akb021" display="申请医疗机构" width="35%"/>
				<powersi:datagrid-column name="aae127" display="申请日期" width="10%"/>
				<powersi:datagrid-column name="aae030" display="生效日期" width="10%"/>
				<powersi:datagrid-column name="aae031" display="失效日期" width="10%"/>
				<powersi:datagrid-column name="aae016" display="审核状态" data="aae016List" render="renderDictionary" isExport="false"  isSort="false" width="10%"/>
				<powersi:datagrid-column name="aae100" display="有效状态" data="aae100List" render="renderDictionary" width="10%"/>
				<powersi:datagrid-column name="aaz267" display="申请号" hide="true" isExport="false"  width=""/>
			</powersi:datagrid>
		</powersi:groupbox>
		
			<powersi:codetable id="aka130List" codeType="aka130"></powersi:codetable>
			<powersi:codetable id="bka006List" codeType="bka006"></powersi:codetable>
			<powersi:codetable id="aka083List" codeType="aka083"></powersi:codetable>
			<powersi:codetable id="aae016List" codeType="aae016_spapp"></powersi:codetable>
			<powersi:codetable id="aae100List" codeType="aae100"></powersi:codetable>
		
		<powersi:errors />
	</powersi:form>
</body>
<script type="text/javascript">
	var pwidth=1000,pheight=500
	
	
	$(document).ready(function() {
		gridDrug.reset();
		gridDrug.loadForm(drugForm);
		gridHosp.reset();
		gridHosp.loadForm(hospForm);
		gridAssBiz.reset();
		gridAssBiz.loadForm(assBizForm);
		gridAppHis.reset();
		gridAppHis.loadForm(appHisForm);
		initForm();
		setClientScreenWH();
	});
	
	
	function setClientScreenWH() {
		pwidth=0.9*$(window).width();
	}
	
	
	function initForm() {
		$("#aka083His").val($("#aka083").val());
	}
	
	
	/* 字典项渲染函数  解决loadData不能自动加载字典问题*/
	function renderDictionary(rowdata, index, value,arguments) {
		if(value != null && value != "") {
			var list = window[arguments.data];
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
	
	
	function getdateString(){
		var dt = new Date();
		var strDate = dt.getFullYear() ;
		if (dt.getMonth() + 1 <10) strDate += "0";
		strDate += '' + (dt.getMonth()+1);
		if (dt.getDate() <10) strDate += "0";
		strDate += '' + dt.getDate();
		return strDate;
	}
</script>
</powersi:html>