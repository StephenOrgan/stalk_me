$(function(){
	$(document).on("ajax:success", ".edit-profile", function(e, html){
		$(".modal").html(html).modal("show")
	})
})