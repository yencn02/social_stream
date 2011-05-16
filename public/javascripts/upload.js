$(document).ready(function() {
  var action = $("#submit_form").attr("action") + "?X-Progress-ID=" + $("#X-Progress-ID").val();
  $("#submit_form").attr("action", action);
  $("#submit").bind("click", function(){
    UploadProgressBar.setAsStarting();
    $("#submit").hide();
    UploadProgressBar.monitor();
    return true;
  })
});
var UploadProgressBar = {
  watcher: null,
  uploading: false,
  progressing: false,
  ajaxLoading: false,
  monitor: function() {
    var uuid = $('#X-Progress-ID').attr("value");
    this.watcher = setInterval(
      function() {
        if (!UploadProgressBar.ajaxLoading) {
          UploadProgressBar.ajaxLoading = true;
          jQuery.ajax({
            type: 'get',
            async: false,
            dataType: "json",
            success: function(xhr){
              UploadProgressBar.ajaxLoading = false;
              if(xhr.state == "uploading"){
                UploadProgressBar.update(xhr.size, xhr.received)
              }
              if (xhr.state == "done"){
                UploadProgressBar.setAsFinished();
              }
            },
            data: {"X-Progress-ID": uuid},
            url: "/progress"
          });
        }
      }, 2000);
  },

  update: function(total, current) {
    var progress = current / total;
    $("#prog-percentage").css({
      width: UploadProgressBar.toPercentage(progress)
    })
    if (progress == 1){
      $('#ProgressMessage').html("Finished uploading.");
    }
    var text = UploadProgressBar.toPercentage(progress)
    $('#ProgressBarText').html(text);
		$('#ProgressBarContainer').show();
  },

  setAsStarting: function() {
    this.uploading = true;
    this.processing = false;
	  $('#ProgressMessage').html("Uploading ...");
	  $('#ProgressMessage').show();
    $("#prog-percentage").css({
      width: '0%'
    })
		$('#ProgressBarText').html('0%');
    $('#ProgressBarContainer').show();
  },

  setAsFinished: function() {
    this.uploading = false;
    $("#prog-percentage").css({
      width: '100%'
    })
		$('#ProgressBarText').html('100%');
	  $('#ProgressMessage').html("Finished uploading.");
	},
  toPercentage: function(number){
    return Math.floor(number * 100) + '%';
  }
}