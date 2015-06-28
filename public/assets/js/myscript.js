$(function(){
  $("td").click(function(){
    // clickしたブロックのid
    var clicked_id = $(this).prop("id");

    // next blockの色の付いているブロックのidを取得
    var diff = [];
    $("#next_blocks td.white").each(function(i, elem) {
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

    var res = small_block_diff.map(function(diff) {
                return parseInt(clicked_id) + diff;
              });

    console.log(res);

    // var post_data = "black=true&data=0&id=" + id

    // $.ajax({
    //   type: "POST",
    //   url: "/update",
    //   data: post_data,
    //   success: function(msg){
    //     location.href="/";
    //   },
    //   error: function(msg){
    //     console.log("aaa");
    //   }
    // });
    
  });
});