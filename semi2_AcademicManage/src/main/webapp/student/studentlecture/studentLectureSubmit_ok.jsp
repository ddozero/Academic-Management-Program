<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<%@ page import="com.semi2.lecture.*" %>
<jsp:useBean id="sldao" class="com.semi2.lecture.SLectureDAO" ></jsp:useBean>
<jsp:useBean id="smdao" class="com.semi2.member.SMemberDAO"></jsp:useBean>
<%
	String classidx_s=request.getParameter("classidx");
	int classidx=Integer.parseInt(classidx_s);	
	
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
	
	int result=sldao.studentCheckMyLecture(mdto.getIdx());
	LectureDTO sldto=sldao.studentCheckCount(classidx);

	int result2=0;
	int result3=0;
	String msg=null;
	
	
	
	if(result<0){
		
		msg="에러:관리자에게 문의해주세요.";
	
	}else if(result==0){
		if(sldto!=null){
			int reqscount=sldto.getReqscount();
			int entirescount=sldto.getEntirescount();
			if(reqscount>=entirescount){
				msg="공석이 존재하지 않습니다.";
			}else{
				result2=smdao.studentAddLecture(classidx,mdto.getIdx());
				result3=smdao.studentAddLecture2(classidx);
				if(result2>0&&result3>0){
					msg="신청이 완료되었습니다.";
				}else if(result2<=0||result3<=0){
					msg="신청이 실패했습니다. 관리자에게 문의해주세요";
				}
			}
		}else{
			msg="에러:관리자에게 문의해주세요.";
		}
	
	}else if(result>0){
		msg="현재 신청하신 강좌가 존재합니다.";		
	
	}
	
	
%>

<script>
	window.alert('<%=msg%>');
	window.self.close();
	opener.location.href='studentLectureList.jsp';
</script>