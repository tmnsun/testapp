function edit_comment(comment_id) {
	$('#comment-container-'+comment_id).redactor({ focus: true });
	$('#comment-save-'+comment_id).show();
	$('#comment-edit-'+comment_id).hide();
}

function save_comment(comment_id) {
	var comment_body = $('#comment-container-'+comment_id).html();
	$('#comment-container-'+comment_id).redactor('destroy');
	$('#comment-save-'+comment_id).hide();
	$('#comment-edit-'+comment_id).show();
}