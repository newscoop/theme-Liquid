/* jQuery
    ``````````````````````````````````````````````````````````````````````````` */

$(document).ready(function() {


    $('.tabs_box').each(function(index, el) {
        $(el).hsTabs({
            'headers': $(el).find('.tabs_menu li'),
            'contents': $(el).find('.tabs_contents .tabs_content')
        });
    });


    $('.people_box').hsTabs({
        'headers': $('.people_box .tabs_menu li'),
        'contents': $('.people_box .tabs_contents .tab_content')
    });

    $('.people_box').hsSlide({
        'elements_wrapper': $('.people_box .people_wrapper'),
        'elements_container': $('.people_box .people'),
        'elements': $('.people_box .people .span3'),
        'per_row': 4,
        'arrow_left': $('.people_box .navigation').find('.arrow_left'),
        'arrow_right': $('.people_box .navigation').find('.arrow_right'),
        'navigation': $('.people_box .navigation').find('.dot')
    });

    $('.contact_boxes .box').setAllToMaxHeight();

    $('#login_popup').hsPopup({
        'open_popup_link': $('.open_login_popup'),
        'close_popup_link': $('#login_popup .close')
    });


    var frm = $('#loginform');
    frm.submit(function() {
        $.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: frm.serialize(),
            success: function(data) {
                if (data == "ERROR") {
                    frm.find("input[type=email], input[type=password]").css("border", "1px solid red");
                } else {
                    frm.css("display", "none");
                    $("#logininfo").css("display", "block");
                    $('#login_popup').fadeOut();
                    $("#cover").fadeOut();
                    $("#registerButtonFront").css("display", "none");
                }
            }
        });

        return false;
    });

    $('#outer_side_menu').scrollToFixed();
    $('#top_menu').hsSubMenu();
});

(function($) {

    /* ------------- */
    /* hsSubMenu */
    /* ------------- */

    $.fn.hsSubMenu = function(options) {

        var settings = {

        };

        $.extend(settings, options);

        var menu = $(this);
        var hide_menu = false;

        menu.find('.menu > li').each(function(index, el) {

            if ($(el).find('ul').length > 0) {
                if (!$(el).hasClass('current')) {
                    $(el).hover(
                        function() {
                            clearTimeout(hide_menu);
                            menu.find('.menu > li ul').css('display', 'none');
                            $(el).find('ul').css('display', 'block');

                            //menu.find('.menu > li ul').slideUp();
                            //$(el).find('ul').slideDown();

                            if (!menu.hasClass('open_submenu')) {
                                //menu.animate.({'height': 60});
                                menu.css({
                                    'height': 60
                                });
                            }
                        },
                        function() {
                            hide_menu = setTimeout(function() {
                                $(el).find('ul').css('display', 'none');
                                //$(el).find('ul').slideUp();

                                if (!menu.hasClass('open_submenu')) {
                                    //menu.animate.({'height': 44});
                                    menu.css({
                                        'height': 44
                                    });
                                }
                            }, 500);

                        }
                    );


                }
            }
        });
    },

    /* ------------- */
    /* hsPopup */
    /* ------------- */

    $.fn.hsPopup = function(options) {

        var settings = {

        };

        $.extend(settings, options);

        var popup = $(this);
        var cover = $('#cover');

        settings['open_popup_link'].click(function(event) {
            event.preventDefault();

            open_popup($(this));
        });

        cover.click(function(event) {
            event.preventDefault();

            close_popup($(this));
        });

        settings['close_popup_link'].click(function(event) {
            event.preventDefault();

            close_popup($(this));
        });


        function open_popup() {
            popup.fadeIn();
            cover.fadeIn();
        }

        function close_popup() {
            popup.fadeOut();
            cover.fadeOut();
        }
    },

    /* ------------- */
    /* hs_slide */
    /* ------------- */

    $.fn.hsSlide = function(options) {

        var settings = {
            'per_row': 1
        };

        $.extend(settings, options);

        var current_page = 0;

        var main = $(this);
        var elements_wrapper = settings['elements_wrapper'];
        var elements_container = settings['elements_container'];
        var elements = settings['elements'];

        var nr_pages = Math.ceil(elements.length / settings['per_row']);

        calculate_dimensions();

        scroll_to(0);

        attach();

        function attach() {

            if (settings['arrow_left']) {
                settings['arrow_left'].click(function(event) {
                    event.preventDefault();

                    previous();
                });
            }

            if (settings['arrow_right']) {
                settings['arrow_right'].click(function(event) {
                    event.preventDefault();

                    next();
                });
            }

            if (settings['navigation']) {
                settings['navigation'].click(function(event) {
                    event.preventDefault();

                    current_page = $(this).index() - 1;

                    scroll_to(current_page);
                });
            }

            $(window).resize(function() {
                calculate_dimensions();
            });
        }

        function calculate_dimensions() {
            //elements.width(elements_container.width());
            var whole_width = 0;
            elements.each(function(index, el) {
                whole_width += $(el).width() + parseInt($(el).css('margin-left')) + parseInt($(el).css('margin-right'));
            });

            //element_width = elements.eq(0).width();

            //elements_container.height(elements.getMaxHeight());
            //elements_container.width(elements.length * element_width);
            elements_container.width(whole_width);

        }

        function next() {
            if (current_page == nr_pages - 1) {
                current_page = 0;
            } else {
                current_page += 1;
            }

            scroll_to(current_page);
        }

        function previous() {
            if (current_page == 0) {
                current_page = nr_pages - 1;
            } else {
                current_page -= 1;
            }

            scroll_to(current_page);
        }

        function scroll_to(current_page) {
            //console.log(current_page);
            if (settings['navigation']) {
                settings['navigation'].removeClass('current');
                settings['navigation'].eq(current_page).addClass('current');
            }

            var elements_scolling_index = settings['per_row'] * current_page;

            if (elements_scolling_index > elements.length - 1) {
                elements_scolling_index = elements.length - 1;
            }

            elements_wrapper.scrollTo(elements.eq(elements_scolling_index), 500, {
                axis: 'x'
            });
        }

    },

    /* ------------- */
    /* hsTabs */
    /* ------------- */

    $.fn.hsTabs = function(options) {

        var settings = {
            'headers': null,
            'contents': null
        }

        $.extend(settings, options);

        var main = $(this);

        attach();
        change_content(0);

        function attach() {
            settings['headers'].click(function(event) {
                event.preventDefault();

                change_content($(this).index());
            });
        }

        function change_content(index) {
            settings['headers'].removeClass('current');
            settings['headers'].eq(index).addClass('current');

            settings['contents'].css('display', 'none');
            settings['contents'].eq(index).css('display', 'block');
        }

    },

    $.fn.getMaxHeight = function() {
        return (Math.max.apply(this, $.map(this, function(e) {
            return $(e).height()
        })));
    };

    $.fn.setAllToMaxHeight = function() {
        return this.height(Math.max.apply(this, $.map(this, function(e) {
            return $(e).height()
        })));
    };
})(jQuery);