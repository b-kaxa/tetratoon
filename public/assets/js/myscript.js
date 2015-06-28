$(function(){
  $("td").click(function(){
    // clickしたブロックのid
    var clicked_id = $(this).prop("id");

    // next blockの色の付いているブロックのidを取得
    var diff = [];
    $("#next_blocks td.black").each(function(i, elem) {
        diff[i] = $(elem).prop("id")
    });
    
    // 差分を出す
    var small_block_diff = [];
    for (var i = 0; i < diff.length; i++) {
       small_block_diff[i] = diff[i] - diff[0];

       if(3 <= small_block_diff[i] && 5 >= small_block_diff[i]) {
        small_block_diff[i] += 7
       } else if (6 <= small_block_diff[i] && 8 >= small_block_diff[i]) {
        small_block_diff[i] += 14
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
      success: function(msg){
        location.href="/";
      }
    });
    
  });
});