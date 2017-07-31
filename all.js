$('#destId').pagination({
    			dataSource: resp,
    			totalNumber: resp.length,
    			pageSize: 10,
    			ajax: {
        			beforeSend: function() {
            		dataContainer.html('Loading data');
        			}
    			},
    			callback: function(data, pagination) {
        			// template method of yourself
        			var html = template(data);
        			dataContainer.html(html);
    			}
			})