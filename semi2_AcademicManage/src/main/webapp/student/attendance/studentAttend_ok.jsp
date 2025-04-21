<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi2.member.*" %>
<%@ page import="com.semi2.record.*" %>
<%@ page import="com.semi2.lecture.*" %>        
<%@ page import="java.util.*" %>   
<jsp:useBean id="sldao" class="com.semi2.lecture.SLectureDAO"></jsp:useBean>
<jsp:useBean id="srdao" class="com.semi2.record.SRecordDAO"></jsp:useBean>
<%
	
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
	int classidx=srdao.studentGetClassidx(mdto.getIdx());
	
	String num_s=request.getParameter("num");
	int num=Integer.parseInt(num_s);
	
	int result=0;
	String msg=null;
	
	

		
	
	if(num==1){
		result=srdao.studentCheckIn(mdto,classidx);
		msg=result>0?"입실 처리되었습니다.":"입실 실패:담당 매니저에게 연락해주세요.";
	}else{
		result=srdao.studentCheckOut(mdto, classidx);
		msg=result>0?"퇴실 처리되었습니다.":"퇴실 실패:담당 매니저에게 연락해주세요.";
		
		ArrayList<RecordDTO> arr=srdao.studentAttendRate(mdto.getIdx(),classidx);
		
		double lateEarlyLeave=0.0; 
		double abs=0.0;
		double oneDay=0.0;
		LectureDTO sldto=sldao.studentMyLecture(mdto.getIdx()); //전체 일수를 가져오기위함


		if(sldto!=null&&!sldto.equals("")){
			oneDay=(double)100/sldto.getEntiredate();//하루 일수의 퍼센트
		}
		
		
		
		if(arr!=null&&arr.size()!=0){
			
			for(int i=0;i<arr.size();i++){
				if(arr.get(i).getStatus()==3||arr.get(i).getStatus()==4){
					lateEarlyLeave++;//지각,조퇴 횟수
				}else if(arr.get(i).getStatus()==5){
					abs++;//결석 횟수
				}
					
			}
				
		}
		
		
		int percent=(int)((lateEarlyLeave*0.5*oneDay)+(abs*oneDay));
		
		
		int entirate=srdao.studentEntireRate(mdto.getIdx(), classidx);
		
		
		
		
		srdao.studentAttendRate2(entirate,percent, mdto.getIdx(),classidx);
		
	
		
		
	}
	
	
%>

<script>
	window.alert('<%=msg%>');
	location.href='studentAttend.jsp';

</script>
