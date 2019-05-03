<!doctype html>
<html>
 <head>
  <meta charset="UTF-8"> 
  <title>정규식을 이용한 실시간 콤마(comma) 넣기</title>


 </head>
 <body>
    <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>  
 </body>
</html>
