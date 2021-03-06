<%@page import="com.powersi.hygeia.framework.util.ExceptionHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.powersi.hygeia.framework.util.UtilFunc,com.powersi.hygeia.web.util.WebHelper,com.powersi.hygeia.framework.BusiContext"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误执行反馈</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<style type="text/css" media="all">
.error_body{margin:0; padding:0;font-size:13px;font-family: Tahoma, Verdana, Arial, Helvetica, sans-serif;background: #fff;}
.error_div{padding:15px;text-align:center;}
.error_table{line-height: 26px;border: 1px solid #b7c1ca;text-align: center;color: #555555;margin: auto;width:99%;border-collapse: collapse;table-layout:fixed;}
.error_row{background: #dde6ed;color: #1166bb;border: 1px solid #b7c1ca;}
.error_col{text-align: center;color: #1166bb;}
.error ul {list-style:none;}
.error_line{border-top:1px solid #b7c1ca;}
</style>
</head>
<body class="error_body">
	<div class="error_div">
		<table class="error_table">
			<tbody>
				<tr class="error_row">
					<td align="left">&nbsp;&nbsp;系统异常</td>
				</tr>
				<tr>
					<td class="error_col error">
						<%
							if ("localhost".equals(request.getServerName()) || "127.0.0.1".equals(request.getServerName())
								|| "1".equals(UtilFunc.getString(BusiContext.getUserInfo(),
										"is_developer"))){
								if (request.getAttribute("javax.servlet.error.message") != null) {
									out.println((String) request
											.getAttribute("javax.servlet.error.message"));
								}
		
								if (request.getAttribute("hygeiaErrors") != null) {
									out.println(request.getAttribute("hygeiaErrors"));
								}
								
								String uri = (String) request
										.getAttribute("javax.servlet.error.request_uri");
								if (uri == null) {
									uri = WebHelper.getRequestPath(request);
								}
								out.println("<div class='error_line'></div>");
								out.println(uri);
							} else {
								out.println("<ul><li><span>系统出现异常，请稍候重试...</span></li></ul>");
							}
						%>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>