$(document).ready(function() {
  textarea = $("textarea#gollum-editor-body")
  if ($(textarea).length) {
    // Preview
    var preview = $('[name$=preview_button]');
    preview.click(function(event) {
      event.preventDefault();

      var name = $('h2').html();
      if ('New Page' == name) {
        name = $('#page_name').val()
      }

      // Toggle the title of the Preview Button
      $('#editor').toggle();
      $('#preview').toggle(10, function(){
        if ($('#preview').is(':visible')) {
          preview.val('Edit');
          $.ajax({
            type: "POST",
            url: $("#preview_form").attr("action"),
            data: {
              format: "json",
            utf8: "✓",
            authenticity_token: $("#preview_form input[name=authenticity_token]").val,
            md_content: textarea.val(),
            name: name
            },
            success: function(data, textStatus, jqXHR) {
              return $("#preview").html(data["html"]);
            },
            error: function(jqXHR, textStatus, errorThrown) {},
            dataType: "text json"
          });
        } else {
          preview.val('Preview');
        }
      });
    });
  }
});
