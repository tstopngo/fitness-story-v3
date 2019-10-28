var userId = parseInt($("#logs").attr("data-id"))

$.get(`/users/${userId}/logs.json`, function(data){
  var logs = data;
  var logList ="";
  logs.forEach(function(log){
    currentId = log["id"]
    logList+=
    '<h2>'+ log["created_at"] + "</h2>" +
    '<p>'+ 'Calories: ' + log["calories"] +'</p>' +
    '<p>'+ 'Workout Time: ' + log["workout_time"] +'</p>'+
    `<a href="/logs/${currentId}/edit" class="js-update" data-id = "${currentId}"  >Update Log</a>` +
    `<div id="updateForm-${currentId}">

    </div>`
  });
  $("#logs").html(logList);
  updateLog();
});

function Log(attributes){
  this.id = attributes.id;
  this.created_at = attributes.created_at
  this.workout_time = attributes.workout_time
  this.calories = attributes.calories
  this.user = attributes.user
}

Log.prototype.renderLi = function() {
  return `<h2>New Log Added!</h2> <p> Calories: ${this.calories} </p> <p>Workout: ${this.workout_time} </p>`;
}

$(".newLog").on("click", function(event){
  event.preventDefault();
  $('#form').append("<h2>Add New Log<h2>")
  $('#form').append("<%= escape_javascript render(:partial => 'logs/form',
  :locals => { :l => @log }) %>");

  $("#new_log").on("submit", function(e){
    e.preventDefault();
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        let log = new Log(response)
        let html = log.renderLi()
        $("#form").html(html);
      }
    });
  });
});

function updateLog(){
$(function(){
  $(".js-update").on("click", function(event){
    event.preventDefault();
    var logId = parseInt($(".js-update").attr("data-id"))
    $(`#updateForm-${logId}`).append("<h2>Update Log</h2>")
    $(`#updateForm-${logId}`).append(`
    <form class="update_form" action="/logs/${logId}" method="post">
      <input type="hidden" name="_method" value="patch">
      <%= escape_javascript hidden_field_tag :authenticity_token, form_authenticity_token%>
      Calories: <br><input type="text" name="calories" id="log_calories"><br>
      Workout Time:<br> <input type="text" name="workout_time" id="log_workout_time"><br>
      <input type="submit" name="update" value="Update Log">
    </form>`)
    $(`.update_form`).on("submit", function(event){
        event.preventDefault();
        $.ajax({
          type: "PATCH",
          url: this.action,
          data: $(this).serialize(),
          success: function(response){
            let log = new Log(response)
            let html = log.renderLi()
            $(".updateForm").html(html);
          }
        });
    });
  });
});
};
