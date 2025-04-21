<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.semi2.board.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>

<%
request.setCharacterEncoding("UTF-8");

// 파일 저장 경로 (서버 절대경로)
String savepath = "C:/java_studyhistory/java_semi2_AcademicManage/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/semi2_AcademicManage/teacher/files";

// multipart 형식이 아니면 오류 처리
if (request.getContentType() == null || !request.getContentType().toLowerCase().startsWith("multipart/")) {
%>
    <script>
        alert("잘못된 요청입니다. 파일 업로드 형식이 아닙니다.");
        history.back();
    </script>
<%
    return;
}

// MultipartRequest로 파라미터 처리
MultipartRequest mr = new MultipartRequest(request, savepath, 1024*1024*100, "utf-8");

// 파라미터 받기
String midx_s = mr.getParameter("midx");
String idx_s = mr.getParameter("idx");
String category = mr.getParameter("category");
String title = mr.getParameter("title");
String name = mr.getParameter("name");
String pwd = mr.getParameter("pwd");
String content = mr.getParameter("content");
String writedate = mr.getParameter("writedate");
String fileaddr = mr.getFilesystemName("fileaddr"); // 업로드된 실제 파일명

int midx = 0;
int idx = 0;
try {
    midx = Integer.parseInt(midx_s);
    idx = Integer.parseInt(idx_s);
} catch (Exception e) {
%>
    <script>
        alert("회원 정보가 유효하지 않습니다. 로그인 후 다시 시도해주세요.");
        history.back();
    </script>
<%
    return;
}

// DAO 호출하여 DB에 등록
TBoardDAO bdao = TBoardDAO.getInstance();
boolean result = bdao.insertBoard(midx, idx, category, title, name, pwd, content, writedate, fileaddr);
%>

<%
if (result) {
%>
    <script>
        alert("게시글이 성공적으로 등록되었습니다.");
        location.href = "tBoardList.jsp";
    </script>
<%
} else {
%>
    <script>
        alert("게시글 등록에 실패했습니다.");
        history.back();
    </script>
<%
}
%>