$(function(){
  var gray_sq_num = $(".main td.gray").size();
  var black_sq_num = $(".main td.black").size();
  var white_sq_num = $(".main td.white").size();
  var winner = (black_sq_num > white_sq_num) ? "black" : "white" ;
  
  if(gray_sq_num < 50){
    alertify.alert("finish!");
    alertify.alert("winner ... ");
    alertify.alert( winner + "!!!");
  }
  
  $("td").click(function(){
    // clickしたブロックのid
    var clicked_id = $(this).prop("id");

    // next blockの色の付いているブロックのidを取得
    var diff = [];
    $($("#next_blocks td.black").get().reverse()).each(function(i, elem) {
        diff[i] = $(elem).prop("id")
    });

    // 差分を出す
    var small_block_diff = [];
    for (var i = 0; i < diff.length; i++) {
       small_block_diff[i] = diff[i] - diff[0];

       if(-5 <= small_block_diff[i] && -3 >= small_block_diff[i]) {
        small_block_diff[i] -= 7
       } else if (-8 <= small_block_diff[i] && -6 >= small_block_diff[i]) {
        small_block_diff[i] -= 14
       }
    }

    var update_blocks = small_block_diff.map(function(diff) {
                return parseInt(clicked_id) + diff;
              });

    // ajaxで/updateにpostする
    $.ajax({
      type: "POST",
      url: "/update",
      data: {
        data : 2,
        update_blocks: update_blocks
      },
      success: function(){
        location.href="/";
      }
    });
    
  });
});