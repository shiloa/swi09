
/******************************************************************************
 * Happens when document first loads
 ******************************************************************************/
var shiftIntervalID = 0;
// $(window).load( function() {
//     arrangeBoxes();
//     setInterval('shiftLeft()', 2000);
//     
//    
//     // if (!$.cookie('intro')) {
//     //    playIntro()
//     //     } else {
//     //         
//     //     }
//     
//     // $('#slider a').lightBox({fixedNavigation : true});
//     
//     // $.cookie('intro', 'true', { expires : 1 });
//     // choose between languages
//     // decideLanguage();
// });
function hideAll() {
    $('#content').hide();
    $('#nav').hide();
    // $('#slider').hide();
    $('#main').hide();
    $('#main-quote img').hide();
    $('#footer').hide()
    $('.box').css('visibility', 'hidden');
}

function playIntro() {
     $('#content').fadeIn(1000);
     // show the nav bar
     setTimeout( "$('#nav').show('slide', { direction: 'left' }, 1000);", 1000);
     // show the main div
     setTimeout( "$('#main').show('slide', { direction : 'right' }, 1000);", 1000);
     // arrange all the image boxes in the slider
     setTimeout( "arrangeBoxes()", 2000);
     setTimeout( "$('#slider').hide()", 2000);
     setTimeout( "$('.box').css('visibility', 'visible');", 2000);
     setTimeout( "$('#slider').fadeIn(1000)", 2000);
     // show the footer
     setTimeout( "$('#main-quote img').fadeIn(1000);", 2500);     
     setTimeout( "$('#footer').fadeIn(1000);", 3500);     
}

// introduce the navigation bar
function showNavBar() {
    $('#nav').show('slide', { direction: 'left' }, 1000, showMain());
}

// intro the main div
function showMain() {
//    $('#main').show('slide', { direction: 'right' }, 1000);
    $('#main').fadeIn(1000, showFooter());
}

// intro the image slider
function showSlider() {
    $('#slider').show('slide', { direction: 'left' }, 1000);
}

function showFooter() {
    $('#footer').fadeIn(500, arrangeBoxes());
}

// arrange the boxes to be aligned in a row
function arrangeBoxes() {
    $('.box').each( function(i, item) {
        var position = $('#slider').position().left + $('#slider-container').width()/2 + 20 + i * ( $(item).width() + 10 );
        // var position = $('#slider').position().left + i * ( $(item).width() + 10 );
        $(item).css('left', position + 'px');
        
        var img = $(item).children().children();
        var img_height = $(img).height();
        var item_height = $(item).height();        
        var new_height = parseInt( (item_height - img_height) / 2 ) + 'px';
        $(img).css('margin-top', new_height);
    });
    ////////////
    setInterval('shiftLeft()', 2000);
}

// shifts all the boxes to the left, then checks if any left the window
function shiftLeft() {
    $('.box').animate( {'left' : "-=100px"}, 2000, 'linear', checkEdge() );
}

function shiftLeft2() {
    $('.box').animate( {'left' : "-=100px"}, 2000, 'linear' );
}

// if the box is outside the window, move it to the end
function checkEdge() {
    var windowsLeftEdge = $('#slider').position().left;
    var newPosition = getNewPosition();
    
    $('.box').each( function(i, box ) {
        // var box = $('.box:first');
        var boxRightEdge = $(box).position().left + $(box).width();    
        if ( parseFloat(boxRightEdge) < parseFloat(windowsLeftEdge) ) { 
            $(box).css('left', newPosition);
            $(box).remove().appendTo('#slider');
        }
    });
    
}

// returns the new location for the box that exited the window
function getNewPosition() {
    return ($('.box:last').position().left + $('.box:last').outerWidth() + 10);
}

function centerThumbs() {
    // center images and text inside their parent td
    $('.image-thumb').each( function(i, item) {
        var td_width = $(item).innerWidth();
        var img = $('.image-thumb img')[i];
        var span = $('.image-thumb span')[i];
        var img_width = $(img).innerWidth();
        var span_width = $(span).innerWidth();
        var new_img_pos = parseInt((td_width - img_width)/2) + 'px';
        var new_span_pos = parseInt((td_width - span_width)/2) + 'px';
        $(img).css('margin-right', new_img_pos);
        $(span).css('margin-right', new_span_pos);
    });
}

