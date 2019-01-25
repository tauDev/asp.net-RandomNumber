<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestScript.aspx.cs" Inherits="DemoRandom.TestScript" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title></title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta name="robots" content="noindex, nofollow">
  <meta name="googlebot" content="noindex, nofollow">
  <meta name="viewport" content="width=device-width, initial-scale=1">


  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
   <%-- <link rel="stylesheet" type="text/css" href="/css/normalize.css">

    <link rel="stylesheet" type="text/css" href="/css/result-light.css">--%>

  <style type="text/css">
    div#container {height:auto;width:auto;}

div.a {
width: 50px;
height:50px;
 background-color:red;
position:fixed;
    
}
div.b {
width: 50px;
height:50px;
 background-color:blue;
position:fixed;
    
}
div.c {
width: 50px;
height:50px;
 background-color:green;
position:fixed;
    
}

  </style>
  <!-- TODO: Missing CoffeeScript 2 -->

  <script type="text/javascript">


    $(window).load(function(){
      
$(document).ready(function() {
    animateDiv($('.a'));
        animateDiv($('.b'));
        animateDiv($('.c'));

});

function makeNewPosition($container) {

    // Get viewport dimensions (remove the dimension of the div)
    var h = $container.height() - 50;
    var w = $container.width() - 50;

    var nh = Math.floor(Math.random() * h);
    var nw = Math.floor(Math.random() * w);

    return [nh, nw];

}

function animateDiv($target) {
    var newq = makeNewPosition($target.parent());
    var oldq = $target.offset();
    var speed = calcSpeed([oldq.top, oldq.left], newq);

    $target.animate({
        top: newq[0],
        left: newq[1]
    }, speed, function() {
        animateDiv($target);
    });

};

function calcSpeed(prev, next) {

    var x = Math.abs(prev[1] - next[1]);
    var y = Math.abs(prev[0] - next[0]);

    var greatest = x > y ? x : y;

    var speedModifier = 0.1;

    var speed = Math.ceil(greatest / speedModifier);

    return speed;

}

    });

</script>

</head>
<body>
  <div id="container">
<div class="a"></div>
    <div class="b"></div>
    <div class="c"></div>
</div>
  
  <script>
    // tell the embed parent frame the height of the content
    //if (window.parent && window.parent.parent){
    //  window.parent.parent.postMessage(["resultsFrame", {
    //    height: document.body.getBoundingClientRect().height,
    //    slug: "j2PAb"
    //  }], "*")
    //}
  </script>


</body></html>
