$(document).ready(start_redactor);

document.addEventListener("page:load", start_redactor);

function start_redactor() {
  var csrf_token = $('meta[name=csrf-token]').attr('content');
  var csrf_param = $('meta[name=csrf-param]').attr('content');
  var params;
  if (csrf_param !== undefined && csrf_token !== undefined) {
    params = csrf_param + "=" + encodeURIComponent(csrf_token);
  }
  $('.redactor').redactor(
    {
      "path":"/assets/redactor-rails",
      "css":"style.css",
      "buttons":['html', 'bold', 'italic', 'deleted']
    }
  );
}