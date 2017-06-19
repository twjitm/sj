
	function readBook(type,id) {
		layer.open({
			type : 2,
			title : false,
			closeBtn : 0, //不显示关闭按钮
			shade : [ 0 ],
			area : [ '340px', '215px' ],
			offset : 'rb', //右下角弹出
			time : 200, //2秒后自动关闭
			anim : 2,
			content : [ '', 'no' ], //iframe的url，no代表不显示滚动条
			end : function() { //此处用于演示
				layer.open({
					type : 2,
					title : '在线阅读图书器',
					shadeClose : true,
					shade : false,
					maxmin : true, //开启最大化最小化按钮
					area : [ '750px', '550px' ],
					content :'/sj/books/readbook.do?id='+id+'&type='+type
				});
			}
		});
	}