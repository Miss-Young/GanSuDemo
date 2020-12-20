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
				  $.each(ret.data,
			    	      function(key, value) {
			    	        if($("#"+key).length > 0){ 
			    	           $("#"+ key).val(value);
			    	         }
				         } 
			     
			      );
				
				//callInsure();
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
				<td class="tdInput" colspan="1"><input type="button" value="��ѯ" class="button" onclick="callChuangZhi('queryInjury')" /></td>
			</powersi:editorlayout>
	</powersi:groupbox>
	
	<br />
	  <powersi:groupbox title="�¹���Ϣ">
            <powersi:div id="accshow">
              <powersi:editorlayout cols="8">
                <tr>
                  <powersi:textfield name="lc31.aab001" id="aab001" key="��λ���Ժ�"
                    disabled="true"></powersi:textfield>
                  <powersi:textfield name="lc31.aab004" id="aab069" label="��λ����"
                    disabled="true" colspan="5"></powersi:textfield>
                </tr>
                <tr>
                  <powersi:textfield name="lca2.alc020" id="alc020"
                    disabled="true" key="���˷���ʱ��  " mask="datetime"></powersi:textfield>
                  <powersi:textfield name="lca2.alc026" id="alc026"
                    disabled="true" key="��������" mask="date"></powersi:textfield>
                  <powersi:textfield name="lca2.ala028" id="ala028"
                    disabled="true" codeType="ala028" key="�¹����  "></powersi:textfield>

                </tr>
                <tr>
                  <powersi:textfield name="lca2.plc105" id="plc105"
                    disabled="true" codeType="plc105" key="���淽ʽ  "></powersi:textfield>
                  <powersi:textfield name="lca2.plk100" id="plk100" key="��������"
                    disabled="true"></powersi:textfield>
                  <powersi:textfield name="lca2.plk101" id="plk101" key="��������"
                    disabled="true"></powersi:textfield>
                  <powersi:textfield name="lca2.plk102" id="plk102" key="�¹ʷ����ص�"
                    disabled="true"></powersi:textfield>
                </tr>
                <tr>
                   <powersi:textarea name="lca2.plc103" colspan="7" id="plc103"
                    disabled="true" key="�¹ʾ�������"></powersi:textarea>
                </tr>
                <tr>
                  <powersi:textfield name="lca2.ala023" id="ala023"
                    disabled="true" codeType="ala023" key="��������  "></powersi:textfield>
                  <powersi:textfield name="lca2.aac042" id="aac042" key="�걨������  "
                    disabled="true"></powersi:textfield>
                  <powersi:textfield name="lca2.aac045" id="aac045" key="�걨�˵绰  "
                    disabled="true" validate="integer"></powersi:textfield>
                  <powersi:textfield name="lca2.aac047" id="aac047" key="�걨���ʱ�  "
                    disabled="true" validate="zipcode"></powersi:textfield>
                </tr>
                <tr>
                  <powersi:textfield name="lca2.aac046" id="aac046" key="�걨�˵�ַ"
                    disabled="true" colspan="8"></powersi:textfield>
                </tr>
              </powersi:editorlayout>
            </powersi:div>
          </powersi:groupbox>
          <powersi:groupbox title="�����걨��Ϣ">
            <powersi:editorlayout cols="6">
              <tr>
                <powersi:textfield name="lc30.aac001" id="aac001" key="���˵��Ժ�"
                  disabled="true"></powersi:textfield>
                <powersi:textfield name="lc30.aac003" id="aac003" key="����"
                  disabled="true"></powersi:textfield>
                <powersi:textfield name="lc30.aac002" id="aac002" key="���֤��"
                  disabled="true"></powersi:textfield>
              </tr>
              <tr>
                <powersi:textfield name="lc30.alc005" id="alc005" key="�����¹����к�"
                  disabled="true"></powersi:textfield>
                <powersi:textfield name="lc30.alc027" disabled="true"
                  id="alc027"  key="�������  "></powersi:textfield>
                <powersi:textfield name="lc30.alc022" id="alc022"
                  disabled="true" codeType="alc022" key="�˺���λ  "></powersi:textfield>
                <powersi:hidden name="lc30.aaz128" id="aaz128"></powersi:hidden>
                <powersi:hidden name="lc30.aac001" id="aac001t"></powersi:hidden>
              </tr>
              <tr id="alcViw">
                <powersi:textfield name="lc30.ala017" id="ala017"
                  disabled="true" codeType="ala017" key="ְҵ��  "></powersi:textfield>
                <powersi:textfield id="alc007" colspan="4" name="lc30.alc007"
                  key="���˾���ҽԺ  " disabled="true" />
                <powersi:hidden id="plc516" name="lc30.plc516"></powersi:hidden>
              </tr>
              <tr>
                <powersi:textfield name="lc30.alc021" id="alc021"
                  disabled="true" codeType="alc021" label="�˺��̶�"></powersi:textfield>
                <powersi:textfield name="lc30.plc563" id="plc563"
                  disabled="true" key="��������"></powersi:textfield>
                <powersi:textfield name="lc30.alc040" id="alc040" key="��������ʧ�٣�����  "
                  disabled="true" mask="date"></powersi:textfield>
              </tr>
              <tr>
                <powersi:textfield name="lc30.aae004" id="aae004" label="��ϵ��"
                  disabled="true"></powersi:textfield>
                <powersi:textfield name="lc30.aae005" id="aae005" label="��ϵ�绰"
                  disabled="true" validate="integer"></powersi:textfield>
                <powersi:textfield name="lc30.aae013" id="aae013" label="��ע"
                  disabled="true"></powersi:textfield>
              </tr>
            </powersi:editorlayout>
          </powersi:groupbox>
          <powersi:groupbox title="�϶����">
            <powersi:editorlayout cols="6"
              cssStyle="width:550;table-layout:fixed;">
              <tr>
                <powersi:textfield name="lc31.alc031" id="alc031"
                  disabled="true" key="�����϶�����  " mask="date"></powersi:textfield>
                <powersi:textfield name="lc31.alc029" id="alc029"
                  disabled="true" codeType="alc029" key="�����϶���־  "></powersi:textfield>
                <powersi:textfield name="lc31.plc553" id="plc553"
                  disabled="true" codeType="plc553" key="��������  "></powersi:textfield>
                <powersi:hidden name="lc31.aaz127" id="aaz127"></powersi:hidden>
              </tr>
              <tr>
                <powersi:textfield colspan="6" name="lc31.ala016"
                  disabled="true" id="ala016" key="�϶��������  "></powersi:textfield>
              </tr>
              <tr>
                <powersi:textfield name="lc31.alc011" id="alc011" key="�϶������  "
                  disabled="true"></powersi:textfield>
                <powersi:textfield name="lc31.aae060" id="aae060" key="��������ҽ���ڿ�ʼʱ��  "
                  mask="date" disabled="true"></powersi:textfield>
                <powersi:textfield name="lc31.aae061" id="aae061" key="��������ҽ���ڽ���ʱ��  "
                  mask="date" disabled="true"></powersi:textfield>
              </tr>

              <tr>
                <powersi:textfield name="lc31.alc030" disabled="true"
                  id="alc030" codeType="alc030" colspan="8" key="�����϶���λ  "></powersi:textfield>

              </tr>
              <tr>
                <powersi:hidden name="lc31.plc901" id="plc901" disabled="true"
                  label="�˲в�������"></powersi:hidden>
                
              </tr>
              <tr>
                <powersi:textarea name="lc31.alc014" id="alc014" key="��Ͻ��� "
                  disabled="true" colspan="5"></powersi:textarea>
              </tr>
              <tr>
                <powersi:textarea name="lc31.plc723" colspan="5" id="plc723"
                  disabled="true" key="�϶����߲����϶���� ͬ�� "></powersi:textarea>
                <powersi:hidden name="lc31.prseno" id="prseno"></powersi:hidden>
              </tr>
            </powersi:editorlayout>
          </powersi:groupbox>
	<powersi:errors />
</body>
</powersi:html>