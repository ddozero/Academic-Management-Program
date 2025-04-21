<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi2.board.*" %>
<%@ page import="com.semi2.member.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>

<%
request.setCharacterEncoding("UTF-8");

// 파일 업로드 처리
String savepath = "C:/java_studyhistory/java_semi2_AcademicManage/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/semi2_AcademicManage/teacher/files";
MultipartRequest mr = new MultipartRequest(request, savepath, 1024 * 1024 * 50, "utf-8");  // 50MB까지 허용

// 파라미터 받기
int boardidx = Integer.parseInt(mr.getParameter("boardidx"));
String title = mr.getParameter("title");
String content = mr.getParameter("content");
String pwd = mr.getParameter("pwd");
String fileaddr = mr.getFilesystemName("fileaddr");  // 업로드된 파일명

// 로그인 사용자 정보 확인
MemberDTO mdto = (MemberDTO) session.getAttribute("smdto");
if (mdto == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "/semi2_AcademicManage/server/index.jsp";
</script>
<%
    return;
}

// 기존 게시글 정보 불러오기
TBoardDAO bdao = TBoardDAO.getInstance();
BoardDTO bdto = bdao.getBoardContent(boardidx);

// 작성자 확인
if (!bdto.getName().equals(mdto.getName())) {
%>
<script>
    alert("작성자만 수정할 수 있습니다.");
    history.back();
</script>
<%
    return;
}

// 파일이 새로 업로드되지 않았으면 기존 값 유지
if (fileaddr == null || fileaddr.trim().equals("")) {
    fileaddr = bdto.getFileaddr();
}

// 수정 처리
boolean result = bdao.updateBoard(boardidx, title, content, pwd, fileaddr);

if (result) {
%>
<script>
    alert("수정 완료되었습니다.");
    location.href = "tBoardContent.jsp?boardidx=<%=boardidx%>";
</script>
<%
} else {
%>
<script>
    alert("수정 실패했습니다.");
    history.back();
</script>
<%
}
%>