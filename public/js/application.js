var side = [
  "left",
  "right",
  "not"
];

function changeClass(e){
  var counter = counterCount(this)
  $(this).removeClass("left").removeClass("right").removeClass("not")
  $(this).addClass(side[counter]);
} // functions collapsed

  function counterCount(ball){
    var num, ballClass;
    ballClass = $(ball).attr("class")
    if(checkNot(ballClass)){num = 0}
    else if(checkLeft(ballClass)){num = 1}
    else if(checkRight(ballClass)){num= 2};
    return num
  };

  function checkLeft(ballClass){
    var substring = "left";
    return checkClass(ballClass, substring)
  };
  function checkRight(ballClass){
    var substring = "right";
    return checkClass(ballClass, substring)
  };
  function checkNot(ballClass){
    var substring = "not";
    return checkClass(ballClass, substring)
  };
  function checkClass(ballClass, substring){
    return ballClass.indexOf(substring) !== -1;
  };

function weighScale(e){
  var url, data;
  e.preventDefault();
  url = '/games'
  data = {left: collectLeft(), right: collectRight()}
  $.ajax({
    dataType: "json",
    url: url,
    data: data,
    method: "PUT"
  })
    .done(handleResponse)
} // functions collapsed
  function ajaxWeighCall() {
    $.ajax({
    dataType: "json",
    url: url,
    data: data,
    method: "PUT"
  })
  }

  function handleResponse(response){
    $("#count").text(response.count)
    $(".scale").replaceWith(response.image)
    if(response.gameOver){
      $("#game-data").empty().append(response.gameOver)
      $("#weigh-button").hide()
    }
  }

  function collectLeft(){
    var left = []
    $( ".left" ).each(function( index ) {
    left.push($( this ).attr("id"))
    });
    return left
  };

  function collectRight(){
    var right = []
    $( ".right" ).each(function( index ) {
    right.push($( this ).attr("id"))
    });
    return right
  };

$(document).ready(function() {
  $('.ball').click(changeClass);
  $("#weigh-button").submit(weighScale);
});
