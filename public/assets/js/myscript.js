$(function(){
    $("td").click(function(){
        var id = $(this).prop("id");
        console.log(id);
        
        var post_data = "black=true&data=2&id=" + id
        
        $.ajax({
          type: "POST",
          url: "/update",
          data: post_data,
          success: function(msg){
            location.href="/";
          },
          error: function(msg){
            console.log("aaa");
          }
        });
    })
});