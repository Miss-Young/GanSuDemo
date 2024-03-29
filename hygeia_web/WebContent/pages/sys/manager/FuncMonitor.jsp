<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%
	String db = request.getParameter("db");
	if(db == null || db.length() == 0){
		db = "oracle";
	}
	request.setAttribute("db", db);
	request.setAttribute("id", "mongodb".equals(db) ? "_id" : "");
%>
<powersi:html>
<head>
<powersi:head title="功能日志分析" />
<script src="${strutsPath}/include/fileupload.js" type="text/javascript"></script>
</head>
<body>
	<powersi:form id="queryForm" disabled="true">
		<powersi:panelbox title="功能日志" key="panel_query" allowAddition="true">
			<powersi:panelbox-toolbar>
				<powersi:button type="submit" id="btViewReuslt" value="查询功能日志" title="查询功能分析日志(sys_monitor_func)"
					onclick="viewResult()"  key="button_refresh" />
				<powersi:button type="button" id="btServer" value="导入服务器日志" title="从服务器获取日志文件导入功能日志表"
					onclick="openServerDlg()"  key="button_import" />
				<powersi:button type="button" id="btLocal" value="导入本地文件" title="从本地获取日志文件导入功能日志表"
					onclick="openLocalDlg()"  key="button_upload" />
				<powersi:button type="button" id="btClearDatabase" value="清理功能日志" title="清空功能分析日志(sys_monitor_func)" 
					onclick="clearDatabaseLog()" key="button_clean" />
			</powersi:panelbox-toolbar>
			<powersi:editorlayout cols="8%,17%,8%,17%,8%,17%,8%,17%">
				<powersi:editorlayout-row addition="false">
					<powersi:textfield id="begin_date" name="begin_date" key="begin_date" mask="datetime" />
					<powersi:textfield id="end_date" name="end_date" key="end_date" mask="datetime" />
					<powersi:textfield id="func_id" name="func_id" label="功能号" 
						placeholder="支持表达式" title="空格( )表示AND，竖线(|)表示OR，减号(-)表示NOT，双引号(\"x\")表示=x，双引号(\"\")表示NULL" />
					<powersi:textfield id="func_param" name="func_param" label="请求参数"
						placeholder="支持表达式" title="空格( )表示AND，竖线(|)表示OR，减号(-)表示NOT，双引号(\"x\")表示=x，双引号(\"\")表示NULL" />
				</powersi:editorlayout-row>
				<powersi:editorlayout-row addition="true">
					<powersi:checkboxlist id="log_level" name="log_level" label="日志级别" codeType="log_level" repeatColumns="3" />
					<powersi:editorlayout-label>
						<powersi:label>参数长度</powersi:label>
					</powersi:editorlayout-label>
					<powersi:editorlayout-input>
						<div class="input-group">
							<powersi:textfield id="param_length_min" name="param_length_min" validate="integer" title="最小值" />
							<span class="input-group-addon">-</span>
							<powersi:textfield id="param_length_max" name="param_length_max" validate="integer" title="最大值" />
						</div>
					</powersi:editorlayout-input>
					<powersi:editorlayout-label>
						<powersi:label>结果长度</powersi:label>
					</powersi:editorlayout-label>
					<powersi:editorlayout-input>
						<div class="input-group">
							<powersi:textfield id="result_length_min" name="result_length_min" validate="integer" title="最小值" />
							<span class="input-group-addon">-</span>
							<powersi:textfield id="result_length_max" name="result_length_max" validate="integer" title="最大值" />
						</div>
					</powersi:editorlayout-input>
					<powersi:textfield id="func_result" name="func_result" label="响应结果"
						placeholder="支持表达式" title="空格( )表示AND，竖线(|)表示OR，减号(-)表示NOT，双引号(\"x\")表示=x，双引号(\"\")表示NULL" />
				</powersi:editorlayout-row>
			</powersi:editorlayout>
		</powersi:panelbox>
	</powersi:form>
	<div class="space"></div>
	<powersi:tabbedpanel id="divTabs">
		<powersi:tab id="tab1" target="divTab1" label="运行时间一览" />
		<powersi:tab id="tab2" target="divTab2" label="调用频度一览" />
		<powersi:tab id="tab3" target="divTab3" label="访问时间点一览" />
		<div id="divTab1">
			<powersi:datagrid id="gridTime" url="${rootPath}/manager/FuncMonitor!getRunPerform.action?type=time&db=${db }"
				frozen="false" delayLoad="true" rowAttrRender="gridRowRender" useCount="false"
				detail="{onShowDetail: showDetail4Time, height:'auto'}" onDblClickRow="dblClickRow4Time"
				exportFileName="'功能运行时间'" showExportExcel="true" showExportExcel2007="true" showExportPdf="true">
				<powersi:datagrid-column display="功能编号" name="func_no" width="150" hide="true" />
				<powersi:datagrid-column display="日志级别" name="log_level_name" width="80" code="log_level" data="log_level"/>
				<powersi:datagrid-column display="发生时间" name="func_date" width="150" />
				<powersi:datagrid-column display="功能号"   name="func_id" width="150" />
				<powersi:datagrid-column display="请求参数" name="func_param" width="50%" isSort="false" render="renderXml" />
				<powersi:datagrid-column display="响应结果" name="func_result" width="50%" isSort="false" render="renderXml" />
				<powersi:datagrid-column display="参数长度" name="param_length" width="100" format="{0,number,###,###,###}" />
				<powersi:datagrid-column display="结果长度" name="result_length" width="100" format="{0,number,###,###,###}" />
			</powersi:datagrid>
		</div>
		<div id="divTab2">
			<powersi:datagrid id="gridCaller" url="${rootPath}/manager/FuncMonitor!getRunPerform.action?type=caller&db=${db }"
				frozen="false" delayLoad="true" useCount="false"
				detail="{onShowDetail: showDetail4Caller, height:'auto'}" onDblClickRow="dblClickRow4Caller"
				exportFileName="'功能调用频度'" showExportExcel="true" showExportExcel2007="true" showExportPdf="true">
					<powersi:datagrid-column display="功能号" name="func_id" width="100%" minWidth="120" data="${id }" />
					<powersi:datagrid-column display="功能调用次数" name="func_num" width="100" format="{0,number,###,###,###}" />
					<powersi:datagrid-column display="参数长度">
						<powersi:datagrid-column display="总参数长度" name="param_length_total" width="100" format="{0,number,###,###,###}" />
						<powersi:datagrid-column display="平均参数长度" name="param_length_avg" width="100" format="{0,number,###,###,###}" />
						<powersi:datagrid-column display="最长参数长度" name="param_length_max" width="100" format="{0,number,###,###,###}" />
						<powersi:datagrid-column display="最短参数长度" name="param_length_min" width="100" format="{0,number,###,###,###}" />
					</powersi:datagrid-column>
					<powersi:datagrid-column display="结果长度">
						<powersi:datagrid-column display="总结果长度" name="result_length_total" width="100" format="{0,number,###,###,###}" />
						<powersi:datagrid-column display="平均结果长度" name="result_length_avg" width="100" format="{0,number,###,###,###}" />
						<powersi:datagrid-column display="最长结果长度" name="result_length_max" width="100" format="{0,number,###,###,###}" />
						<powersi:datagrid-column display="最短结果长度" name="result_length_min" width="100" format="{0,number,###,###,###}" />
					</powersi:datagrid-column>
					<powersi:datagrid-column display="发生时间">
						<powersi:datagrid-column display="首次发生时间" name="func_begin_date" width="150" />
						<powersi:datagrid-column display="末次发生时间" name="func_end_date" width="150" />
					</powersi:datagrid-column>
			</powersi:datagrid>
		</div>
		<div id="divTab3">
			<powersi:datagrid id="gridDate" url="${rootPath}/manager/FuncMonitor!getRunPerform.action?type=date&db=${db }"
				frozen="false" delayLoad="true" useCount="false"
				detail="{onShowDetail: showDetail4Date, height:'auto'}" onDblClickRow="dblClickRow4Date"
				exportFileName="'功能访问时间点'" showExportExcel="true" showExportExcel2007="true" showExportPdf="true">
					<powersi:datagrid-column display="时间点" name="func_date" minWidth="120" width="50%" data="${id }"/>
					<powersi:datagrid-column display="功能调用次数" name="func_num" minWidth="120" width="50%" format="{0,number,###,###,###}" />
					<powersi:datagrid-column display="参数长度">
						<powersi:datagrid-column display="总参数长度" name="param_length_total" width="120" format="{0,number,###,###,###}" />
						<powersi:datagrid-column display="平均参数长度" name="param_length_avg" width="120" format="{0,number,###,###,###}" />
						<powersi:datagrid-column display="最长参数长度" name="param_length_max" width="120" format="{0,number,###,###,###}" />
						<powersi:datagrid-column display="最短参数长度" name="param_length_min" width="120" format="{0,number,###,###,###}" />
					</powersi:datagrid-column>
					<powersi:datagrid-column display="结果长度">
						<powersi:datagrid-column display="总结果长度" name="result_length_total" width="120" format="{0,number,###,###,###}" />
						<powersi:datagrid-column display="平均结果长度" name="result_length_avg" width="120" format="{0,number,###,###,###}" />
						<powersi:datagrid-column display="最长结果长度" name="result_length_max" width="120" format="{0,number,###,###,###}" />
						<powersi:datagrid-column display="最短结果长度" name="result_length_min" width="120" format="{0,number,###,###,###}" />
					</powersi:datagrid-column>
			</powersi:datagrid>
		</div>
	</powersi:tabbedpanel>
	<powersi:errors />
	<!-- 隐藏区 -->
	<div class="hidden">
		<div id="uploadServerDlg">
			<div class="textLeft"><label class="textInfo" for="server_file"><i class="icon-info-sign"></i> 请指定服务器日志文件名</label></div>
			<div style="margin: 5px 0 10px 0;">
				<input type="text" id="server_file" class="text" value="processall.log" title="服务器日志文件名" />
			</div>
			<div class="textLeft"><label for="txtSkipDateServer" class="textInfo"><i class="icon-time"></i> 日志开始时间(格式2008-08-08 08:08:08,888)</label></div>
			<div style="margin:5px 0 10px 0;">
				<input type="text" name="skipdate" id="txtSkipDateServer" class="text" title="日志导入开始时间，解决日志重复导入" placeholder="缺省导入全部日志"></input>
			</div>
			<div class="divButton">
				<div class="floatLeft">
					<input type="checkbox" name="server-trunc" value="true" id="cbxCleanServer" class="checkbox" />
 					<label for="cbxCleanServer" class="checkboxErrorLabel">删除已上传日志</label> 
 				</div>
 				<div class="floatRight">
					<powersi:button id="btUploadServerFile" onclick="uploadServerFile()" key="button_import" title="导入指定日志文件名的服务器日志" />
					<powersi:button id="btClearServer" onclick="clearServerLog()" key="button_clean" title="清理指定日志文件名的服务器日志" />
					<powersi:button id="btServerClose" onclick="closeServerDlg()" key="button_close" />
				</div>
			</div>
		</div>
		
		<div id="uploadLocalDlg">
			<div class="textLeft"><label class="textInfo" for="access_file"><i class="icon-info-sign"></i> 请选择本地日志文件</label></div>
			<div style="margin:5px 0 10px 0;">
				<input type="file" name="uploads" id="access_file" class="file" />
			</div>
			<div class="textLeft"><label for="txtSkipDateLocal" class="textInfo"><i class="icon-time"></i> 日志开始时间(格式2008-08-08 08:08:08,888)</label></div>
			<div style="margin:5px 0 10px 0;">
				<input type="text" name="skipdate" id="txtSkipDateLocal" class="text" title="日志导入开始时间，解决日志重复导入" placeholder="缺省导入全部日志"></input>
			</div>
			<div class="divButton">
				<div class="floatLeft">
					<input type="checkbox" name="local-trunc" value="true" id="cbxCleanLocal" class="checkbox" />
 					<label for="cbxCleanLocal" class="checkboxErrorLabel">删除已上传日志</label> 
 				</div>
 				<div class="floatRight">
					<powersi:button id="btUpLoadLocalFile" onclick="uploadLocalFile()" key="button_import" title="导入选定的本地日志文件" />
					<powersi:button id="btLocalClose" onclick="closeLocalDlg()" key="button_close" />
				</div>
			</div>
		</div>
		
		<div id="detailDlg">
			<form id="detailForm">
				<powersi:editorlayout cols="6">
					<powersi:editorlayout-row>
						<powersi:textfield id="detail_func_no" name="func_no" label="日志编号" readonly="true"></powersi:textfield>
						<powersi:textfield id="detail_func_date" name="func_date" label="发生时间" readonly="true"></powersi:textfield>
						<powersi:textfield id="detail_log_level_name" name="log_level_name" label="日志级别" readonly="true"></powersi:textfield>
					</powersi:editorlayout-row>
					<powersi:editorlayout-row>
						<powersi:textfield id="detail_func_totaltime" name="func_id" label="功能号" readonly="true"></powersi:textfield>
						<powersi:textfield id="detail_param_length" name="param_length" label="参数长度" readonly="true"></powersi:textfield>
						<powersi:textfield id="detail_result_length" name="result_length" label="结果长度" readonly="true"></powersi:textfield>
					</powersi:editorlayout-row>
					<powersi:editorlayout-row>
						<powersi:textarea id="detail_func_param" name="func_param" label="请求参数" rows="10" colspan="5" readonly="true"></powersi:textarea>
					</powersi:editorlayout-row>
					<powersi:editorlayout-row>
						<powersi:textarea id="detail_func_result" name="func_result" label="响应结果" rows="10" colspan="5" readonly="true"></powersi:textarea>
					</powersi:editorlayout-row>
				</powersi:editorlayout>
			</form>
		</div>
	</div>
<powersi:script>
	var db = '<%=db %>';
	function showDetail4Time(row, detailPanel,callback) {
		try{
			var suffix = '_' + row['func_no'];
			var rowIndex = gridTime.getRowIndex(row);
			
			//生成form
			var form = $('#detailForm').clone(true).attr('id', 'detail_form' + suffix);
			
			//复制data
			json2form(form, row);
			
			//复制id
			form.find("[id]").each(function(){
				var id = $(this).attr('id');
				var nid = $(this).attr('name') + suffix;
				form.find('label[for="' + id + '"]').attr('for', nid);
				$(this).attr("id", nid);
			});
			
			//处理css
			var $panel = $(detailPanel);
			form.find('table').css({width: $panel.width() - 10, margin: '10px 0 10px 10px'});
			
			//显示form
			$panel.append(form);
		}catch(ex){
			alert(ex.message);
		}
	}
	
	function dblClickRow4Time(data, rowid, rowdata){
		gridTime.toggleDetail(rowdata);
	}
	
	function createDetailGridOption(){
		<powersi:datagrid id="gridOption" url="${rootPath }/manager/FuncMonitor!getRunPerform.action?type=time&db=${db }"
			isScroll="false" pageSize="10" frozen="false" delayLoad="true" useCount="false"
			rowAttrRender="gridRowRender" onDblClickRow="dblClickRow4CallerDetail"
			showExportExcel="true" exportFileName="'功能运行时间'">
			<powersi:datagrid-column display="功能编号" name="func_no" width="150" hide="true" />
			<powersi:datagrid-column display="日志级别" name="log_level_name" width="80" code="log_level" data="log_level" hide="true" />
			<powersi:datagrid-column display="发生时间" name="func_date" width="150" />
			<powersi:datagrid-column display="功能号"   name="func_id" width="150" />
			<powersi:datagrid-column display="请求参数" name="func_param" width="50%" isSort="false" render="renderXml" />
			<powersi:datagrid-column display="响应结果" name="func_result" width="50%" isSort="false" render="renderXml" />
			<powersi:datagrid-column display="参数长度" name="param_length" width="100" format="{0,number,###,###,###}" />
			<powersi:datagrid-column display="结果长度" name="result_length" width="100" format="{0,number,###,###,###}" />
		</powersi:datagrid>
		
		return gridOption;
	}
	
	function showDetail4Caller(row, detailPanel, callback) {
		    var div = document.createElement('div');
		    var width = $(detailPanel).append(div).width() - 15;

			var gridOption = createDetailGridOption();
		    gridOption['width'] = width;
		    
		    var json = form2json('#queryForm');
		    json['func_id'] = '"' + row['func_id'] + '"';
		    gridOption['parms'] = json;
		    
		    var grid = $(div).ligerGrid(gridOption);
		    $(div).wrap('<div style="margin:10px"></div>');

		    grid.refreshSize();
		    grid.reload(true);
	}
		
	function dblClickRow4Caller(data, rowid, rowdata){
		gridCaller.toggleDetail(rowdata);
	}
	
	function showDetail4Date(row, detailPanel, callback) {
		    var div = document.createElement('div');
		    var width = $(detailPanel).append(div).width() - 15;

			var gridOption = createDetailGridOption();
		    gridOption['width'] = width;
		    
		    var json = form2json('#queryForm');
		    json['begin_date'] = row['func_date'] + ':00';
		    json['end_date'] = row['func_date'] + ':59';
		    gridOption['parms'] = json;
		    
		    var grid = $(div).ligerGrid(gridOption);
		    $(div).wrap('<div style="margin:10px"></div>');

		    grid.refreshSize();
		    grid.reload(true);
	}
		
	function dblClickRow4Date(data, rowid, rowdata){
		gridDate.toggleDetail(rowdata);
	}
	
	var dlgDetail = null;
	function dblClickRow4CallerDetail(data, rowid, rowdata) {
		json2form('#detailForm', data);
		
		if(dlgDetail){
			dlgDetail.show();
		} else{
			dlgDetail = popupDiv("#detailDlg", '详细信息', 800, {showMax: true});
		}
	}
</powersi:script>
<script type="text/javascript">
	function renderXml(row, index, value) {
		return htmlEscape(value);
	}
	
	function gridRowRender(rowdata, rowid){
		if (rowdata['log_level'] >= '4') {
			return getColorStyle('error');
		}
	}
	
	function uploadLocalFile() {
		var fileName = $('#access_file').val();
		if(powersi.isempty(fileName)){
			alert("请选择要导入的本地日志文件");
			return;
		}
		
		if(confirm("您确认导入文件" + fileName + "吗?") != true){
			return;
		}
		
		showRunning(true);
		var fileUpload = $('#access_file');
		fileUpload.fileupload({
	        url: rootPath + "/manager/FuncMonitor!importLogFile.action",
	        formData: {'type': 'local', 
	        	'clearflag': $('#cbxCleanLocal').prop('checked') ? 'true' : 'false',
	        	'db': db, 
	    	    'skipdate': $('#txtSkipDateLocal').val()
	        },
	        dataType: 'json',
	        autoUpload: false,
	        replaceFileInput: false,
	        done: function (e, data) {
	        	if(data.result.errortype == "0"){
	        		//成功后重置input file
	        		fileUpload.fileupload("destroy");
	        		fileUpload[0].outerHTML = fileUpload[0].outerHTML;
	        	}
	        	
	            showPageError(data.result);
	        },
	        fail: function (e, data) {
	            showPageError(data.message);
	        }
	    });
		
		closeLocalDlg();
		
		fileUpload.fileupload('send', {
	        fileInput: fileUpload
	    }).complete(function (result, textStatus, jqXHR) {showRunning(false);});
	}
	
	function uploadServerFile() {
		var access_file = $('#server_file').val();
		if (access_file == "") {
			alert("请输入服务器日志文件名");
			return;
		}
		
		closeServerDlg();
		
		postAjax(rootPath + "/manager/FuncMonitor!importLogFile.action", {
				"type":"server", 
				"filename": access_file, 
				'clearflag': $('#cbxCleanServer').prop('checked') ? 'true' : 'false',
				'db': db,
				'skipdate': $('#txtSkipDateServer').val()
				}, 
				function(json){ showPageError(json);}
		);
	}
	
	function clearServerLog() {
		var access_file = $('#server_file').val();
		if (access_file == "") {
			alert("请输入服务器日志文件名");
			return;
		}
		
		if(!confirm('您确认清理服务器日志文件吗？')){
			return;
		}
		
		postAjax(rootPath + "/manager/FuncMonitor!clearPerform.action", {"filename":access_file, "db": db}, function(json){
			alert(json.message);
		});
	}
	
	function viewResult() {
		if(!checkForm('#queryForm')){
			return;
		}
		
		var json = form2json('#queryForm');
		gridTime.setParms(json);
		gridCaller.setParms(json);
		gridDate.setParms(json);
		
		gridTime.reset();
		gridCaller.reset();
		gridDate.reset();
		
		gridTime.reload(true);
		gridCaller.reload(true);
		gridDate.reload(true);
	}
	
	function clearDatabaseLog() {
		if(!confirm('您确认清理数据库日志吗？')){
			return;
		}
		
		postAjax(rootPath + "/manager/FuncMonitor!clearPerform.action", {"db": db}, function(json){
			alert(json.message);
		});
	}
	
	var dlgServer = null;
	function closeServerDlg(){
    	if(dlgServer){
    		dlgServer.hide();
    	}
    }
	
	function openServerDlg(){
		if(dlgServer){
			dlgServer.show();
		} else {
			dlgServer = popupDiv("#uploadServerDlg", '导入服务器文件', 350);			
		}
	}
	
	var dlgLocal = null;
	function closeLocalDlg(){
    	if(dlgLocal){
    		dlgLocal.hide();
    	}
    }
	
	function openLocalDlg(){
		if(dlgLocal){
			dlgLocal.show();
		} else{
			dlgLocal = popupDiv("#uploadLocalDlg", '导入本地文件', 350);			
		}
	}
</script>
</body>
</powersi:html>