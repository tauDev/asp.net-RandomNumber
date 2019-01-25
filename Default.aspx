<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DemoRandom.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.9.1.js"></script>
 <%-- <script type="text/javascript" src="//code.jquery.com/jquery-1.6.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>    
   <%-- <script src="Scripts/jquery-1.6.js"></script>--%>
      <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Style.css" rel="stylesheet" />
<script type="text/javascript">
   $(window).load(function(){
      
$(document).ready(function() {
    animateDiv($('.message0'));
    animateDiv($('.message1'));
    animateDiv($('.message2'));
    animateDiv($('.message3'));
    animateDiv($('.message4'));
    animateDiv($('.message5'));
    animateDiv($('.message6'));
    animateDiv($('.message7'));
    animateDiv($('.message8'));
    animateDiv($('.message9'));
    animateDiv($('.message10'));
    animateDiv($('.message11'));
   

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

    var speedModifier = 0.3;

    var speed = Math.ceil(greatest / speedModifier);

    return speed;

}

    });
    </script>
    <script>
        window.load = function () {
            var a1 = document.getElementById('audio');
            var s1 = document.getElementById('audioSource');
            s1.scr = "sound/Kalimba.mp3";
            a1.load();
            a1.play();
        }
        $(document).ready(function () {
            //$("#audio").trigger('click');
            //$('audio')[0].play();
            $('#playBtn').click(function (e) {
                var elm = e.target;
                var audio = document.getElementById('audio');
                var source = document.getElementById('audioSource');
               
                source.src = "sound/slotmachine.mp3";
                audio.loop = true;
                audio.load();
                //setTimeout(audio.find('audio')[0].play(), 100);
                //audio.play();
                 window.setTimeout(function () {
                source.src = "sound/ragnarokonlinelevelupsound.mp3";
                audio.loop = true;
                audio.load();
                    },7000);
            });
            //$("#audioSource").attr("src", "sound/Kalimba.mp3");
            //var audi = $("#audio");

            //audi[0].load();
             
        });

     </script>
</head>
<body>
    <form id="form1" runat="server">
   <div class="RunndomText">
       <ul class="slot">
        <li>0</li>
        <li>1</li>
        <li>2</li>
        <li>3</li>
        <li>4</li>
        <li>5</li>
        <li>6</li>
        <li>7</li>
        <li>8</li>
        <li>9</li>    
    </ul>
    <input type="button" class="btn btn-info" id="playBtn" value="Play" runat="server">               
    <br />
    <div id="resul" class="text-hide"></div>
</div>             
        </div>
        <div runat="server" id="TopSlot">
         
        </div> 
        <div>
          <%-- <src="sound/Kalimba.mp3" loop="true" autorun="true" hidden="true" id="emb1" />--%>
           <%--<embed src="sound/slotmachine.mp3" autorun="false" loop="true" hidden="false" id="emb2" />--%> 
            <audio id="audio" controls="controls" autoplay="autoplay" style="display:none;">
                <source id="audioSource" src="sound/Kalimba.mp3" />
            </audio>
        </div>
        <div id="parent" runat="server">
            <%--<div class="message"><img src="images/FIT0006.JPG" /></div>
             <div class="a"><img src="images/FIT0008.JPG" /></div>
            <div class="b"><img src="images/FIT0009.JPG" /></div>--%>
           <%-- <div class="message"><img src="images/FIT0006.JPG" /></div>
           
            <div class="message"><img src="images/FIT0010.JPG" /></div>
            <div class="message"><img src="images/FIT0011.JPG" /></div>
            <div class="message"><img src="images/FIT0012.JPG" /></div>--%>
           <%-- <div class="message"><img src="users/FIT0007.jpg" /></div>
            <div class="message"><img src="users/FHR0092.jpg" /></div>
            <div class="message"><img src="users/FPD0010.jpg" /></div>
            <div class="message"><img src="users/FLG0077.jpg" /></div>--%>
        </div>
       
    </form>

 <script type="text/javascript">
 var item;
var getNewNumber = function( spinner ) {
    /* Some ASYNC!! ajax stuff, than when done: */
    //the returned data is a array, eg [1,3,4]
    //for the spinner to stop at 134
    
      $.ajax({
            type: "POST",
            url: '<%=ResolveUrl("~/Default.aspx/GETDATAALL")%>',
            contentType: 'application/json; charset=utf-8',
            success: function (response) {
                item = response.d;
               var f = parseInt(item.substring(0, 1));
               var s = parseInt(item.substring(1, 2));
                var t = parseInt(item.substring(2, 3));
                console.log(f + "," + s + "," + t);
                spinner.options.endNumbers = [f,s,t];
            },
            failure: function (response) {

            }
        });
	
};

$(document).ready(function () {
    $('.slot').jSlots({
        spinner: '#playBtn',
        endNumbers: [],
        onStart: getNewNumber
    });
});

/*
 * jQuery jSlots Plugin
 * http://matthewlein.com/jslot/
 * Copyright (c) 2011 Matthew Lein
 * Version: 1.0.2 (7/26/2012)
 * Dual licensed under the MIT and GPL licenses
 * Requires: jQuery v1.4.1 or later
 */

(function ($) {

    $.jSlots = function (el, options) {

        var base = this;

        base.$el = $(el);
        base.el = el;

        base.$el.data("jSlots", base);

        base.init = function () {

            base.options = $.extend({}, $.jSlots.defaultOptions, options);

            base.setup();
            base.bindEvents();

        };


        // --------------------------------------------------------------------- //
        // DEFAULT OPTIONS
        // --------------------------------------------------------------------- //

        $.jSlots.defaultOptions = {
            number: 3, // Number: number of slots
            winnerNumber: 1, // Number or Array: list item number(s) upon which to trigger a win, 1-based index, NOT ZERO-BASED
            spinner: '', // CSS Selector: element to bind the start event to
            spinEvent: 'click', // String: event to start slots on this event
            onStart: $.noop, // Function: runs on spin start,
            onEnd: $.noop, // Function: run on spin end. It is passed (finalNumbers:Array). finalNumbers gives the index of the li each slot stopped on in order.
            onWin: $.noop, // Function: run on winning number. It is passed (winCount:Number, winners:Array)
            easing: 'swing', // String: easing type for final spin
            time: 7000, // Number: total time of spin animation
            loops: 6, // Number: times it will spin during the animation
            endNumbers: [] // *ADDED* Array: list an array matching the number of slots. Pass empty array for random results.
        };

        // --------------------------------------------------------------------- //
        // HELPERS
        // --------------------------------------------------------------------- //

        base.randomRange = function (low, high) {
            
            return Math.floor(Math.random() * (1 + high - low)) + low;
        };

        // --------------------------------------------------------------------- //
        // VARS
        // --------------------------------------------------------------------- //

        base.isSpinning = false;
        base.spinSpeed = 0;
        base.winCount = 0;
        base.doneCount = 0;

        base.$liHeight = 0;
        base.$liWidth = 0;

        base.winners = [];
        base.allSlots = [];

        // --------------------------------------------------------------------- //
        // FUNCTIONS
        // --------------------------------------------------------------------- //


        base.setup = function () {

            // set sizes

            var $list = base.$el;
            var $li = $list.find('li').first();
            console.log($li.outerHeight());
            base.$liHeight = $li.outerHeight();
            base.$liWidth = $li.outerWidth();

            base.liCount = base.$el.children().length;

            base.listHeight = base.$liHeight * base.liCount;

            base.increment = (base.options.time / base.options.loops) / base.options.loops;

            $list.css('position', 'relative');

            $li.clone().appendTo($list);

            base.$wrapper = $list.wrap('<div class="jSlots-wrapper"></div>').parent();

            // remove original, so it can be recreated as a Slot
            base.$el.remove();

            // clone lists
            for (var i = base.options.number - 1; i >= 0; i--) {
                base.allSlots.push(new base.Slot(i));
            }

        };

        base.bindEvents = function () {
            $(base.options.spinner).bind(base.options.spinEvent, function (event) {
                if (!base.isSpinning) {
                    base.playSlots();
                }
            });
        };

        // Slot contstructor
        base.Slot = function () {

            this.spinSpeed = 0;
            this.el = base.$el.clone().appendTo(base.$wrapper)[0];
            this.$el = $(this.el);
            this.loopCount = 0;
            this.number = 0;
        };


        base.Slot.prototype = {

            // do one rotation
            spinEm: function () {

                var that = this;

                that.$el.css('top', -base.listHeight)
                    .animate({
                    'top': '0px'
                }, that.spinSpeed, 'linear', function () {
                    that.lowerSpeed();
                });

            },

            lowerSpeed: function () {

                this.spinSpeed += base.increment;
                this.loopCount++;

                if (this.loopCount < base.options.loops) {

                    this.spinEm();
                  
                } else {
					
                    this.finish();
                    window.setTimeout(function () {
                        console.log(item);
                        window.open("frmcongratulations.aspx?ID=" + item + "&N=" + item, "_self");
                    },8000);
                    

                }
            },

            // final rotation <--- Key
            finish: function () {

                var that = this;

                // Checks if endNumbers array length is greater than 0. If not selects a random number.
                var endNum;
                if (base.options.endNumbers.length > 0) {
                    endNum = base.options.endNumbers[base.allSlots.indexOf(this)];
                } else {
                    endNum = base.randomRange(1, base.liCount);
                }

                var finalPos = -(((base.$liHeight * endNum) - base.$liHeight) + base.$liHeight);
                //if (endNum === 0) {
                //    finalPos = -(((base.$liHeight * endNum) - base.$liHeight) + base.$liHeight);
                //} else {
                //    finalPos = -(((base.$liHeight * endNum) - base.$liHeight) + base.$liHeight);
                    
                //}

                
                
                var finalSpeed = ((this.spinSpeed * 0.5) * (base.liCount)) / endNum;

                that.$el.css('top', -base.listHeight)
                    .animate({
                    'top': finalPos
                }, finalSpeed, base.options.easing, function () {
                    base.checkWinner(endNum, that);
                });
                console.log(finalPos);   
            }

        };

        base.checkWinner = function (endNum, slot) {

            base.doneCount++;
            // set the slot number to whatever it ended on
            slot.number = endNum;

            // if its in the winners array
            if (
            ($.isArray(base.options.winnerNumber) && base.options.winnerNumber.indexOf(endNum) > -1) || endNum === base.options.winnerNumber) {

                // its a winner!
                base.winCount++;
                base.winners.push(slot.$el);

            }

            if (base.doneCount === base.options.number) {

                var finalNumbers = [];

                $.each(base.allSlots, function (index, val) {
                    finalNumbers[index] = val.number;
                });

                if ($.isFunction(base.options.onEnd)) {
                    base.options.onEnd(finalNumbers);
                }

                if (base.winCount && $.isFunction(base.options.onWin)) {
                    base.options.onWin(base.winCount, base.winners, finalNumbers);
                }
                base.isSpinning = false;
            }
        };


        base.playSlots = function () {

            base.isSpinning = true;
            base.winCount = 0;
            base.doneCount = 0;
            base.winners = [];

            if ($.isFunction(base.options.onStart)) {
                base.options.onStart( base );
            }

            $.each(base.allSlots, function (index, val) {
                this.spinSpeed = 0;
                this.loopCount = 0;
                this.spinEm();
            });

        };


        base.onWin = function () {
            if ($.isFunction(base.options.onWin)) {
                base.options.onWin();
            }
        };


        // Run initializer
        base.init();
    };


    // --------------------------------------------------------------------- //
    // JQUERY FN
    // --------------------------------------------------------------------- //

    $.fn.jSlots = function (options) {
        if (this.length) {
            return this.each(function () {
                (new $.jSlots(this, options));
            });
        }
    };

})(window.jQuery);

</script>
    <%--<script src="https://static.codepen.io/assets/editor/live/css_reload-2a5c7ad0fe826f66e054c6020c99c1e1c63210256b6ba07eb41d7a4cb0d0adab.js"></script>--%>
</body>
</html>
