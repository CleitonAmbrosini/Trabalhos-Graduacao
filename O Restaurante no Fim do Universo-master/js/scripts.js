/* ======================= parallax =============*/
$(function(){
	$(window).scroll(function(){
		var window_scrolltop = $(this).scrollTop();
		
		// Passa por cada elemento com a classe .parallax
		$('.parallax').each(function(){
			var obj = $(this);
			
			// Garante que apenas trabalhemos no elemento que está visível na tela
			if ( window_scrolltop >= obj.position().top - obj.height() 
				&& window_scrolltop <= obj.position().top + obj.height()) {
				
				// O atributo data-divisor vai definir a velocidade do efeito
				var divisor = typeof obj.attr('data-divisor') == 'undefined' ? 4 : obj.attr('data-divisor');
				
				// Corrige a diferença do primeiro elemento
				if ( obj.is(':first-child') ) {
					var bg_pos = ( window_scrolltop - obj.position().top ) / divisor;
				} else {
					var bg_pos = ( window_scrolltop - obj.position().top + ( obj.height() - 100 ) ) / divisor;
				}
				
				// Modifica a posição do bg
				obj.css({
					'background-position' : '50% -' + bg_pos + 'px'
				});
				
				// Animação do primeiro texto
				obj.children('.text').css({
					'bottom' : ( window_scrolltop - obj.position().top + 100 ) + 'px'
				});
				
			} // Garante que apenas trabalhemos no elemento que está visível na tela
		}); // $('.parallax').each(function(){ ...
	}); // $(window).scroll(function(){ ...
}); // jQuery

/* ============== scrollsuave ================= */
$(function() {
    $('.scrollsuave').bind('click',function(event){
        var $anchor = $(this);        
            $('html, body').stop().animate({scrollTop: $($anchor.attr('href')).offset().top}, 1300,'swing');
    });
});

/* ======================== menu =================== */
$(document).ready(function() {
  $(document).scroll(function() {
    if ($(this).scrollTop() > 300) {
      $("#menu").addClass("menuanimado");
    } else {
      $("#menu").removeClass("menuanimado");
    }
  });
});

/*======================== formulario ===================*/
var working = false;
$('.login').on('submit', function(e) {
    e.preventDefault();
    if (working) return;
    working = true;
    
    var $this = $(this),
    $state = $this.find('button > .state');
    $this.addClass('loading');
    $state.html('Authenticating');
    setTimeout(function() {
        $this.addClass('ok');
        $state.html('Welcome back!');
        setTimeout(function() {
          $state.html('Log in');
          $this.removeClass('ok loading');
          working = false;
        }, 4000);
    }, 3000);
});

/* ========== MENU DE BUSCAS ===================*/

/* busca pratos */
$(document).ready(function(){
    $(".filter-button-pratos").click(function(){
        var value = $(this).attr('data-filter');
        if(value == "todas"){
            $('.filter-pratos').show('1000');
        }
        else{
            $(".filter-pratos").not('.'+value).hide('3000');
            $('.filter-pratos').filter('.'+value).show('3000');
        }
    });
    if ($(".filter-button-pratos").removeClass("active")) {
        $(this).removeClass("active");
    }
    $(this).addClass("active");
});

/* busca drinks */
$(document).ready(function(){
    $(".filter-button-drinks").click(function(){
        var value = $(this).attr('data-filter');
        if(value == "todas"){
            $('.filter-drinks').show('1000');
        }
        else{
            $(".filter-drinks").not('.'+value).hide('3000');
            $('.filter-drinks').filter('.'+value).show('3000');
        }
    });
    if ($(".filter-button-drinks").removeClass("active")) {
        $(this).removeClass("active");
    }
    $(this).addClass("active");
});

/* busca sobremesas */
$(document).ready(function(){
    $(".filter-button-sobremesas").click(function(){
        var value = $(this).attr('data-filter');
        if(value == "todas"){
            $('.filter-sobremesas').show('1000');
        }
        else{
            $(".filter-sobremesas").not('.'+value).hide('3000');
            $('.filter-sobremesas').filter('.'+value).show('3000');
        }
    });
    if ($(".filter-button-sobremesas").removeClass("active")) {
        $(this).removeClass("active");
    }
    $(this).addClass("active");
});

/* busca vegetarianas */
$(document).ready(function(){
    $(".filter-button-veg").click(function(){
        var value = $(this).attr('data-filter');
        if(value == "todas"){
            $('.filter-veg').show('1000');
        }
        else{
            $(".filter-veg").not('.'+value).hide('3000');
            $('.filter-veg').filter('.'+value).show('3000');
        }
    });
    if ($(".filter-button-veg").removeClass("active")) {
        $(this).removeClass("active");
    }
    $(this).addClass("active");
});
