<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.semi2.member.*" %>
<%@ page import="com.semi2.board.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*" %>

<%
    try {
        request.setCharacterEncoding("UTF-8");

        // 파일 저장 경로 설정 -> 상대경로변경
        String savepath = request.getRealPath("/recordimg");

        // multipart 형식이 아니면 오류 처리
        if (request.getContentType() == null || !request.getContentType().toLowerCase().startsWith("multipart/")) {
            throw new Exception("잘못된 요청입니다. 파일 업로드 형식이 아닙니다.");
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
        if (content == null || content.trim().isEmpty()) {
            // 만약 content가 null이거나 빈 문자열이라면 에러 메시지 출력
            out.println("<script>alert('게시글 내용을 작성해 주세요.');history.back();</script>");
            return;
        }
        
        String writedate = mr.getParameter("writedate");
        String ref_s = mr.getParameter("ref"); // 부모 글의 ref 값
        String fileaddr = mr.getFilesystemName("fileaddr"); // 업로드된 실제 파일명

        // null 체크 후 파싱
        int midx = (midx_s != null) ? Integer.parseInt(midx_s) : 0; // 기본값 0 설정
        int idx = (idx_s != null) ? Integer.parseInt(idx_s) : 0;   // 기본값 0 설정
        int ref = (ref_s != null) ? Integer.parseInt(ref_s) : 0;   // 기본값 0 설정

        // 로그인 세션 확인
        MemberDTO mdto = (MemberDTO) session.getAttribute("smdto");
        if (mdto == null) {
            throw new Exception("로그인이 필요합니다.");
        }

        midx = mdto.getMidx();
        idx = mdto.getIdx();

        // DAO 호출하여 DB에 등록
        TBoardDAO bdao = TBoardDAO.getInstance();
        boolean result = bdao.insertBoard(midx, idx, category, title, name, pwd, content, writedate, fileaddr, ref);  // ref 값 추가

        if (result) {
            out.println("<script>alert('게시글이 성공적으로 등록되었습니다.'); location.href='tBoardList.jsp';</script>");
        } else {
            throw new Exception("게시글 등록에 실패했습니다.");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error: " + e.getMessage() + "'); history.back();</script>");
    }
%>