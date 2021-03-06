<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
 
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<DIV class='container'>
<DIV class='content' style='width: 50%;'>
 
<DIV class='title_line' style='width: 40%;'>카테고리 등록</DIV>
 
<FORM name='frm' method='POST' action='./create.do'>
  <!-- 개발시 임시 값 사용 -->
  <input type='hidden' name='answerno' id='answerno' value='1'>
  <input type='hidden' name='memberno' id='memberno' value='1'>
  <input type='hidden' name='reviewno' id='reviewno' value='1'>
 
  <fieldset class='fieldset_basic'>
    <ul>
      <li class='li_none'>
        <label>카테고리 그룹 '${categrpVO.name }'에 새로운 그룹을 등록합니다.</label>
      </li>
    
      <li class='li_none'>
        <label for='content'>카테고리 이름</label>
        <input type='text' name='content' id='content' value='' required="required" autofocus="autofocus">
      </li>
    

 
      <DIV class='center' >
        <button type="submit" class='btn btn-primary'>등록</button>
        <button type="button" class='btn btn-primary' onclick="location.href='./list.do'">목록</button>
      </DIV>         
    </ul>
  </fieldset>
</FORM>
 
 
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
 
</html> 

