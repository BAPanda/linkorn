<div style="position: absolute; bottom: 40px;">
	<input type="text" id="name">
	<input type="text" id="phone">
	<input type="text" id="address">
	<button onclick="add_new_man();" href="javascript:;">Add manager</button>
</div>

<script>

function add_new_man() {
    
    	$.ajax({
    		type: "POST",
    		url: "/add_man",
    		data: JSON.stringify({"name":$('#name').val(), "phone":$('#phone').val(), 
    		                      "address":$('#address').val()}),
    		contentType: "application/json; charset=utf-8"
		}).done(function(data){        		
    			make_pages();
    			$('#name').val('');
        		$('#phone').val('');
        		$('#address').val('');
    		});
		
}

</script>