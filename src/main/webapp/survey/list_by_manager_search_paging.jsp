<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Pet Doctor</title> <!-- 주소창 타이틀 -->
    <style type="text/css">
    th {
    font-size:15px;
    }
    td {
    font-size:15px;
    }
    </style>

<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">

$(function() {

 $('#panel_create').hide();
 $('#btn_create').on('click', create_form);
 $('#main_panel').hide();
 $('#panel_update').hide();
 document.getElementById('startdate').valueAsDate = new Date();
 document.getElementById('enddate').valueAsDate = new Date();
 
});

function create_form(){
  $('#panel_create').show();
  $('#btn_create').hide();
  $('#frm_find').hide();
}

//등록 처리
function create_proc() {
  $('#panel_create').hide();
  $('#btn_create').hide();
  $.ajax({
    url: "./create_json.do", // 요청을 보낼주소
    type: "post",  // or get
    cache: false,
    dataType: "json", // 응답 데이터 형식, or json
    data: $('#frm_create').serialize(), 
    // Ajax 통신 성공, JSP 정상 처리
    success: function(rdata) { // callback 함수
      var panel = '';
      panel += "<DIV>";
      for(index=0; index < rdata.msgs.length; index++) {
        panel += rdata.msgs[index]+'<br>';
      }
      panel += "  <button type='btn btn-primary' onclick=\"$('#main_panel').hide();location.reload();\">닫기</button>";
      panel += "</DIV>";
   		
      
      $('#main_panel').html(panel);
      $('#main_panel').show();
      
      
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var panel = '';
      panel += "<DIV id='panel' class='popup1' style='heigth: 450px;'>";
      panel += '  ERROR<br><br>';
      panel += '  <strong>request.status</strong><br>'+request.status + '<hr>';
      panel += '  <strong>error</strong><br>'+error + '<hr>';
      panel += "  <br><button type='button' onclick=\"$('#main_panel').hide();\">닫기</button>";
      panel += "</DIV>";
      
      $('#main_panel').html(panel);
      $('#main_panel').show();

    }
  });
}

function update(surveyno) {
  $('#btn_create').hide();
  $('#panel_update').show();
  $('#panel_update').show();
  $('#frm_find').hide();
  $.ajax({
    url: "./update.do", 
    type: "get", // or get
    cache: false,
    async: true, // true: 비동기
    dataType: "json", // 응답 형식, html, xml...
    // data: $('#frm').serialize(),  // 보내는 데이터
    data: 'surveyno='+surveyno,
    success: function(rdata) {
      // alert(rdata);

      var frm_update = $('#frm_update');
      $('#survey_title', frm_update).val(rdata.survey_title);
      $('#seqno', frm_update).val(rdata.seqno);
      $('#startdate', frm_update).val(rdata.startdate);
      $('#enddate', frm_update).val(rdata.enddate);

      $('#surveyno', frm_update).val(rdata.surveyno);
      
    },
    error: function(request, status, error) { // 응답 결과, 상태, 에러 내용
      var msg = 'ERROR<br><br>';
      msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
      msg += '<strong>request.responseText</strong><br>'+request.responseText + '<hr>';
      msg += '<strong>status</strong><br>'+status + '<hr>';
      msg += '<strong>error</strong><br>'+error + '<hr>';

        var msg = '알림<br><br>';
      msg += '<strong>현재 시스템 정비중입니다.</strong><br>조속히 처리하겠습니다.<hr>';
      msg += '예상 종료 시간: 16:00'; 
        
      $('#main_panel').html(msg);
      $('#main_panel').show();
    }
   });

} 

//수정 처리
function update_proc(){
  $('#panel_update').hide();
  $.ajax({
    url: "./update_json.do", // 요청을 보낼주소
    type: "post",  // or get
    cache: false,
    dataType: "json", // 응답 데이터 형식, or json
    data: $('#frm_update').serialize(), 
    // Ajax 통신 성공, JSP 정상 처리
    success: function(rdata) { // callback 함수
      var panel = '';
      panel += "<DIV>";
      for(index=0; index < rdata.msgs.length; index++) {
        panel += rdata.msgs[index]+'<br>';
      }
      panel += "<br>";
      panel += "  <button type='btn btn-primary' onclick=\"$('#main_panel').hide();location.reload();\">닫기</button>";
      panel += "</DIV>";
   		
      
      $('#main_panel').html(panel);
      $('#main_panel').show();
      
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var panel = '';
      panel += "<DIV id='panel' class='popup1' style='heigth: 450px;'>";
      panel += '  ERROR<br><br>';
      panel += '  <strong>request.status</strong><br>'+request.status + '<hr>';
      panel += '  <strong>error</strong><br>'+error + '<hr>';
      panel += "  <br><button type='button' onclick=\"$('#main_panel').hide();\">닫기</button>";
      panel += "</DIV>";
      
      $('#main_panel').html(panel);
      $('#main_panel').show();

    }
  });
}




function delete_form(surveyno) {
  // 문자열: ', ""
  var url = './delete_form.do?surveyno=' + surveyno;
  var width = 500;
  var height = 300;
  var win = window.open(url, '회원 정보 변경', 'width='+width+'px, height='+height+'px');
  var x = (screen.width - width) / 2; 
  var y = (screen.height - height) / 2;
  
  win.moveTo(x, y);
}

function seqnoUp(surveyno,managerno) {
  var frm_seqno = $('#frm_seqno');
  frm_seqno.attr('action', './update_seqno_up.do');
  $('#surveyno', frm_seqno).val(surveyno);
  $('#managerno', frm_seqno).val(managerno);
  frm_seqno.submit();
}

function seqnoDown(surveyno,managerno) {
  var frm_seqno = $('#frm_seqno');
  frm_seqno.attr('action', './update_seqno_down.do');
  $('#surveyno', frm_seqno).val(surveyno);
  $('#managerno', frm_seqno).val(managerno);
  frm_seqno.submit();
}

function exit(){
  alert("관리자의 권한이 필요합니다.");
}


function create_update_cancel() {
  $('#panel_update').hide();
  $('#panel_create').hide();
  $('#panel_delete').hide();
  $('#btn_create').show();
  $('#frm_find').show();

}



</script>



</head> 

<body>
<c:import url="/menu/top.jsp" /> <!--  top 부분 소스분리 -->
<DIV class='container' style="width:80%;" >
<DIV class='content' style=' margin:0px auto; text-align: center; margin-top: 5%; margin-bottom:5%'>

    
  <DIV class='title_line' style="width:30%;">
    <aside style="float: center; font-weight: bold; font-size:35px; ">설문 조사 목록</aside><br>

  </DIV>

    <div style='text-align: right'>
    
    <button type="button" class="btn btn-primary" id="btn_create" style='width:5%;'>등록</button>
    
   </div> 


  <form name='frm_find' id='frm_find' method="get" action="./list_by_manager_search_paging.do">


    <input type='hidden' name='managerno' id='managerno' value='${managerno}'>
   <div style="width:100%;background-color:white;text-align:right; margin-top:10px;">
    <c:choose>
      <c:when test="${survey_title != '' }">
        <input type="search" placeholder="타이틀 검색" id='survey_title' value='${survey_title}' style='width: 10%;height:28px;'>
      </c:when>
      <c:otherwise>
        <input type="search" placeholder="타이틀 검색"  name='survey_title' id='survey_title' value='' style='width: 10%;height:28px;'>
      </c:otherwise>
    </c:choose>
    <button type='submit' class="btn btn-success btn-sm">검색</button>
    <button type='button' class="btn btn-success btn-sm"
                 onclick="location.href='./list_by_manager_search_paging.do?managerno=${managerno}'">전체 보기</button>
    </div> 
  </form>

    <!-- 우선 순위 증가 감소 폼 -->
  <FORM name='frm_seqno' id='frm_seqno' method='post' action=''>
    <input type='hidden' name='surveyno' id='surveyno' value=''>
    <input type='hidden' name='managerno' id='managerno' value=''>
  </FORM>

  <DIV style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%;height:80px;text-align: center; ' id='main_panel' ></DIV> 
    
    
    
   <DIV id='panel_create' style='padding: 10px 0px 40px 0px; background-color:#f9f9f9; width: 100%;text-align: center;'>
      <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'
             enctype="multipart/form-data" class="form-horizontal">
         <input type='hidden' name='managerno' id='managerno' value='${managerno}'> 
         
          <div class="row">
          <div class="col-md-5 mb-6">
            <label for="survey_title">설문조사 타이틀</label>
            <input type="text" class="form-control" name="survey_title" id="survey_title" placeholder="" value="" required >
          </div>
          
          <div class="col-md-1 mb-6">
            <label for="seqno">Seqno</label>
            <input type="number" class="form-control" name="seqno" id="seqno" placeholder="" value="1" required >
          </div>
          
         <div class="col-md-3 mb-6">
            <label for="startdate">Startdate</label>
            <input type="date" class="form-control" name="startdate" id="startdate" placeholder="" value="" required >
          </div>
          
          <div class="col-md-3 mb-6">
            <label for="enddate">Enddate</label>
            <input type="date" class="form-control" name="enddate" id="enddate" placeholder="" value=""  required >
          </div>
          
        <label></label>

     </div> 
             
       </FORM>
         <div style="float:right;margin-top:10px;">
           <button type="button"  class="btn btn-primary btn-sm"  id='submit' onclick="create_proc()" >등록</button>
           <button class="btn btn-primary btn-sm "type="button" onclick="create_update_cancel();">취소</button>
       </div>  
    </DIV>
    
    
     <DIV id='panel_update' style='padding: 10px 0px 30px 0px; background-color: #f9f9f9; width: 100%; text-align: center;'>
      <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'
             enctype="multipart/form-data" class="form-horizontal">
         <input type='hidden' name='surveyno' id='surveyno' value=''> 
         
          <div class="row">
          <div class="col-md-5 mb-2">
            <label for="survey_title">설문조사 타이틀</label>
            <input type="text" class="form-control" name="survey_title" id="survey_title" placeholder="" value="" required >
          </div>
          
          <div class="col-md-1 mb-2">
            <label for="seqno">Seqno</label>
            <input type="number" class="form-control" name="seqno" id="seqno" placeholder="" value="1" required >
          </div>
          
         <div class="col-md-3 mb-2">
            <label for="startdate">Startdate</label>
            <input type="date" class="form-control" name="startdate" id="startdate" placeholder="" value="2019-01-15" required >
          </div>
          
          <div class="col-md-3 mb-2">
            <label for="enddate">Enddate</label>
            <input type="date" class="form-control" name="enddate" id="enddate" placeholder="" value="2019-01-15"  required >
          </div>
          
        <label></label>

     </div> 
             
             
       </FORM>
        <div style="float : right;">
           <button type="button"  class="btn btn-primary btn-sm"  id='submit' onclick="update_proc()">수정</button>
           <button type="button"  class="btn btn-primary btn-sm" onclick="create_update_cancel();">취소</button>
       </div>  
    </DIV>

  
<TABLE class='table'>
  <colgroup>
    <col style='width:5%;'/> 
    <col style='width: 10%;'/> 
    <col style='width: 25%;'/>
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 25%;'/>
  </colgroup>

  <thead>  
  <TR>
    <TH style='text-align: center ;'>순서</TH>
    <TH style='text-align: center ;'>작성자</TH>
    <TH style='text-align: center ;'>설문조사 타이틀</TH>
    <TH style='text-align: center ;'>선택지 수</TH>
    <TH style='text-align: center ;'>시작일</TH>
    <TH style='text-align: center ;'>종료일</TH>        
    <TH style='text-align: center ;'>등록일</TH>
    <TH style='text-align: center ;'>기타</TH>    
  </TR>
  </thead>
  <c:forEach var="manager_surveyVO" items="${list }">
  <TR style="font-size:12px;">
    <TD style='text-align: center ;'>${manager_surveyVO.surveyno}</TD>  
    <TD style='text-align: center ;'>${manager_surveyVO.name}</TD>  
    <TD style='text-align: left;'><A href="../surveyitem/list.do?surveyno=${manager_surveyVO.surveyno}"><span style="color:#3C55B1;font-size:15px;">${manager_surveyVO.survey_title }</span></A></TD>
    <TD style='text-align: center ;'>${manager_surveyVO.q_cnt}</TD>
    <TD style='text-align: center ;'>${manager_surveyVO.startdate }</TD>
    <TD style='text-align: center ;'>${manager_surveyVO.enddate }</TD>
    <TD style='text-align: center ;'>${manager_surveyVO.rdate.substring(0,10)}</TD>
    <TD style='text-align: center ;'>
        <c:choose>   
         <c:when test="${manager_surveyVO.q_cnt==0}">
    <button type="button" class="btn btn-warning btn-sm"onclick="exit();" >결과 보기</button>
          </c:when>
         <c:otherwise>
     <button type="button" class="btn btn-warning btn-sm"onclick="location.href='../surveyitem/party_bar.do?surveyno=${manager_surveyVO.surveyno}'" >결과 보기</button>
         </c:otherwise>
    </c:choose>
      <button type="button" class="btn btn-danger btn-sm"onclick="location.href='../surveyparty/list_survey.do?surveyno=${manager_surveyVO.surveyno}'" >참여 List</button>   

    
      <A href="javascript:update(${manager_surveyVO.surveyno})"><IMG src='./images/update.png' title='수정' style='width:20px;'></A>
      <A href="javascript:delete_form(${manager_surveyVO.surveyno})"><IMG src='./images/delete.png' title='삭제' style='width:20px;'></A>
       <A href="javascript:seqnoUp(${manager_surveyVO.surveyno},${manager_surveyVO.managerno })"><IMG src='./images/up.png' title='우선순위 높임' style='width:20px;'></A>
      <A href="javascript:seqnoDown(${manager_surveyVO.surveyno},${manager_surveyVO.managerno })"><IMG src='./images/down.png' title='우선순위 낮춤' style='width:20px;'></A>
     <span style ='color:blue'>[${manager_surveyVO.seqno }]</span>
     
    </TD>
  </TR>
  </c:forEach> 

</TABLE>
 <DIV class='bottom_menu'>${paging }</DIV>
 <br><br>

</DIV> <!-- content END -->
</DIV> <!-- container END -->

<jsp:include page="/menu/bottom.jsp" flush='false' /> <!--  bottom 부분 소스분리 -->
</body>

</html> 
 
 