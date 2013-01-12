$(document).ready(function() {
  var textarea = $("[id$=page_raw_data]");
  textarea.hide();
  var editor = ace.edit("editor");
  editor.getSession().setValue(textarea.val());
  editor.setTheme("ace/theme/tomorrow");
  editor.getSession().setMode("ace/mode/markdown");
  editor.getSession().setTabSize(2);
  editor.resize();
  $("#editor_form").submit(function(){
    textarea.val(editor.getSession().getValue());
  });
});

