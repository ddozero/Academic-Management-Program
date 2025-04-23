<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.semi2.member.*" %>
<%@ page import="com.semi2.board.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>

<%
request.setCharacterEncoding("UTF-8");

// 파일 저장 경로 설정 -> 상대경로변경
String savepath = request.getRealPath("/recordimg");

MultipartRequest mr = new MultipartRequest(request, savepath, 1024*1024*100, "utf-8"); // 100MB 제한

// 파라미터 받기
String ref_s = mr.getParameter("ref");
String lev_s = mr.getParameter("lev");
String sunbun_s = mr.getParameter("sunbun");

String category = mr.getParameter("category");
String title = mr.getParameter("title");
String name = mr.getParameter("name");
String pwd = mr.getParameter("pwd");
String content = mr.getParameter("content");
String writedate = mr.getParameter("writedate");
String fileaddr = mr.getFilesystemName("fileaddr"); // 파일명만 저장
String secret = mr.getParameter("secret");

// 로그인 세션 확인
MemberDTO mdto = (MemberDTO)session.getAttribute("smdto");
if (mdto == null) {
%>
    <script>
        alert("로그인이 필요합니다.");
        location.href = "/semi2_AcademicManage/server/index.jsp";
    </script>
<%
    return;
}
int midx = mdto.getMidx();
int idx = mdto.getIdx();

// 파일 경로 로그 추가
System.out.println("업로드된 파일 경로: " + fileaddr);

// 파싱
int ref = Integer.parseInt(ref_s);
int lev = Integer.parseInt(lev_s);
int sunbun = Integer.parseInt(sunbun_s);

// DAO 처리
TBoardDAO bdao = TBoardDAO.getInstance();
bdao.updateSunbun(ref, sunbun); // 기존 답글 밀기

// 답글 insert
boolean result = bdao.insertReply(
    midx, idx, category, title, name, pwd,
    content, writedate, fileaddr, secret,
    ref, lev + 1, sunbun + 1
);

if (result) {
%>
    <script>
        alert("답글이 등록되었습니다.");
        location.href = "tBoardList.jsp";
    </script>
<%
} else {
%>
    <script>
        alert("답글 등록에 실패했습니다.");
        history.back();
    </script>
<%
}
%>