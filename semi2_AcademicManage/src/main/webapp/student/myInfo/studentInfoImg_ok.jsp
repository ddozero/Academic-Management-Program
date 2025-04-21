<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*, java.io.*, java.util.*, com.semi2.member.*" %>
<%
	SMemberDAO mdao = new SMemberDAO();

	String savepath = application.getRealPath("/img/");
	MultipartRequest mr = new MultipartRequest(request, savepath, 1024*1024*10, "UTF-8");
	
	String idx_s = mr.getParameter("idx");
	int idx = Integer.parseInt(idx_s);
	
	
	String imgname = mr.getFilesystemName("img");
	
	int result = mdao.stuImg(idx, imgname);
	
%>
<script>
    window.opener.location.reload();
    window.close();
</script>
