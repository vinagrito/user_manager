$(function(){
	var _last = new String("1")
	$('#users').click(function(){
		var _last = new String($("tr[aria-selected=true] td:first").html())
		$(".editLink").attr("href","/users/edit/"+ _last)
		$(".editLink").addClass('show')			
	})
	
})
