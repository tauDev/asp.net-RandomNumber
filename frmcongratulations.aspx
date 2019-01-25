<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmcongratulations.aspx.cs" Inherits="DemoRandom.frmcongratulations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <meta charset="UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico">
  <link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111">
  <title>CodePen - THE CONFETTI ANIMATION</title>
  
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Varela+Round">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="Content/bootstrap.css" rel="stylesheet" />

 <style>
      html, body {
  margin: 0;
  padding: 0;
  background-image:url(images/Jeanv.1.jpg);
  background-repeat:no-repeat;
  background-size:cover;
  height: 100%;
  width: 100%;
}
#confetti{
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
}


a.iprodev {
  line-height: normal;
  font-family: Varela Round, sans-serif;
  font-weight: 600;
  text-decoration: none;
  font-size: 13px;
  color: #A7AAAE;
  position: absolute;
  left: 20px;
  bottom: 20px;
  border: 1px solid #A7AAAE;
  padding: 12px 20px 10px;
  border-radius: 50px;
  transition: all .1s ease-in-out;
  text-transform: uppercase;
}
a.iprodev:hover {
  background: #A7AAAE;
  color: white;
}
.RunndomText{
    position:absolute;
    top:15%;
    left:15%;
    width:80%;
    height:700px;
    margin-top:-100px;
    margin-left:-100px;
    color:#ffffe6;
}
h1{
    font-size:450%;

/*font: italic bold Georgia, Serif;
text-shadow: -4px 3px 0 #3a50d9, -14px 7px 0 #0a0e27;*/
    /*//text-shadow:4px 2px black;*/
   /*text-shadow: 2px 2px 0 #4074b5, 2px -2px 0 #4074b5, -2px 2px 0 #4074b5, -2px -2px 0 #4074b5, 2px 0px 0 #4074b5, 0px 2px 0 #4074b5, -2px 0px 0 #4074b5, 0px -2px 0 #4074b5;*/
   text-shadow: 0 1px 0 #CCCCCC, 0 2px 0 #c9c9c9, 0 3px 0 #bbb, 0 4px 0 #b9b9b9, 0 5px 0 #aaa, 0 6px 1px rgba(0,0,0,.1), 0 0 5px rgba(0,0,0,.1), 0 1px 3px rgba(0,0,0,.3), 0 3px 5px rgba(0,0,0,.2), 0 5px 10px rgba(0,0,0,.25), 0 10px 10px rgba(0,0,0,.2), 0 20px 20px rgba(0,0,0,.15);
}
img{
    width:70%;
    height:auto;
    border-radius:10%;
    display:block;
    margin-left:auto;
    margin-right:auto;
}
    </style>

  <script>
  window.console = window.console || function(t) {};
</script>

  
  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>


<style type="text/css">@-webkit-keyframes iprodevSlideInUp{0%{-webkit-transform:translate3d(0,100%,0);transform:translate3d(0,100%,0);visibility:visible}100%{-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}}@keyframes iprodevSlideInUp{0%{-webkit-transform:translate3d(0,100%,0);transform:translate3d(0,100%,0);visibility:visible}100%{-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}}.iprodevAnimated{-webkit-animation-duration:1s;animation-duration:1s;-webkit-animation-fill-mode:both;animation-fill-mode:both}.iprodevSlideInUp{-webkit-animation-name:iprodevSlideInUp;animation-name:iprodevSlideInUp}.iprodev-notification { text-align: center !important; position: fixed !important; width: 100% !important; height: 140px !important; bottom: 0 !important; background: #4696e5 !important;z-index: 1000000 !important; padding: 0 !important; margin: 0 !important; border: 0 !important; }.iprodev-notification * { font-family: 'Open Sans', Helvetica, sans-serif; !important; color: #d0e4f8 !important; line-height: normal !important; padding: 0 !important; margin: 0 !important; border: 0 !important; text-decoration: none !important; -webkit-box-sizing: border-box !important; box-sizing: border-box !important; text-transform: uppercase !important;  }.iprodev-notification a.iprodev_item { position: relative !important; display: block !important; height: 100% !important; }.iprodev-notification a.close_notify { position: absolute !important; opacity: 0; display: block !important; width: 48px !important; height: 48px !important; top: 50% !important; right: 30px !important; -webkit-transform: translateY(-50%); transform: translateY(-50%); cursor: pointer !important; -webkit-transition: opacity 0.3s !important; transition: opacity 0.3s !important; background: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/PjxzdmcgaGVpZ2h0PSIyMnB4IiB2ZXJzaW9uPSIxLjEiIHZpZXdCb3g9IjAgMCAyMiAyMiIgd2lkdGg9IjIycHgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6c2tldGNoPSJodHRwOi8vd3d3LmJvaGVtaWFuY29kaW5nLmNvbS9za2V0Y2gvbnMiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIj48dGl0bGUvPjxkZWZzPjxwYXRoIGQ9Ik0xMSwyMiBDMTcuMDc1MTMyNSwyMiAyMiwxNy4wNzUxMzI1IDIyLDExIEMyMiw0LjkyNDg2NzQ1IDE3LjA3NTEzMjUsMCAxMSwwIEM0LjkyNDg2NzQ1LDAgMCw0LjkyNDg2NzQ1IDAsMTEgQzAsMTcuMDc1MTMyNSA0LjkyNDg2NzQ1LDIyIDExLDIyIEwxMSwyMiBaIE0xMSwyMSBDMTYuNTIyODQ3OCwyMSAyMSwxNi41MjI4NDc4IDIxLDExIEMyMSw1LjQ3NzE1MjIzIDE2LjUyMjg0NzgsMSAxMSwxIEM1LjQ3NzE1MjIzLDEgMSw1LjQ3NzE1MjIzIDEsMTEgQzEsMTYuNTIyODQ3OCA1LjQ3NzE1MjIzLDIxIDExLDIxIFogTTYuNzU3MzU5MzEsMTUuOTQ5NzQ3NSBMNi4wNTAyNTI1MywxNS4yNDI2NDA3IEwxMC4yOTI4OTMyLDExIEw2LjA1MDI1MjUzLDYuNzU3MzU5MzEgTDYuNzU3MzU5MzEsNi4wNTAyNTI1MyBMMTEsMTAuMjkyODkzMiBMMTUuMjQyNjQwNyw2LjA1MDI1MjUzIEwxNS45NDk3NDc1LDYuNzU3MzU5MzEgTDExLjcwNzEwNjgsMTEgTDE1Ljk0OTc0NzUsMTUuMjQyNjQwNyBMMTUuMjQyNjQwNywxNS45NDk3NDc1IEwxMSwxMS43MDcxMDY4IEw2Ljc1NzM1OTMxLDE1Ljk0OTc0NzUgWiIgaWQ9InBhdGgtMSIvPjwvZGVmcz48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGlkPSJtaXUiIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIj48ZyBpZD0iY2lyY2xlX2Nsb3NlX2RlbGV0ZV9vdXRsaW5lX3N0cm9rZSI+PHVzZSBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIHhsaW5rOmhyZWY9IiNwYXRoLTEiLz48dXNlIGZpbGw9Im5vbmUiIHhsaW5rOmhyZWY9IiNwYXRoLTEiLz48L2c+PC9nPjwvc3ZnPg==') no-repeat 50%; background-size: 100% 100%; }.iprodev-notification:hover a.close_notify { opacity: 0.4; }.iprodev-notification a.close_notify:hover { opacity: 1; }.iprodev-notification div { position: absolute !important; padding: 20px 100px 20px 20px !important; top: 50%; left: 50%; -webkit-transform: translate(-50%, -50%); transform: translate(-50%, -50%); display: inline-block !important; width: 100% !important; max-width: 900px !important; text-align: left !important;  }.iprodev-notification h1 { font-size: 20px !important; font-weight: 400 !important; color: #FFF !important; margin-bottom: 5px !important; }.iprodev-notification span { display: block !important; font-size: 14px !important; font-weight: 400 !important; }@media screen and (max-width: 900px){.iprodev-notification {height: 120px!important;}.iprodev-notification h1{font-size:14px!important;font-weight:700!important}.iprodev-notification span{font-size:11px!important;overflow:hidden!important;height:45px!important;}}@media screen and (max-width: 480px){.iprodev-notification span{display:none!important;}}</style></head>

<body translate="no">
    
    <div class="RunndomText">
        <%--<img  alt="" runat="server" id="img1"/>--%>
        <div class="row">
            <div class="col">
                 <asp:Image runat="server" ID="imgs" CssClass="w3-animate-zoom" />
            </div>
            <div class="col">
                <h1>Happy ID : <asp:Label runat="server" ID="lb1"></asp:Label></h1><br />
                <h1>ชื่อ-นามสกุล : <asp:Label runat="server" ID="lblname"></asp:Label></h1><br/>
                <h1>ฝ่าย/แผนก :  <asp:Label runat="server" ID="lblDep"></asp:Label></h1>
            </div>
        </div>     
        
        <form runat="server">
            <asp:Button runat="server" ID="btnback" Text="Back" OnClick="btnback_Click" CssClass="btn btn-link" />
            
        </form>
    </div>
  <canvas height="904" id="confetti" width="1002"></canvas>
<a class="iprodev" href="http://iprodev.com" target="_blank">iprodev.com</a>
    <script src="//static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

<%--  <script src="https://www.iprodev.com/projects-widget.js"></script>--%>

  

    <script>
      var retina = window.devicePixelRatio,

    // Math shorthands
    PI = Math.PI,
    sqrt = Math.sqrt,
    round = Math.round,
    random = Math.random,
    cos = Math.cos,
    sin = Math.sin,

    // Local WindowAnimationTiming interface
    rAF = window.requestAnimationFrame,
    cAF = window.cancelAnimationFrame || window.cancelRequestAnimationFrame,
    _now = Date.now || function () {return new Date().getTime();};

// Local WindowAnimationTiming interface polyfill
(function (w) {
  /**
				* Fallback implementation.
				*/
  var prev = _now();
  function fallback(fn) {
    var curr = _now();
    var ms = Math.max(0, 16 - (curr - prev));
    var req = setTimeout(fn, ms);
    prev = curr;
    return req;
  }

  /**
				* Cancel.
				*/
  var cancel = w.cancelAnimationFrame
  || w.webkitCancelAnimationFrame
  || w.clearTimeout;

  rAF = w.requestAnimationFrame
  || w.webkitRequestAnimationFrame
  || fallback;

  cAF = function(id){
    cancel.call(w, id);
  };
}(window));

document.addEventListener("DOMContentLoaded", function() {
  var speed = 50,
      duration = (1.0 / speed),
      confettiRibbonCount = 11,
      ribbonPaperCount = 30,
      ribbonPaperDist = 8.0,
      ribbonPaperThick = 8.0,
      confettiPaperCount = 95,
      DEG_TO_RAD = PI / 180,
      RAD_TO_DEG = 180 / PI,
      colors = [
        ["#df0049", "#660671"],
        ["#00e857", "#005291"],
        ["#2bebbc", "#05798a"],
        ["#ffd200", "#b06c00"]
      ];

  function Vector2(_x, _y) {
    this.x = _x, this.y = _y;
    this.Length = function() {
      return sqrt(this.SqrLength());
    }
    this.SqrLength = function() {
      return this.x * this.x + this.y * this.y;
    }
    this.Add = function(_vec) {
      this.x += _vec.x;
      this.y += _vec.y;
    }
    this.Sub = function(_vec) {
      this.x -= _vec.x;
      this.y -= _vec.y;
    }
    this.Div = function(_f) {
      this.x /= _f;
      this.y /= _f;
    }
    this.Mul = function(_f) {
      this.x *= _f;
      this.y *= _f;
    }
    this.Normalize = function() {
      var sqrLen = this.SqrLength();
      if (sqrLen != 0) {
        var factor = 1.0 / sqrt(sqrLen);
        this.x *= factor;
        this.y *= factor;
      }
    }
    this.Normalized = function() {
      var sqrLen = this.SqrLength();
      if (sqrLen != 0) {
        var factor = 1.0 / sqrt(sqrLen);
        return new Vector2(this.x * factor, this.y * factor);
      }
      return new Vector2(0, 0);
    }
  }
  Vector2.Lerp = function(_vec0, _vec1, _t) {
    return new Vector2((_vec1.x - _vec0.x) * _t + _vec0.x, (_vec1.y - _vec0.y) * _t + _vec0.y);
  }
  Vector2.Distance = function(_vec0, _vec1) {
    return sqrt(Vector2.SqrDistance(_vec0, _vec1));
  }
  Vector2.SqrDistance = function(_vec0, _vec1) {
    var x = _vec0.x - _vec1.x;
    var y = _vec0.y - _vec1.y;
    return (x * x + y * y + z * z);
  }
  Vector2.Scale = function(_vec0, _vec1) {
    return new Vector2(_vec0.x * _vec1.x, _vec0.y * _vec1.y);
  }
  Vector2.Min = function(_vec0, _vec1) {
    return new Vector2(Math.min(_vec0.x, _vec1.x), Math.min(_vec0.y, _vec1.y));
  }
  Vector2.Max = function(_vec0, _vec1) {
    return new Vector2(Math.max(_vec0.x, _vec1.x), Math.max(_vec0.y, _vec1.y));
  }
  Vector2.ClampMagnitude = function(_vec0, _len) {
    var vecNorm = _vec0.Normalized;
    return new Vector2(vecNorm.x * _len, vecNorm.y * _len);
  }
  Vector2.Sub = function(_vec0, _vec1) {
    return new Vector2(_vec0.x - _vec1.x, _vec0.y - _vec1.y, _vec0.z - _vec1.z);
  }

  function EulerMass(_x, _y, _mass, _drag) {
    this.position = new Vector2(_x, _y);
    this.mass = _mass;
    this.drag = _drag;
    this.force = new Vector2(0, 0);
    this.velocity = new Vector2(0, 0);
    this.AddForce = function(_f) {
      this.force.Add(_f);
    }
    this.Integrate = function(_dt) {
      var acc = this.CurrentForce(this.position);
      acc.Div(this.mass);
      var posDelta = new Vector2(this.velocity.x, this.velocity.y);
      posDelta.Mul(_dt);
      this.position.Add(posDelta);
      acc.Mul(_dt);
      this.velocity.Add(acc);
      this.force = new Vector2(0, 0);
    }
    this.CurrentForce = function(_pos, _vel) {
      var totalForce = new Vector2(this.force.x, this.force.y);
      var speed = this.velocity.Length();
      var dragVel = new Vector2(this.velocity.x, this.velocity.y);
      dragVel.Mul(this.drag * this.mass * speed);
      totalForce.Sub(dragVel);
      return totalForce;
    }
  }

  function ConfettiPaper(_x, _y) {
    this.pos = new Vector2(_x, _y);
    this.rotationSpeed = (random() * 600 + 800);
    this.angle = DEG_TO_RAD * random() * 360;
    this.rotation = DEG_TO_RAD * random() * 360;
    this.cosA = 1.0;
    this.size = 5.0;
    this.oscillationSpeed = (random() * 1.5 + 0.5);
    this.xSpeed = 40.0;
    this.ySpeed = (random() * 60 + 50.0);
    this.corners = new Array();
    this.time = random();
    var ci = round(random() * (colors.length - 1));
    this.frontColor = colors[ci][0];
    this.backColor = colors[ci][1];
    for (var i = 0; i < 4; i++) {
      var dx = cos(this.angle + DEG_TO_RAD * (i * 90 + 45));
      var dy = sin(this.angle + DEG_TO_RAD * (i * 90 + 45));
      this.corners[i] = new Vector2(dx, dy);
    }
    this.Update = function(_dt) {
      this.time += _dt;
      this.rotation += this.rotationSpeed * _dt;
      this.cosA = cos(DEG_TO_RAD * this.rotation);
      this.pos.x += cos(this.time * this.oscillationSpeed) * this.xSpeed * _dt
      this.pos.y += this.ySpeed * _dt;
      if (this.pos.y > ConfettiPaper.bounds.y) {
        this.pos.x = random() * ConfettiPaper.bounds.x;
        this.pos.y = 0;
      }
    }
    this.Draw = function(_g) {
      if (this.cosA > 0) {
        _g.fillStyle = this.frontColor;
      } else {
        _g.fillStyle = this.backColor;
      }
      _g.beginPath();
      _g.moveTo((this.pos.x + this.corners[0].x * this.size) * retina, (this.pos.y + this.corners[0].y * this.size * this.cosA) * retina);
      for (var i = 1; i < 4; i++) {
        _g.lineTo((this.pos.x + this.corners[i].x * this.size) * retina, (this.pos.y + this.corners[i].y * this.size * this.cosA) * retina);
      }
      _g.closePath();
      _g.fill();
    }
  }
  ConfettiPaper.bounds = new Vector2(0, 0);

  function ConfettiRibbon(_x, _y, _count, _dist, _thickness, _angle, _mass, _drag) {
    this.particleDist = _dist;
    this.particleCount = _count;
    this.particleMass = _mass;
    this.particleDrag = _drag;
    this.particles = new Array();
    var ci = round(random() * (colors.length - 1));
    this.frontColor = colors[ci][0];
    this.backColor = colors[ci][1];
    this.xOff = (cos(DEG_TO_RAD * _angle) * _thickness);
    this.yOff = (sin(DEG_TO_RAD * _angle) * _thickness);
    this.position = new Vector2(_x, _y);
    this.prevPosition = new Vector2(_x, _y);
    this.velocityInherit = (random() * 2 + 4);
    this.time = random() * 100;
    this.oscillationSpeed = (random() * 2 + 2);
    this.oscillationDistance = (random() * 40 + 40);
    this.ySpeed = (random() * 40 + 80);
    for (var i = 0; i < this.particleCount; i++) {
      this.particles[i] = new EulerMass(_x, _y - i * this.particleDist, this.particleMass, this.particleDrag);
    }
    this.Update = function(_dt) {
      var i = 0;
      this.time += _dt * this.oscillationSpeed;
      this.position.y += this.ySpeed * _dt;
      this.position.x += cos(this.time) * this.oscillationDistance * _dt;
      this.particles[0].position = this.position;
      var dX = this.prevPosition.x - this.position.x;
      var dY = this.prevPosition.y - this.position.y;
      var delta = sqrt(dX * dX + dY * dY);
      this.prevPosition = new Vector2(this.position.x, this.position.y);
      for (i = 1; i < this.particleCount; i++) {
        var dirP = Vector2.Sub(this.particles[i - 1].position, this.particles[i].position);
        dirP.Normalize();
        dirP.Mul((delta / _dt) * this.velocityInherit);
        this.particles[i].AddForce(dirP);
      }
      for (i = 1; i < this.particleCount; i++) {
        this.particles[i].Integrate(_dt);
      }
      for (i = 1; i < this.particleCount; i++) {
        var rp2 = new Vector2(this.particles[i].position.x, this.particles[i].position.y);
        rp2.Sub(this.particles[i - 1].position);
        rp2.Normalize();
        rp2.Mul(this.particleDist);
        rp2.Add(this.particles[i - 1].position);
        this.particles[i].position = rp2;
      }
      if (this.position.y > ConfettiRibbon.bounds.y + this.particleDist * this.particleCount) {
        this.Reset();
      }
    }
    this.Reset = function() {
      this.position.y = -random() * ConfettiRibbon.bounds.y;
      this.position.x = random() * ConfettiRibbon.bounds.x;
      this.prevPosition = new Vector2(this.position.x, this.position.y);
      this.velocityInherit = random() * 2 + 4;
      this.time = random() * 100;
      this.oscillationSpeed = random() * 2.0 + 1.5;
      this.oscillationDistance = (random() * 40 + 40);
      this.ySpeed = random() * 40 + 80;
      var ci = round(random() * (colors.length - 1));
      this.frontColor = colors[ci][0];
      this.backColor = colors[ci][1];
      this.particles = new Array();
      for (var i = 0; i < this.particleCount; i++) {
        this.particles[i] = new EulerMass(this.position.x, this.position.y - i * this.particleDist, this.particleMass, this.particleDrag);
      }
    }
    this.Draw = function(_g) {
      for (var i = 0; i < this.particleCount - 1; i++) {
        var p0 = new Vector2(this.particles[i].position.x + this.xOff, this.particles[i].position.y + this.yOff);
        var p1 = new Vector2(this.particles[i + 1].position.x + this.xOff, this.particles[i + 1].position.y + this.yOff);
        if (this.Side(this.particles[i].position.x, this.particles[i].position.y, this.particles[i + 1].position.x, this.particles[i + 1].position.y, p1.x, p1.y) < 0) {
          _g.fillStyle = this.frontColor;
          _g.strokeStyle = this.frontColor;
        } else {
          _g.fillStyle = this.backColor;
          _g.strokeStyle = this.backColor;
        }
        if (i == 0) {
          _g.beginPath();
          _g.moveTo(this.particles[i].position.x * retina, this.particles[i].position.y * retina);
          _g.lineTo(this.particles[i + 1].position.x * retina, this.particles[i + 1].position.y * retina);
          _g.lineTo(((this.particles[i + 1].position.x + p1.x) * 0.5) * retina, ((this.particles[i + 1].position.y + p1.y) * 0.5) * retina);
          _g.closePath();
          _g.stroke();
          _g.fill();
          _g.beginPath();
          _g.moveTo(p1.x * retina, p1.y * retina);
          _g.lineTo(p0.x * retina, p0.y * retina);
          _g.lineTo(((this.particles[i + 1].position.x + p1.x) * 0.5) * retina, ((this.particles[i + 1].position.y + p1.y) * 0.5) * retina);
          _g.closePath();
          _g.stroke();
          _g.fill();
        } else if (i == this.particleCount - 2) {
          _g.beginPath();
          _g.moveTo(this.particles[i].position.x * retina, this.particles[i].position.y * retina);
          _g.lineTo(this.particles[i + 1].position.x * retina, this.particles[i + 1].position.y * retina);
          _g.lineTo(((this.particles[i].position.x + p0.x) * 0.5) * retina, ((this.particles[i].position.y + p0.y) * 0.5) * retina);
          _g.closePath();
          _g.stroke();
          _g.fill();
          _g.beginPath();
          _g.moveTo(p1.x * retina, p1.y * retina);
          _g.lineTo(p0.x * retina, p0.y * retina);
          _g.lineTo(((this.particles[i].position.x + p0.x) * 0.5) * retina, ((this.particles[i].position.y + p0.y) * 0.5) * retina);
          _g.closePath();
          _g.stroke();
          _g.fill();
        } else {
          _g.beginPath();
          _g.moveTo(this.particles[i].position.x * retina, this.particles[i].position.y * retina);
          _g.lineTo(this.particles[i + 1].position.x * retina, this.particles[i + 1].position.y * retina);
          _g.lineTo(p1.x * retina, p1.y * retina);
          _g.lineTo(p0.x * retina, p0.y * retina);
          _g.closePath();
          _g.stroke();
          _g.fill();
        }
      }
    }
    this.Side = function(x1, y1, x2, y2, x3, y3) {
      return ((x1 - x2) * (y3 - y2) - (y1 - y2) * (x3 - x2));
    }
  }
  ConfettiRibbon.bounds = new Vector2(0, 0);
  confetti = {};
  confetti.Context = function(id) {
    var i = 0;
    var canvas = document.getElementById(id);
    var canvasParent = canvas.parentNode;
    var canvasWidth = canvasParent.offsetWidth;
    var canvasHeight = canvasParent.offsetHeight;
    canvas.width = canvasWidth * retina;
    canvas.height = canvasHeight * retina;
    var context = canvas.getContext('2d');
    var interval = null;
    var confettiRibbons = new Array();
    ConfettiRibbon.bounds = new Vector2(canvasWidth, canvasHeight);
    for (i = 0; i < confettiRibbonCount; i++) {
      confettiRibbons[i] = new ConfettiRibbon(random() * canvasWidth, -random() * canvasHeight * 2, ribbonPaperCount, ribbonPaperDist, ribbonPaperThick, 45, 1, 0.05);
    }
    var confettiPapers = new Array();
    ConfettiPaper.bounds = new Vector2(canvasWidth, canvasHeight);
    for (i = 0; i < confettiPaperCount; i++) {
      confettiPapers[i] = new ConfettiPaper(random() * canvasWidth, random() * canvasHeight);
    }
    this.resize = function() {
      canvasWidth = canvasParent.offsetWidth;
      canvasHeight = canvasParent.offsetHeight;
      canvas.width = canvasWidth * retina;
      canvas.height = canvasHeight * retina;
      ConfettiPaper.bounds = new Vector2(canvasWidth, canvasHeight);
      ConfettiRibbon.bounds = new Vector2(canvasWidth, canvasHeight);
    }
    this.start = function() {
      this.stop()
      var context = this;
      this.update();
    }
    this.stop = function() {
      cAF(this.interval);
    }
    this.update = function() {
      var i = 0;
      context.clearRect(0, 0, canvas.width, canvas.height);
      for (i = 0; i < confettiPaperCount; i++) {
        confettiPapers[i].Update(duration);
        confettiPapers[i].Draw(context);
      }
      for (i = 0; i < confettiRibbonCount; i++) {
        confettiRibbons[i].Update(duration);
        confettiRibbons[i].Draw(context);
      }
      this.interval = rAF(function() {
        confetti.update();
      });
    }
  }
  var confetti = new confetti.Context('confetti');
  confetti.start();
  window.addEventListener('resize', function(event){
    confetti.resize();
  });
});
      //# sourceURL=pen.js
    </script>



  
  

  <script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>



 <div>
     <audio id="audio" controls="controls" autoplay="autoplay" style="display:none;">
                <source id="audioSource" src="sound/Soundtobm.mp3" />
            </audio>
 </div>
</body><%--<<%--div class="iprodev-notification iprodevSlideInUp iprodevAnimated"><a href="http://www.ilightbox.net/" target="_blank" class="iprodev_item">
    <div><h1>iLightBox · Revolutionary Lightbox Plugin</h1><span>iLightBox allows you to easily create the most beautiful overlay windows using the jQuery Javascript library. By combining support for a wide range of media with gorgeous skins and a user-friendly API, iLightBox aims to push the Lightbox concept as far as possible.</span></div></a><a class="close_notify" title="Close"></a>
    </div>--%>
    </html>