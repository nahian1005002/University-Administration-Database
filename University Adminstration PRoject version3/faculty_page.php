<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="bootstrap-3.1.1-dist/css/bootstrap.css" />
<link rel="stylesheet" href="bootstrap-3.1.1-dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="bootstrap-3.1.1-dist/css/bootstrap-theme.css" />
<link rel="stylesheet" href="bootstrap-3.1.1-dist/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="main.css" />
<script src="jquery.js"></script>

<script src="bootstrap-3.1.1-dist/js/bootstrap.js"></script>
<script src="bootstrap-3.1.1-dist/js/bootstrap.min.js"></script>
<title>Faculties</title>
</head>
<body>
<div class="container">
    <?php include_once('header.php'); ?>
	<div class="row">
  <div class="col-md-10 col-md-push-2">
  <div class="row">
	<?php
	$id=$_GET['name'];
	 $db = oci_pconnect('alvi','oracle','localhost');
	  $sql="select a.f_id,a.f_name from faculty a where a.f_id=".$id; 
        $result=oci_parse($db,$sql);			                             		                              
           oci_execute($result);
           //echo $result;
		echo "<ul class='list-group'>";
          while($row=oci_fetch_array($result))
            {	
				echo "<h4><li  class='list-group-item'>".
				$row[1]."</li></h4>";
            }		
           echo "</ul>";
           oci_free_statement($result);
		   
		   $sql="select a.oid,a.name from officer a,dean_faculty b where b.f_id=".$id." and b.t_id=a.oid"; 
         $result=oci_parse($db,$sql);			                             		                              
           oci_execute($result);
           //echo $result;
		 echo "<h4>Dean</h4>";
		 echo "<ul class='list-group'>";
          while($row=oci_fetch_array($result))
            {	
				echo "<h4><a href='teachers.php?name=".$row[0]."'> <li  class='list-group-item'>".
				$row[1]."</li></a></h4>";
            }		
           echo "</ul>";
           oci_free_statement($result);
		
		$sql1="select distinct a.D_name,a.D_code from Departments a,Faculty b where a.f_id=".$id; 
         $result1=oci_parse($db,$sql1);			                             		                              
           oci_execute($result1);
           //echo $result;
		 echo "<h4>Departments</h4>";
		 echo "<ul class='list-group'>";
          while($row=oci_fetch_array($result1))
            {	
				echo "<a href='dept.php?name=".$row[1]."'> <li  class='list-group-item'>".
				$row[0]."</li>";
            }		
           echo "</ul>";
           oci_free_statement($result1);
			
			
           oci_close($db);
	
	
	?>
	
 </div>
 </div>
	<?php include 'facultysidebar.php'?>
</div>
<?php include 'footer.php'; ?>

<script type="text/javascript">
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        });
   </script>
</body>
</html>
</head>