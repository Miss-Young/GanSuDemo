<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib prefix="powersi" uri="http://www.powersi.com.cn/tags"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<powersi:html>
<head>
<powersi:head title="dubbo����" />
<script type="text/javascript">
	function callChuangZhi(method){
	
		postAjax(rootPath + "/sample/Sample!callChuangZhi.action", {
			"method": method,
			"text": $("#okText1").val()
		}, function(ret){
			if(checkResult(ret)) {
				//alert(powersi.tostring(ret.data));
				if(ret.data.hasOwnProperty("aac001")){
					  $.each(ret.data,
				    	      function(key, value) {
				    	        if($("#"+key).length > 0){ 
				    	           $("#"+ key).val(value);
				    	         }
					         } 
				     
				      );
				}else{
				 	var i=0;
				 	var str="<tr>";
				     $.each(ret.data,
				    	      function(key, value) {
				    	         $("#txtab>tbody tr").remove();
				    	         str =  str+"<td class=\"tdLabel\"><label class=\"textLabel\"><span>"+ key +"</span></label></td>" 
				    	        		      + "<td class=\"tdInput\"><input type=\"text\" value="+value+" class=\"text\"/></td>";
				                  i++;
				    	         if(i%2==0){
				    	        	 str =  str+"</tr>";
				    	         }
				    	      }
				     
				     );
			         $('#txtab>tbody').append(str+"</tr>");
				}
				
				callInsure();
			}
		});
	}
	
	function callInsure() {
			var	aae140 = 'ְ�����ҽ�Ʊ���';
			var	aac049 = '2016-03-20';
			var	aac066 = '��ְ��Ա ';
			var	aac031 = '�����α�';
			var	aaa027 = '�����б���';
			var	aab069 = '���������ػ�е�豸���޹�˾';
			var	aae100 = '��Ч';
   	    $("#row>tbody tr").remove();
		$('#row tr').remove('.empty');
		$('#row>tbody').append("<tr><td>"+ aae140 +"</td><td>"
				+ aac049+ "</td><td>"
				+ aac066 + "</td><td>"
				+ aac031 + "</td><td>"
				+ aaa027 + "</td><td>"
				+ aab069 + "</td><td>"
				+ aae100 + "</td></tr>");
	}
	
</script>
</head>
<body>
	<powersi:groupbox title="��ѯ����">
			<powersi:editorlayout cols="6">
				<td class="tdInput" colspan="4"><input type="text" id="okText1"  style="" placeholder="�����ı�" /></td>
				<td class="tdInput" colspan="1"><input type="button" value="��ѯneusoft" class="button" onclick="callChuangZhi('neusoft')" /></td>
			</powersi:editorlayout>
	</powersi:groupbox>
	
	<br />
	 <powersi:tabbedpanel id="divTabs">
			<powersi:tab id="tab1" target="divTab1" label="������Ϣ" />
			<powersi:tab id="tab2" target="divTab2" label="�α���Ϣ" />
			<div id="divTab1">	
			   <powersi:groupbox title="��Ա��Ϣ">
			
				<powersi:editorlayout cols="4" id="txtab">
					<tr>
						<powersi:textfield name="personBaseInfo.aac001" key="���˵��Ժ�" id="aac001"></powersi:textfield>
						<powersi:textfield name="personBaseInfo.aac012gz" id="aac012" key="�������"></powersi:textfield>
					</tr>
					<tr>
						<powersi:textfield name="personBaseInfo.aab001" key="��λ���Ժ�" id="aab001"></powersi:textfield>
						<powersi:textfield name="personBaseInfo.aab069" key="��λ����" id="aab069"></powersi:textfield>
					</tr>
					<tr>
						<powersi:textfield name="personBaseInfo.aac002" id="aac002"
							required="true" key="��ᱣ�Ϻ���"></powersi:textfield>
						<powersi:textfield name="personBaseInfo.aac058" required="true"
							 id="aac058" key="֤������"></powersi:textfield>
					</tr>
					<tr>
						<powersi:textfield name="personBaseInfo.aac003" id="aac003"
							required="true" key="����"></powersi:textfield>
						<powersi:textfield name="personBaseInfo.aac006" id="aac006" onblur="calcAge()"
							required="true" maxlength="40" key="��������" mask="date"></powersi:textfield>
					</tr>
					<tr>
						<powersi:textfield name="personBaseInfo.aac004" id="aac004"
							required="true" key="�Ա�"></powersi:textfield>
						<powersi:textfield name="personBaseInfo.aac009" required="true"
							id="aac009"  key="��������"></powersi:textfield>
					</tr>
		
					<tr>
		
		
						<powersi:textfield name="personBaseInfo.aac010" required="true"
							id="aac010" maxlength="40" key="�������ڵ�ַ  "></powersi:textfield>
						<powersi:textfield name="personBaseInfo.aab401" 
							id="aab401" key="���ڲ���� "></powersi:textfield>
					</tr>
					<tr>
		
						<powersi:textfield name="personBaseInfo.aae004" required="true"
							id="aae004" key="��ϵ������ "></powersi:textfield>
						<powersi:textfield name="personBaseInfo.aae005" 
							id="aae005" key="��ϵ�绰 " validate="phone"></powersi:textfield>
					</tr>
					<tr>
		
						<powersi:textfield name="personBaseInfo.aae006" key="��ַ" id="aae006"></powersi:textfield>
						<powersi:textfield name="personBaseInfo.aae007" key="��������  " id="aae007"
							maxlength="6"></powersi:textfield>
					</tr>
					
					<tr>
						<powersi:textfield name="personBaseInfo.aac016" 
							id="aac016" key="��ҵ״̬  "></powersi:textfield>
						<powersi:textfield mask="date" name="personBaseInfo.aac007" id="aac007"
							key="�μӹ�������  "></powersi:textfield>
					</tr>
		
				
					<tr>
		
						<powersi:textfield name="personBaseInfo.aac084s" 
							id="aac084s" key="�����ݱ�־"></powersi:textfield>
		
						<powersi:textfield mask="date" name="personBaseInfo.bac002" id="aic162"
							key="��������"></powersi:textfield>
					</tr>
				
					<tr>
						<powersi:textfield name="personBaseInfo.aac005" 
							id="aac005"  key="����"></powersi:textfield>
						<powersi:textfield name="personBaseInfo.aac020" 
							id="aac020" key="����ְ��(����)"></powersi:textfield>
						
		
		
		
					</tr>
					<tr>
						<powersi:textfield name="personBaseInfo.aaa027" required="true"
							id="aaa027" key="ͳ��������  "></powersi:textfield>
						<powersi:textfield name="personBaseInfo.aae013" key="��ע  " 
							maxlength="40" id="aae013"></powersi:textfield>
						<powersi:hidden name="personBaseInfo.aab301" key="aab301" id="aab301"></powersi:hidden>
					</tr>
					<tr>
						<powersi:textfield name="personBaseInfo.akc021s" required="true"
							id="akc021s" label="ҽ�Ʋ������"></powersi:textfield>
						<powersi:textfield name="personBaseInfo.bac032s" required="true"
							id="bac032s"  label="������Ա��־"></powersi:textfield>
					</tr>
					<tr>
						<powersi:textfield name="personBaseInfo.bac021_n" key="bac021_n" 
							maxlength="40" id="bac021_n" label="������ͬ�ɷ�����"></powersi:textfield>
					</tr>
					
				</powersi:editorlayout>
		
		
	          </powersi:groupbox>
		   </div>
		   <div id="divTab2">
		   <powersi:groupbox title="�α�������Ϣ">
				<display:table export="true" name="perInsuredList" id="row" requestURI="personaIntegratedQueryAction!perInsuredQuery.action">
						<display:column property="aae140"  titleKey="��������" sortable="true"/>
						<display:column property="aac049"  title="�״βα�����"  format="{0,date,yyyy-MM-dd }"  sortable="true"/>
						<display:column property="aac066"   titleKey="�α����" sortable="true" />
						<display:column property="aac031"    titleKey="���˽ɷ�״̬" sortable="true" />
						<display:column property="aaa027"    titleKey="ͳ��������" sortable="true" />
						<display:column property="aab069"  titleKey="��λ����"  /> 
						<display:column  property="aae100" value="��Ч" title="����״̬"  sortable="true" />
				</display:table>
			</powersi:groupbox>
		   </div>
	  </powersi:tabbedpanel>
	<powersi:errors />
</body>
</powersi:html>