<html encoding='UTF-8'>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Cat Inc</title>
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/static/jquerypag.js"></script>
<link href="/static/pagination.css" rel="stylesheet

<div class="btn-group">
  <button class="btn " type="button">
      <a data-toggle="tab" href="javascript:make_pages()">Managers</a>
  </button>
  <button class="btn " type="button">
      <a data-toggle="tab" href="javascript:make_pages()">Managers</a>
  </button>
</div>

<div id="man">info</div>

    <div style="position: absolute; bottom: 80px;" id="pagination-container" 
      class="paginationjs-theme-blue"></div>

%include('new.tpl')

<script>
function make_pages(){
$('#pagination-container').pagination({
    dataSource: function(done) {
    $.ajax({
        type: 'GET',
        url: '/managers',
        success: function(response) {
        resp = response;
        	console.log(response);
            done(response);
        }
    });},
    locator: 'data._id',
    pageSize: 2,
    callback: function(data, pagination) {
        var dataHtml = '<ul>';
        $.each(data, function (index, item) {
                         dataHtml += '<li>' + item.name + '</li>';                         
                     });
        dataHtml += '</ul>';
        $('#man').html(dataHtml);
    }
})}

window.onload = make_pages();


</script>

</body>
</html>