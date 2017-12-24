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
   <div class="col-md-8 col-md-push-3">
    <h4>New Dean</h4>
	<form role="form" method="post" action="insert_newdeancheck.php">
    <div class="form-group">
    <label for="exampleInputText">Teacher Id :</label>
    <input type="text" class="form-control" id="exampleInputText1" placeholder="Enter TeacherId" name="teacherid">
    </div>
    <div class="form-group">
    <label for="exampleInputText1">FacultyId:</label>
    <input type="text" class="form-control" id="exampleInputText1" placeholder="FACULTY Id" name="fid">
    </div>
	<div class="form-group">
    <label for="exampleInputDate1">StartDate:</label>
    <input type="text" class="form-control" id="exampleInputText1" placeholder="StartDate" name="sdate">
    </div>
	<input type="submit" class="btn btn-default">
	</form>
		
    </div>
	
	
	<?php include 'admin_sidebar.php'?>
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