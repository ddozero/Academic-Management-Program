<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.semi2.member.*" %>
<%@ page import="com.semi2.test.*" %>
<jsp:useBean id="stdao" class="com.semi2.test.STestDAO"></jsp:useBean>
<%
	MemberDTO mdto=(MemberDTO)session.getAttribute("smdto");
	
	
	String count_s=request.getParameter("count"); //문제 수
	int count=Integer.parseInt(count_s);
	String classidx_s=request.getParameter("classidx"); //반번호
	int classidx=Integer.parseInt(classidx_s);
	int groupidx=stdao.studentGetGroupidx(classidx); //그룹 idx 가져온것 
	
	ArrayList<String> testidxs=new ArrayList<String>(); //testidx넣을 어레이
	ArrayList<String> numidxs=new ArrayList<String>();//numidx넣을 어레이
	ArrayList<String> sanswers=new ArrayList<String>(); //답 넣을 어레이
	
	ArrayList<TestDTO> checkanswer=new ArrayList<TestDTO>();	
	int result=0;
	String msg=null;
	int yesorno=0;
	
	
	for(int i=0;i<count;i++){
		String str=request.getParameter("testidx"+i);
		testidxs.add(str);
		String str2=request.getParameter("numidx"+i);
		numidxs.add(str2);
		String str3=request.getParameter("answer"+i).trim();
		sanswers.add(str3);
		
	}
	

	
	for(int j=0;j<count;j++){
		
		
		int testidx=Integer.parseInt(testidxs.get(j));
		int numidx=Integer.parseInt(numidxs.get(j));
		

		result=stdao.studentSubmitTest(classidx, mdto.getIdx(), groupidx, testidx,numidx,sanswers.get(j));
		if(result<0){
			msg="제출에 실패하였습니다.";
			break;
		}else{
			msg="제출에 성공하였습니다.";
		}
	}
	
	checkanswer=stdao.checkAnswer(classidx,mdto.getIdx());
	if(checkanswer!=null&&checkanswer.size()!=0){
		for(int k=0;k<checkanswer.size();k++){
			
			if(checkanswer.get(k).getRightanswer().equals(checkanswer.get(k).getSanswer())){
				yesorno=1;
				stdao.updateStudentScore(yesorno,checkanswer.get(k).getScore(),checkanswer.get(k).getTestidx(),mdto.getIdx());
			}else{
				yesorno=0;
				stdao.updateStudentScore2(yesorno,checkanswer.get(k).getTestidx(),mdto.getIdx());
					
			}
			
		}
		
		
	}
	
		
%>    
<script>
	window.alert('<%=msg%>');
	location.href='studentTestList.jsp';
</script>