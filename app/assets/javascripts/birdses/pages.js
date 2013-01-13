$(document).ready(function() {
  // Editor
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

  // Preview
  var preview = $('[name$=preview_button]');
  preview.click(function(event) {
    event.preventDefault();

    // set the page's name to the value of the hidden preview textbox
    $('#preview_name').val(function () {
      var name = $('h2').html();
      if ('New Page' == name) {
        name = $('#page_name').val()
      }
      return name
    });

    // set the page's content to the value of the hidden content preview box
    $('#preview_content').val(editor.getSession().getValue());

    // Toggle the title of the Preview Button
    $('#editor').toggle();
    $('#preview').toggle(10, function(){
      if ($('#preview').is(':visible')) {
        preview.val('Edit');
        $('#preview_form').submit();
      } else {
        preview.val('Preview');
      }
    });
  });
});

