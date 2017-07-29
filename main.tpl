<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Cat Inc</title>
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>

<div id="managers">Info will be here</div>

<a href="javascript:get_data('#managers');">Get info</a>



<script>
function get_data(destId) {
    
    	$.post('/managers', {
    	}).done(function(resp) {
        	$(destId).text(resp['text'])
    	}).fail(function() {
        	$(destId).text("Server is unreachable");
    	});
    
}
</script>

</body>
</html>