<%@ tag pageEncoding="GBK" body-content="empty" small-icon=""
	display-name="ҽ�Ʒ�����ϸ��Ϣ" description="ҽ�Ʒ�����ϸ��Ϣ"%>
<%@ taglib prefix="s" uri="http://www.powersi.com.cn/tags"%>
<script type="text/javascript">
	var centerId = '439900';
	var actionUrl = rootPath
			+ '/medicarebiz/FeeInfoAction!queryCatalog.action?centerid='
			+ centerId + '&searchType=py';
	jQuery(document).ready(function() {
		$("#stext").combogrid({
			minLength : 1,
			autoChoose : false,
			searchIcon : true,
			alternate : true,
			width : '600px',
			url : actionUrl,
			colModel : [ {
				'columnName' : 'ake003n',
				'width' : '10',
				'label' : '��Ŀ�ȼ�'
			}, {
				'columnName' : 'ake001',
				'width' : '20',
				'label' : '����'
			}, {
				'columnName' : 'ake002',
				'width' : '30',
				'label' : '����'
			}, {
				'columnName' : 'bka052n',
				'width' : '15',
				'label' : '����'
			}, {
				'columnName' : 'bke213',
				'width' : '10',
				'label' : '���'
			}, {
				'columnName' : 'aae013',
				'width' : '15',
				'label' : '��ע'
			} ],
			select : function(event, ui) {
				var data = ui.item;
				$("#ake001").val(data["ake001"]);//�籣ID
				$("#ake006").val(data["ake002"]);//�籣Ŀ¼���� 
				$("#aka063").val(data["aka063"]);//��Ŀ���
				$("#ake003").val(data["ake003"]);//�շѵȼ�
				$("#bka052").val(data["bka052"]);//����
				$("#ake003").val(data["ake003"]);//Ŀ¼���
				$("#bka054").val(data["bke213"]);//���
				$("#bka054").val(data["bke213"]);//���
				$("#aka069").val(data["aka057"]);//���Ը�����(����)
				$("#bke215").val(data["bke215"]);//���Ը�����
				$("#bka056").focus();
				return false;
			},
			showGrid : function() {
				$('#dw_cash_hospital').hide();
			},
			hideGrid : function() {
				$('#dw_cash_hospital').show();
			}
		});
		$("#querykey").focus();
	});

	//ȡ��ǰʱ�䣬��ʽΪ,yyyy-mm-dd hh:mm:ss
	function GetDate() {
		var d, s;
		d = new Date();
		s = d.getFullYear() + "-"; //ȡ���
		if (d.getMonth() + 1 < 10) {
			s = s + "0" + (d.getMonth() + 1) + "-";//ȡ�·�
		} else {
			s = s + (d.getMonth() + 1) + "-";//ȡ�·�
		}

		if (d.getDate() < 10) {
			s += "0" + d.getDate() + " "; //ȡ����
		} else {
			s += d.getDate() + " "; //ȡ����
		}
		s += d.getHours() + ":"; //ȡСʱ
		if (d.getMinutes() < 10) {
			s += "0" + d.getMinutes() + ":"; //ȡ��
		} else {
			s += d.getMinutes() + ":";
		}
		if (d.getSeconds() < 10) {
			s += "0" + d.getSeconds();
		} else {
			s += d.getSeconds(); //ȡ��
		}
		return (s);
	}

	//ɾ��������Ϣ
	function deleteFee() {
		var ll_currow;
		ll_currow = document.all.dw_cash_hospital.getrow();
		if (ll_currow > 0) {
			if (confirm("�Ƿ�ɾ����ǰ��¼?") == true) {
				document.all.dw_cash_hospital.deleterow(ll_currow);
			}
		}
	}

	function insert_dw(para) {

		if (event.keyCode == '13') {
			try {
				var e = window.event || event;
				if (window.event) {
					e.cancelBubble = true;
				} else {
					e.stopPropagation();
				}
				event.returnValue = false;
			} catch (ex) {
			}

			var filed_name = para.id;
			if ('bka058' == filed_name) {

				if ($("#ake001").val() == '') {
					alert("δ¼��ҩƷ��");
					return;
				}
				if ($("#bka058").val() == '') {
					alert("δ¼���");
					return;
				}
				
				if(parseFloat($("#bka058").val())<=0){
					alert("����С��0��");
					return;
				}
				
				var ll_row = 0;
				if (isNaN($("#bka058").val()) * 1) {
					alert("�����������");
					document.all.bka058.focus();
					return;
				}
				if ($("#aka063").find("option:selected").val() == '017'
						&& $("#akc226").val() == 0) {
					alert('��λ�ѱ���¼��������')
					document.all.akc226.focus();
					return;
				}

				var input_ver = $("#bka058").val();
				item_code = $("#ake001").val();
				for (i = 0; i <= document.all.dw_cash_hospital.rowcount(); i++) {
					item_code_temp = document.all.dw_cash_hospital.getitemstring(
							i, "ake001", 0, true);
				}
				if (ll_row <= 0) {
					ll_row = document.all.dw_cash_hospital.InsertRow(0);
				}

				var ake003n = $("#ake003").find("option:selected").text();
				var ake003c = $("#ake003").find("option:selected").val();
				var aka063n = $("#aka063").find("option:selected").text();
				var aka063c = $("#aka063").find("option:selected").val();
				var ake003n = $("#ake003").find("option:selected").text();
				var ake003c = $("#ake003").find("option:selected").val();

				if ($("#akc226").val() == '') {
					document.all.dw_cash_hospital.setitem(ll_row, "akc226",
							parseFloat("0.00")); //����(akc226)
				} else {
					document.all.dw_cash_hospital.setitem(ll_row, "akc226",
							parseFloat($("#akc226").val())); //����(akc226)
				}

				document.all.dw_cash_hospital.setitem(ll_row, "ake003", ake003c); //Ŀ¼�ȼ�(ake003)
				document.all.dw_cash_hospital.setitem(ll_row, "ake003n", ake003n); //Ŀ¼�ȼ�����(ake003)
				document.all.dw_cash_hospital.setitem(ll_row, "aka063", aka063c); //����(aka063)
				document.all.dw_cash_hospital.setitem(ll_row, "aka063n", aka063n); //��������(aka063)
				/* document.all.dw_cash_hospital.setitem(ll_row, "ake003", ake003c);//����Ŀ¼��� (ake003)
				document.all.dw_cash_hospital.setitem(ll_row, "ake003n", ake003n);//����Ŀ¼��� ����(ake003) */
				document.all.dw_cash_hospital.setitem(ll_row, "ake006", $("#ake006").val()); //ҽ�ƻ���Ŀ¼����(ake006)
				document.all.dw_cash_hospital.setitem(ll_row, "bka052", $("#bka052").val()); //����(bka052)

				document.all.dw_cash_hospital.setitem(ll_row, "bka054", $("#bka054").val()); //���(bka054)
				document.all.dw_cash_hospital.setitem(ll_row, "bka058",input_ver * 1.0000); //���  (aae019)
				
				document.all.dw_cash_hospital.setitem(ll_row, "bka056",parseFloat($("#bka056").val())); //����
				document.all.dw_cash_hospital.setitem(ll_row, "bka057",parseFloat($("#bka057").val())); //����

				document.all.dw_cash_hospital.setitem(ll_row, "aka069", $("#aka069").val());//�Ը�����(aka069) 
				document.all.dw_cash_hospital.setitem(ll_row, "ake001", $("#ake001").val());//�籣Ŀ¼ id(aaz277)

				document.all.dw_cash_hospital.setitem(ll_row, "bke215", $("#bke215").val());//�Ը����� defray_type
				document.all.dw_cash_hospital.setitem(ll_row, "bka051", GetDate());//���÷���ʱ��
				document.all.dw_cash_hospital.accepttext();
				document.all.dw_cash_hospital.scrolltorow(ll_row);
				document.all.dw_cash_hospital.SetRow(ll_row);
				$("#stext").focus();
				$("#stext").val("");

				$("#ake006").val("");
				$("#aka063").val("");
				$("#bka052").val("");
				$("#bka054").val("");
				$("#bka056").val("");
				$("#bka057").val("");
				$("#bka058").val("");
				$("#aka069").val("");

				$("#btnSave").attr("disabled", true);
				$("#btnCalc0").attr("disabled", false);
			}
		}
	}

	function changeSearchType(sel) {
		actionUrl = rootPath
				+ '/medicarebiz/FeeInfoAction!queryCatalog.action?centerid='
				+ centerId + '&searchType=' + sel.value + '&bka035=0';
		$("#stext").combogrid("option", "url", actionUrl);

	}
	function selectall(obj) {
		/* obj.select(); */
	}

	function checkbiz() {
		if ($("#aac001").val() == '' || $("#aac001").val() == -1) {
			alert("����ȷ¼��ҵ����Ϣ����¼����á�");
			return $("#queryString").focus();
		}
	}

	function dealkeydown(para) {
		if (event.keyCode == '13') {
			try {
				var e = window.event || event;
				if (window.event) {
					e.cancelBubble = true;
				} else {
					e.stopPropagation();
				}
				event.returnValue = false;
			} catch (ex) {
			}

			var filed_name = para.id;

			if ('bka056' == filed_name) {
				var bka056 = $("#bka056").val();
				
				if(isNaN(bka056)){
					alert("���۲���Ϊ�ַ���");
					return $("#bka056").focus();
				}
				
				if (bka056 !== '') {
					if(parseFloat(bka056)<=0){
						alert("���۲���С��0��");
						return $("#bka056").focus();
					}
				}
				return $("#bka057").focus();
			}
			if ('bka057' == filed_name) {
				var bka056 = $("#bka056").val();
				var bka057 = $("#bka057").val();

				if(isNaN(bka057)){
					alert("��������Ϊ�ַ���");
					return $("#bka057").focus();
				}
				
				if (bka057 !== '') {
					if(parseFloat(bka057)<=0){
						alert("��������С��0��");
						return $("#bka057").focus();
					}
				}
				
				if (bka057 !== '' && bka056 !== '') {
					$("#bka058").val(parseFloat(bka057) * parseFloat(bka056));
				}
				return $("#bka058").focus();
			}
			
			if('em_jsq' == filed_name){
				var em_jsq = $("#em_jsq").val();
				var st_xjzf = $("#st_xjzf").val();
				if(isNaN(em_jsq)){
					alert("����Ϊ�ַ���");
					return $("#em_jsq").focus();
				}
				if(parseFloat(em_jsq)<=0){
					alert("����С��0��");
					return $("#em_jsq").focus();
				}

				$("#st_out").val( (parseFloat(em_jsq)-parseFloat(st_xjzf)).toFixed(2) );
			}
		}
	}
</script>
<s:groupbox title="������Ϣ">
	<s:editorlayout cols="14">
		<tr>
			<td><select id="sidx" onchange='changeSearchType(this)'
				style="width: auto;">
					<option value="py">��ƴ��</option>
					<option value="wb">�����</option>
					<option value="name">����</option>
					<option value="code">����</option>
			</select></td>
			<td colspan="2"><input type="text" class="text" id="stext" value="" onfocus="checkbiz()" maxlength="30" style="width: 90%;" /></td>
			<s:hidden id="ake001" key="���Ŀ¼id" name="ake001"/>
			<s:textfield id="ake006" label="ҩƷ����" colspan="2" disabled="true" />
			<s:codeselect codeType="aka063" id="aka063" key="aka063" disabled="true" />
			<%-- <s:codeselect codeType="ake003" id="ake003" key="ake003" disabled="true" />
			<s:codeselect codeType="ake003" id="ake003" key="ake003" disabled="true" /> --%>
		</tr>
		<tr>
			<s:codeselect codeType="bka052" id="bka052" key="����" readonly="true" />
			<!--<s:textfield id="bka052" key="����" /> -->
			<s:textfield id="bka054" key="���" readonly="true" name="bka054"/>
			<s:textfield id="bka056" key="����" onkeydown="dealkeydown(this)" name="bka056" />
			<s:textfield id="bka057" key="����" onkeydown="dealkeydown(this)" name="bka057" />
			<s:textfield id="bka058" onfocus="selectall(bka058);" key="���" onkeydown="insert_dw(this)" name="bka058"/>
			<s:textfield id="aka069" key="�Ը�����" readonly="true" name="bka069"/>
			<s:hidden id="bke215" key="֧������" name="bke215"/>
			<td>
			<s:button key="button_ok" id="btn_enter" onclick="insert_dw()" />
			</td><td>
			<s:button key="button_delete" id="btn_delete" onclick="deleteFee()" />
			</td>
		</tr>
	</s:editorlayout>
</s:groupbox>


	<table class="table_frame">
		<div style="height: 130px;">
			<s:datawindow id="dw_cash_hospital" value="datafee" height="150" groupCalc="groupCalc" name="dw_cash_hospital" clicked="sortClicked;selectClicked;checkboxClicked;" />
		</div>
	</table>
	<s:hidden id="feeinfo" name="feeinfo" />

