<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi2.record.*"%>
<%@ page import="com.semi2.member.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Timestamp"%>

<jsp:useBean id="rdto" class="com.semi2.record.RecordDTO"
	scope="request"></jsp:useBean>
<jsp:setProperty name="rdto" property="*" />
<jsp:useBean id="rdao" class="com.semi2.record.TRecordDAO" scope="page"></jsp:useBean>

<%
request.setCharacterEncoding("UTF-8");

String action = request.getParameter("action");
Date now = new Date(System.currentTimeMillis());
Timestamp now2 = new Timestamp(System.currentTimeMillis());

if ("in".equals(action)) {

    // 결석 여부 확인
    boolean isAbsenceDuplicate = rdao.checkDuplicateAbsence(rdto.getMidx(), rdto.getIdx(), rdto.getClassidx());

    if (isAbsenceDuplicate) {
%>
<script>
      alert("이미 출근 처리된 기록이 있습니다.");
      history.back();
    </script>
<%
    } else {
        rdto.setRecordtime(480);
        rdto.setEntirate(0);       // 전체출석률
        rdto.setCurrate(0);          // 현재출석률
        rdto.setattendate(now);		// 금일시간
        rdto.setIntime(now2);		// 출근시간(시분초포함)
        rdto.setOuttime(now2);        // 출근 시 퇴근은 일단 동일하게 저장

        int result = rdao.attenInSave(rdto);
%>
<% if (result > 0) { %>
<script>
      alert("출근이 정상적으로 처리되었습니다.");
      location.href = "teacherAtten.jsp";
    </script>
<% } else { %>
<script>
      alert("출근 처리에 실패했습니다. 다시 시도해주세요.");
      history.back();
    </script>
<% } %>

<% } %>

<%
} else if ("out".equals(action)) {

    String name = request.getParameter("name");
    int idx = Integer.parseInt(request.getParameter("idx"));
    int midx = Integer.parseInt(request.getParameter("midx"));
    int classidx = Integer.parseInt(request.getParameter("classidx"));
    Timestamp outtime = new Timestamp(System.currentTimeMillis());
    
    // 퇴근로직으로 검사
    boolean isAlreadyOut = rdao.checkAlreadyOut(midx, idx, classidx);

    if (isAlreadyOut) {
%>
<script>
      alert("이미 퇴근 처리된 기록이 있습니다.");
      history.back();
    </script>
<%
    } else {
    	int result = rdao.attenOutSave(midx, idx, classidx, outtime);
%>
<% if (result > 0) { %>
<script>
      alert("퇴근이 정상적으로 처리되었습니다.");
      location.href = "teacherAtten.jsp";
    </script>
<% } else { %>
<script>
      alert("퇴근 처리에 실패했습니다. 다시 시도해주세요.");
      history.back();
    </script>
<% } %>
<% 
    }
}
%>
