// Set a custom X-CSRFToken header to the value of the CSRF token

$(document).ajaxSend(function(event, xhr, settings) {
    function getCookie(name) {
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
    function sameOrigin(url) {
        // url could be relative or scheme relative or absolute
        var host = document.location.host; // host + port
        var protocol = document.location.protocol;
        var sr_origin = '//' + host;
        var origin = protocol + sr_origin;
        // Allow absolute or scheme relative URLs to same origin
        return (url == origin || url.slice(0, origin.length + 1) == origin + '/') ||
            (url == sr_origin || url.slice(0, sr_origin.length + 1) == sr_origin + '/') ||
            // or any other URL that isn't scheme relative or absolute i.e relative.
            !(/^(\/\/|http:|https:).*/.test(url));
    }
    function safeMethod(method) {
        return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
    }

    if (!safeMethod(settings.type) && sameOrigin(settings.url)) {
        xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
    }
});

$(document).ajaxError(function myErrorHandler(event, xhr) {
    switch (xhr.status) {
        case 302:
            window.location.replace(xhr.responseText);
            break;
    }
});

function trans(data, key) {
    var active_language = location.pathname.split('/')[1],
        active_key = key + '_' + active_language;
    return data[key] || data[active_key];
}

function get_url(url) {
    return '/' + location.pathname.split('/')[1] + url;
}

Object.size = function(obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key)) size++;
    }
    return size;
};

$(document).ready(function () {
    $("#itemcarousel").jcarousel({
        visible: 3
    });
    $("#homeCarousel").carousel('cycle', {
        interval: 6000
    });

    $("#detailCarousel").carousel('cycle', {
        interval: 6000
    });
    $('.activityCarousel').carousel('pause');
    $('.hotelCarousel').carousel('pause');

    $(".lightbox").lightBox();
    $("a[rel^=name1]").lightBox();
    $("a[rel^=name2]").lightBox();
    $("a[rel^=name3]").lightBox();
    $("a[rel^=name1-hotel]").lightBox();
    $("a[rel^=name2-hotel]").lightBox();
    $("a[rel^=name3-hotel]").lightBox();
    $("#detailCarousel .carousel-inner a").lightBox();
    $("#homeCarousel .carousel-inner a").lightBox();
    //Date Picker Date Format

    function getDateFormat () {
        var $this = $('#selectlang');
        var selectedLang = $('#selectlang').val();
        var defaultFormat = "mm-dd-yy",
            enFormat = "mm-dd-yy",
            frFormat = "dd-mm-yy",
            phFormat = "'Ika' d 'ng' MM', taong' yy",
            otaFormat = "DD, d MM, yy",
            otbFormat = "d MM, yy",
            format;

        if(selectedLang == "enUS" ){
            format = enFormat;
        } else if (selectedLang == "fr"){
            format = frFormat;
        } else if (selectedLang == "ph"){
            format = phFormat;
        } else if (selectedLang == "ota"){
            format = otaFormat;
        } else if (selectedLang == "otb"){
            format = otbFormat;
        } else {
            format = defaultFormat;
        }

        $( "#datepicker" ).datepicker('option', 'dateFormat', format );
    }


    $("#datepicker").datepicker({
        firstDay: 1,
        onSelect: function() {
            update_activity_dates();
            var itinerary_id = location.pathname.split('/').pop(),
                start_date = $('#datepicker').datepicker('getDate');
                start_date = $.datepicker.formatDate('yy-mm-dd', start_date);
            $.ajax({
                url: get_url('/personalize/itinerary/' + itinerary_id),
                type: 'PUT',
                dataType: 'json',
                data: {start_date: start_date}
            });
        }
    });
    $( "#modalfromdatepicker" ).datepicker({ firstDay: 1});
    $( "#modaltodatepicker" ).datepicker({ firstDay: 1});
    getDateFormat();

    $("#selectlang").on('change',function(){
        getDateFormat();

        $('#language_form').submit();
    });

    //Add more button for itenararies
    $('#addmore-itineraries').click(function() {
        console.log("Clicked");
        var num     = $('.itinerary-list a').length;
        var newNum  = new Number(num + 1);

        var newElem = $('#itinerary' + num).clone().attr('id', '#itinerary' + newNum);
        var newItinerary =  '<a href="#" id="nitinerary' + newNum +'" class="madd-item-link" data-toggle="modal" data-target="#chooseItineraryPrefrences" > ';
            newItinerary += '<div class="add-item">';
            newItinerary += '<h1>+</h1>';
            newItinerary += '<h3>Add Another itinerary</h3>';
            newItinerary += '</div>';
            newItinerary += '</a>';

        $('.itinerary-list').append(newItinerary);
    });

    $( "#sortable-itenerary-details" ).sortable({
        update: function(event, ui) {
                    getListNumber();
                    update_activity_dates();
                    persist_place_order();
                },
        placeholder: "tr-ui-state-highlight"

    });

    $(document).on('mouseenter', ".upward, .downward, .deleteItem, .plusOne, .minusOne", function () {
            $( "#sortable-itenerary-details" ).sortable('disable');
    });
    $(document).on('mouseleave', ".upward, .downward, .deleteItem, .plusOne, .minusOne", function () {
            $( "#sortable-itenerary-details" ).sortable('enable');
    });

    //$(".item-place-details").hide();

    getListNumber();
    getAverageDrivingHour();
    getAverageDistancePerDay();

    hideDetails();
    function showDetails () {
        $(".showD").on("click", function(){
            var $this = $(this);
            $this.unbind("click");
            $this.addClass("hideD");
            $this.removeClass("showD");
            $this.closest(".item-place-header").siblings(".item-place-details").slideDown("100", function(){
                    $this.val("Hide Details");
                    $this.on("click", hideDetails());
            });

         });
    }

    function hideDetails() {
        $(".hideD").on("click", function(){
            var $this = $(this);
            $this.unbind("click");
            $this.addClass("showD");
            $this.removeClass("hideD");
            console.log("It works!");
            $this.closest(".item-place-header").siblings(".item-place-details").slideUp("100", function(){
                $this.val("Show Details");
                $this.on("click", showDetails());
            });
        });
    }

    //Push items up or down in Personalize page
    $(document).on('click', '.upward', function(e){
        e.preventDefault();
        var current = $(this).closest('tr');
        current.prev().before(current);
        showChanged(current);
        getListNumber();
        update_activity_dates();
        persist_place_order();
      });

    $(document).on('click', '.downward', function(e){
        e.preventDefault();
        var current = $(this).closest('tr');
        current.next().after(current);
        showChanged(current);
        getListNumber();
        update_activity_dates();
        persist_place_order();
    });

    function showChanged(current){
        current.css({
            backgroundColor: "#ccc"
        }).animate({
            backgroundColor: "#fcfbfb"
        }, 300);
    }

    function getListNumber () {
        $(".list-number").each(function(){
            var list = $(this).closest("tr");
            var listPrev = list.prev();
            var listNum
            if (list.index() == 0){
                listNum = parseInt(list.index()) + 1;
            }else{
                listNum = parseInt($(".list-number", listPrev).html()) + parseInt($(".input-smallest", listPrev).val());
            }
            totalNights();
            $(this).html(listNum);
        });
    }

    function totalNights() {
        var total = 0;
        $(".input-smallest").each(function(){
            total += parseInt($(this).val());
        });

        $(".totalNights").html(total + " Nights");
    }

    $(document).on('click', '.deleteItem', function(e){
            e.preventDefault();
            var list = $(this).closest("tr"),
                id = list.find('input[name="itinerarysite"]').val(),
                itinerary_id = location.pathname.split('/').pop();

            $.ajax({
              url: get_url('/personalize/itinerary_place/' + itinerary_id + '/site/' + id),
              type: 'DELETE',
              dataType: 'json',
              success: function(data, textStatus, xhr) {
                list.remove();
                $('.hotels_and_activities_' + id).remove();
                update_activity_dates();
              },
              error: function(xhr, textStatus, errorThrown) {}
            });

        });
    $(".popBtn").on("click", function() {
        $('#chooseItineraryPrefrences').modal('hide');
    });

    $( "#slider" ).slider({
            value:100,
	    min: 100,
	    max: 300,
	    step: 100,
	    slide: function( event, ui ) {
                var slideVal = ui.value;
                var textVal;
                switch (slideVal){
                    case 100:
                        textVal = "Shorter drives, less sites";
                    break;
                    case 200:
                        textVal = "Average drives";
                    break;
                    case 300:
                        textVal = "Longer drives, more sites";
                    break;
                }
	    $( "#drivePref" ).html( textVal );
	}
    });
    $( "#drivePref" ).html("Preference is Option 3");

    var activeUnit = "km";

    $("#km").on("click", function(e){
        e.preventDefault();
        if (activeUnit == "miles"){
            $(".unit").each(function(){
                $(this).html('km');
            });
            $(".value").each(function(){
                var realVal = parseFloat($(this).attr('title')) * parseFloat(1.609344);
                var val = roundNumber(realVal, 2);
                console.log(realVal);
                $(this).attr('title', realVal);
                $(this).html(val);
            });
            activeUnit = "km";
            console.log(activeUnit);
        }
    });
    $("#miles").on("click", function(e){
        e.preventDefault();
        if (activeUnit == "km"){
            $(".unit").each(function() {
                $(this).html('miles');
            });
            $(".value").each(function(){
                var realVal = parseFloat($(this).attr('title')) * parseFloat(0.621371192);
                var val = roundNumber(realVal, 2);
                console.log(realVal);
                $(this).attr('title', realVal);
                $(this).html(val);
            });
            activeUnit = "miles";
            console.log(activeUnit);
        }
    });

    function roundNumber(num, dec) {
	var result = Math.round(num*Math.pow(10,dec))/Math.pow(10,dec);
	return result;
    }
    $(document).on("click", ".plusOne", function(e){
        e.preventDefault();
        var input = $(this).siblings(".input-smallest");
        input.val(parseInt(input.val()) + 1);
        getListNumber();

        update_activity_dates();
        persist_nights();
    });
    $(document).on("click", ".minusOne", function(e){
        e.preventDefault();
        var input = $(this).siblings(".input-smallest");
        console.log(input);
        if (parseInt(input.val()) - 1 > 0){
            input.val(parseInt(input.val()) - 1);
        }
        getListNumber();

        update_activity_dates();
        persist_nights();
    });

    function getAverageDrivingHour () {
        var totalHours = 0, avgHour;
        var numberOfTrips = $(".hourValue").length;
        $(".hourValue").each(function() {
            totalHours += parseFloat($(this).html());
            avgHour = totalHours/numberOfTrips;
            $(".avgHour").html(roundNumber(avgHour, 2));
        });
    }

    function getAverageDistancePerDay (){
        var totalDrivingDistance = 0, avgDistance;
        var numberOfTrips = $(".value").length;
        $(".value").each(function() {
            totalDrivingDistance += parseFloat($(this).html());
            avgDistance = totalDrivingDistance/numberOfTrips;
            $(".avgDistance").html(roundNumber(avgDistance, 1));
            $(".avgDistance").attr("title", avgDistance);
        });
    }

    $(".print").on("click", function (e) {
        e.preventDefault();
        var container = $(this).attr('rel');
	$('.' + container).printArea();
    });

    $('#signup_form, #personalize_signup_form').on('submit', function(e){
        e.preventDefault();
        var $form = $(this);

        $form.find('.field_error').remove();

        var data = $form.serialize();
        var url = get_url('/registration');
        $.post(url, data, function(res){
            $form.hide().next().show();
        }).error(function(xhr, ajaxOptions, thrownError){
            if(xhr.status && xhr.status==400){
                var data = $.parseJSON(xhr.responseText);
                $.each(data.errors, function(i) {
                    var $field = $form.find('input[name="' + i + '"]');
                    $field.parent().append('<span class="field_error">' + data.errors[i][0] + '</span>');
                });
            }
        });
    });

    $('#signupModal').bind('hidden', function(e){
        $('#signup_form .field_error').remove();
        $('#signup_form input').val('');
        $('#signup_form').show();
        $('#signup_form').next().hide();
    });

    $('#login_form, #personalize_login_form').on('submit', function(e){
        e.preventDefault();

        var $form = $(this);
        $form.find('.field_error').remove();

        var data = $form.serialize();
        var url = get_url('/login');
        $.post(url, data, function(){
            window.location.reload();
        }).error(function(xhr, ajaxOptions, thrownError){
            if(xhr.status && xhr.status==400){
                var data = $.parseJSON(xhr.responseText);
                $.each(data.errors, function(i) {
                    if(i !== '__all__') {
                        var $field = $form.find('input[name="' + i + '"]');
                        $field.parent().append('<span class="field_error">' + data.errors[i][0] + '</span>');
                    } else {
                        $form.find('button.btn').after('<span class="field_error">' + data.errors[i][0] + '</span>');
                    }
                });
            }
        });
    });

    $('#loginModal').bind('hidden', function(e){
        $('#login_form .field_error').remove();
        $('#login_form input').val('');
    });

    $('#saveItinerary').bind('hidden', function(e){
        $('#personalize_signup_form .field_error').remove();
        $('#personalize_signup_form input').val('');
        $('#personalize_signup_form').show().next().hide();

        $('#personalize_login_form .field_error').remove();
        $('#personalize_login_form input').val('');
    });

    $('#reset_password_form').on('submit', function(e){
        e.preventDefault();

        var $form = $(this);
        $form.find('.field_error').remove();

        var data = $form.serialize();
        var url = get_url('/reset_password');
        $.post(url, data).error(function(xhr, ajaxOptions, thrownError){
            if(xhr.status && xhr.status==400){
                var data = $.parseJSON(xhr.responseText);
                $.each(data.errors, function(i) {
                    if(i !== '__all__') {
                        var $field = $form.find('input[name="' + i + '"]');
                        $field.parent().append('<span class="field_error">' + data.errors[i][0] + '</span>');
                    } else {
                        $form.find('button.btn').after('<span class="field_error">' + data.errors[i][0] + '</span>');
                    }
                });
            }
        });
    });

    $('#resetPasswordModal').bind('hidden', function(e){
        $('#reset_password_form .field_error').remove();
        $('#reset_password_form input').val('');
    });

    $('#delete_itinerary').on('click', function(e){
        e.preventDefault();
        $.ajax({
            ur: location.pathname,
            type: 'DELETE',
            success: function(res) {
                window.location.replace(get_url('/personalize'));
            }
        });
    });

    $('#manually_create_itinerary').on('click', function(e){
        jQuery.ajax({
          url: get_url('/personalize/itinerary'),
          type: 'POST',
          success: function(data, textStatus, xhr) {
            window.location.replace(get_url('/personalize/itinerary/' + data.id));
          },
          error: function(xhr, textStatus, errorThrown) {
            //called when there is an error
          }
        });
    });

    $('#add_places').on('click', function(e){
        var itinerary_id = location.pathname.split('/').pop(),
            url = get_url('/personalize/itinerary_place/' + itinerary_id);
        jQuery.ajax({
          url: url,
          type: 'POST',
          data: $('#new_places_form').serialize(),
          success: function(data, textStatus, xhr) {
            $('#addPlace').modal('hide');

            var place_template = '<tr>\
                                <input type="hidden" value="{{ id }}" name="itinerarysite" />\
                                <td><div class="orange">Day <span class="list-number">1</span></div></td>\
                                <td>{{ name }}</td>\
                                <td>\
                                        <a href="javascript:void(0)" class="btn plusOne"><img src="{{ STATIC_URL }}images/plus.png" alt="Add one night"/></a>\
                                        <input type="text" class="input-smallest" value="{{ nights }}">\
                                        <a href="javascript:void(0)" class="btn minusOne"><img src="{{ STATIC_URL }}images/minus.png" alt="Subtract one night"/></a>\
                                </td>\
                                <td>{{ name }} to {{ name }}</td>\
                                <td><span class="value" title="3.00">3</span> <span class="unit">km</span></td>\
                                <td><span class="hourValue">2</span> h</td>\
                                <td>\
                                    <a href="javascript:void(0)" class="btn upward"><img src="{{ STATIC_URL }}images/upward.png" alt="Push itinerary up"/></a>\
                                    <a href="javascript:void(0)" class="btn downward"><img src="{{ STATIC_URL }}images/downward.png" alt="Push itinerary down"/></a>\
                                    <a href="javascript:void(0)" class="btn deleteItem"><img src="{{ STATIC_URL }}images/delete.png" alt="Delete itinierary"/></a>\
                            </td>';

            var hotels_and_activities_template = '<li class="hotels_and_activities_{{ id }}">\
                            <div class="row-fluid item-place-header">\
                                <div class="span7">\
                                    <div class="list-header">\
                                        <h3>{{ count }}. {{ name }}</h3>\
                                    </div>\
                                </div>\
                                <div class="span5">\
                                    <div class="list-dates-details">\
                                        <form class="form-inline pull-right">\
                                            <input type="button" class="btn hideD toggleDisplay" value="Hide Details"/>\
                                        </form>\
                                    </div>\
                                </div>\
                            </div>\
                            <div class="row-fluid">\
                                <div class="span12 list-range">\
                                    <p>\
                                        Number of days: <strong class="number_of_days">{{ nights }}</strong>\
                                        <span class="daterange">\
                                        From: <strong class="from_date">--</strong> &nbsp;&nbsp; To: <strong class="to_date">--</strong>\
                                        </span>\
                                    </p>\
                                </div>\
                            </div>\
                            <div class="item-place-details">\
                                <div class="row-fluid">\
                                    <div class="span12 activity">\
                                        <strong>Activities:</strong>\
                                        <p><em>No activity added.</em></p>\
                                       <input type="button" class="btn" value="Add Activity" id="addmore-activity"data-toggle="modal" data-target="#addActivity"/>\
                                    </div>\
                                </div><!-- end activity -->\
                                <div class="row-fluid">\
                                    <div class="span12 hotel">\
                                        <strong>Hotels:</strong>\
                                        <ul>\
                                        </ul>\
                                       <p><em>No Hotels added.</em></p>\
                                       <input type="button" class="btn" value="Add Hotels" id="addmore-hotels" data-toggle="modal" data-target="#addHotels"/>\
                                    </div>\
                                </div><!--end hotel -->\
                            </div>\
                        </li>';

                if(data || data.sites) {
                    var count = $('li[class^="hotels_and_activities_"]').length;
                    for(var site in data.sites) {
                        count++;
                        $('#sortable-itenerary-details').append(Mustache.to_html(place_template, {
                            STATIC_URL: '/static/',
                            name: data.sites[site].name,
                            nights: 1,
                            id: data.sites[site].id
                        }));

                        $('.itinerary-places').append(Mustache.to_html(hotels_and_activities_template, {
                            STATIC_URL: '/static/',
                            name: data.sites[site].name,
                            nights: 1,
                            id: data.sites[site].id,
                            count: count
                        }));
                    }
                    update_activity_dates();
                }

                getListNumber();
          },
          error: function(xhr, textStatus, errorThrown) {
            //called when there is an error
          }
        });
    });

    function format_date(date) {
        return date.getMonth() + '-' + date.getDate() + '-' + date.getFullYear();
    }

    function on_nights_change($input) {
        var item_id = $input.closest('tr').find('input[name="itinerarysite"]').val();
        var start_day = parseInt($input.closest('tr').find('.list-number').text().split(' ').pop());
        $('.hotels_and_activities_' + item_id  + ' .number_of_days').text($input.val());

        var start_date = $('#datepicker').datepicker('getDate');

        if(start_date) {
            var from_date = new Date(start_date.valueOf());
            from_date.setDate(from_date.getDate() + start_day);

            var to_date = new Date(from_date.valueOf());
            to_date.setDate(to_date.getDate() + parseInt($input.val()));

            $('.hotels_and_activities_' + item_id  + ' .from_date').text(format_date(from_date));
            $('.hotels_and_activities_' + item_id  + ' .to_date').text(format_date(to_date));
        }
    }

    function update_activity_dates() {
        $('.input-smallest').each(function(){
            on_nights_change($(this));
        });
    }

    $(document).on('propertychange keyup input paste', '.input-smallest', function(e){
        var $input = $(this);
        if(!$input.val().trim()) $input.val(1);
        update_activity_dates();
        getListNumber();
        persist_nights();
    });

    $('#addPlace').bind('show', function(e){
        $('#new_places_form input[type="checkbox"]').prop('checked', false);
        $('#sortable-itenerary-details input[name="itinerarysite"]').each(function(){
            var id = $(this).val();
            $('#new_places_form input[type="checkbox"][value="' + id + '"]').prop('checked', true);
        });
    });

    $(document).on('click', '.addmore-activity', function(e){
        // Get site activites
        var activity_template = '<li>\
                        <div class="row-fluid">\
                            <div class="span5">\
                                <div class="activity-carousel-wrapper">\
                                    <div id="name1-activityCarousel" class="carousel slide activityCarousel">\
                                        <!-- Carousel items -->\
                                        <div class="carousel-inner">\
                                          <div class="active item"><a href="{{ STATIC_URL }}{{ active_image }}" rel="name1"><img src="{{ STATIC_URL }}{{ active_image }}"/></a></div>\
                                          {{{ images }}}\
                                        </div>\
                                        <!-- Carousel nav -->\
                                        <a class="carousel-control left" href="#name1-activityCarousel" data-slide="prev">&lsaquo;</a>\
                                        <a class="carousel-control right" href="#name1-activityCarousel" data-slide="next">&rsaquo;</a>\
                                    </div>\
                                </div>\
                            </div>\
                            <div class="span7">\
                                <div class="header">\
                                    <h3 class="title">{{ name }}</h3>\
                                </div>\
                                <p>{{ description }}</p>\
                                <a href="#{{ itinerary_id }}-{{ site_id }}-{{ activity_id }}" class="btn btn-primary add_activity_button">Add</a>\
                            </div>\
                        </div>\
                    </li>';
        var $button = $(this),
            site_id = $button.closest('li').attr('class').split('_').pop(),
            itinerary_id = location.pathname.split('/').pop();

        $.getJSON(get_url('/personalize/itinerary_place_activity/' + site_id), function(res){
            if (res && res.activities) {
                var obj;
                $('#addActivity .add-activity-list').html('');
                for(var activity in res.activities) {
                    obj = res.activities[activity];
                    if(!$button.closest('li').find('li.activity_' + obj.id).length) {
                        var images = '';
                        for(var x = 1;x < obj.images.length;x++) {
                            images += Mustache.to_html('<div class="item"><a href="{{ STATIC_URL }}{{ image }}"><img src="{{ STATIC_URL }}{{ image }}" /></a></div>',{
                                STATIC_URL: '/static/',
                                image: obj.images[x].image
                            });
                        }
                        $('#addActivity .add-activity-list').append(Mustache.to_html(activity_template, {
                            name: trans(obj, 'name'),
                            description: trans(obj, 'description'),
                            itinerary_id: itinerary_id,
                            site_id: site_id,
                            activity_id: obj.id,
                            price: obj.price,
                            STATIC_URL: '/static/',
                            active_image: obj.images.length ? obj.images[0].image : '',
                            images: images
                        }));
                    }
                }
            }
        });
    });

    $(document).on('click', '.add_activity_button', function(e){
        var $button = $(this),
            ids = $button.attr('href').substring(1).split('-');
            itinerary_id = ids[0],
            site_id = ids[1],
            activity_id = ids[2];

        var url = get_url(Mustache.to_html('/personalize/itinerary_place_activity/{{ itinerary_id }}-{{ site_id }}-{{ activity_id }}', {
            itinerary_id: itinerary_id,
            site_id: site_id,
            activity_id: activity_id
        }));

        var activity_template = '<li class="activity_{{ id }}">\
                                <div class="row-fluid">\
                                    <div class="span2">\
                                        <img src="http://1.bp.blogspot.com/-9Al7TmL0wYM/T3XcsDG1wEI/AAAAAAAAEno/-DYt-hd08nQ/s320/Grand_Canyon_1.jpg" alt="{{ name }}" />\
                                    </div>\
                                    <div class="span8">\
                                        <div class="header">\
                                            <h3 class="title">{{ name }}</h3>\
                                        </div>\
                                        <p>{{ description }}</p>\
                                    </div>\
                                    <div class="span2">\
                                        <div class="marbot10"><span class="label label-important">Not Booked</span></div>\
                                        <div class="marbot10"><a href="#{{ itinerary_place_activity_id }}" class="btn btn-primary book_now">Book Now</a></div>\
                                        <div class="marbot10"><a href="#{{ itinerary_place_activity_id }}" class="btn remove_activity_button">Remove</a></div>\
                                    </div>\
                                </div>\
                                </li>';

        $.post(url, function(res){
            $no_added_activites = $('.hotels_and_activities_' + site_id + ' .no_added_activities');
            if($no_added_activites.length) {
                $no_added_activites.before('<ul class="added-activities unstyled"></ul>');
                $no_added_activites.remove();
            }

            $('.hotels_and_activities_' + site_id + ' .added-activities').append(Mustache.to_html(activity_template, {
                id: res.activity.id,
                itinerary_place_activity_id: res.itinerary_place_activity_id,
                name: trans(res.activity, 'name'),
                description: trans(res.activity, 'description')
            }));

           $('#qq').append(Mustache.to_html(activity_template, {
                id: res.activity.id,
                itinerary_place_activity_id: res.itinerary_place_activity_id,
                name: trans(res.activity, 'name'),
                description: trans(res.activity, 'description')
            }));

        });
    });

    $(document).on('click', '.remove_activity_button', function(e){
        e.preventDefault();
        var $button = $(this),
            id = $button.attr('href').substring(1);

        $.ajax({
          url: get_url('/personalize/itinerary_place_activity/' + id),
          type: 'DELETE',
          dataType: 'json',
          success: function(data, textStatus, xhr) {
            $ul = $button.closest('li').parent();
            $button.closest('li').remove();
            if(!$ul.children().length) {
                $ul.after('<p class="no_added_activities"><em>No activity added.</em></p>');
                $ul.remove();
            }
          }
        });
    });

    $(document).on('click', '.book_now', function(e){
        e.preventDefault();
        var $button = $(this);
            id = $button.attr('href').substring(1);

        $.ajax({
          url: get_url('/personalize/itinerary_place_activity/' + id),
          type: 'PUT',
          dataType: 'json',
          success: function(data, textStatus, xhr) {
            $button.parent().prev().remove();
            $button.parent().before('<div class="marbot10"><span class="label label-success">Booked</span></div>');
            $button.parent().remove();
          }
        });
    });

    $('#itinerary_rename_form').on('submit', function(e){
        e.preventDefault();

        var $form = $(this),
            id = location.pathname.split('/').pop(),
            form_data = $form.serialize();

        $form.find('.field_error').remove();

        $.ajax({
          url: get_url('/personalize/itinerary/' + id),
          type: 'PUT',
          dataType: 'json',
          data: form_data,
          success: function(data, textStatus, xhr) {
                $('#itinerary_rename_modal').modal('hide');
                $('.active-list .header h3').text(data.name);
          },
          error: function(xhr, textStatus, errorThrown) {
            if(xhr.status && xhr.status==400){
                var data = $.parseJSON(xhr.responseText);
                $.each(data.errors, function(i) {
                    var $field = $form.find('input[name="' + i + '"]');
                    $field.parent().append('<span class="field_error">' + data.errors[i][0] + '</span>');
                });
            }
          }
        });
    });

    $(document).on('click', '.use_itinerary', function(e){
        var example_itinerary_id = $(this).attr('id').split('_').pop(),
            url = get_url('/personalize/itinerary');

        $.post(url, {'example_itinerary_id': example_itinerary_id}, function(res){
            window.location.replace(get_url('/personalize/itinerary/' + res.id));
        });
    });

    $('#recommend_me_itineraries').on('click', function(e){
/*
        var url = get_url('/personalize/itinerary'), key_places = [], data;

        $('.keyPlacesWrap button.active').each(function(){
            $button = $(this);
            key_places.push($button.val());
        });
        data = {
            'itinerary_based_on_tarveling_preferences': true,
            'length_of_trip': $('#length_of_trip').val(),
            'driving_distance': $("#slider").slider('value'),
            'starting_point': $('#starting_point').val(),
            'ending_point': $('#ending_point').val(),
            'key_places': key_places
        };

        $.post(url, data, function(data){

*/
        var url = get_url('/personalize/itinerary/recommendation'), key_places = [], data = [];

        $('.keyPlacesWrap button.active').each(function(){
            $button = $(this);
            data.push({
                name: 'key_places',
                value: $button.val()
            });
        });

        data = data.concat([
            {
                name: 'itinerary_based_on_tarveling_preferences',
                value: true
            },
            {
                name: 'length_of_trip',
                value: $('#length_of_trip').val()
            },
            {
                name: 'driving_distance',
                value: $("#slider").slider('value')
            },
            {
                name: 'starting_point',
                value: $('#starting_point').val()
            },
            {
                name: 'ending_point',
                value: $('#ending_point').val()
            }
        ]);

        var recommended_itinerary_template = '\
                    <div class="span4 itinerary">\
                        <a href="#">\
                            <div class="header">\
                                <h3>{{ name }}</h3>\
                            </div>\
                            <div class="map">\
                                <img src="{{ STATIC_URL }}{{ image }}" />\
                            </div>\
                            <h3>{{ num_days }} Days</h3>\
                            <p>{{ description }}</p>\
                        </a>\
                        <input id="use_recommendation_{{ id }}" type="button" class="btn use_recommendation" value="Use Itinerary"/>\
                    </div>';

        $.getJSON(url, data, function(data){
            if (data) {
                $('#recommendedItineraryModal .marbot10').html('');
                var count = 0, template;
                var last = Object.size(data) - 1;
                for (var id in data) {
                    obj = data[id];
                    template = count % 3 === 0 && count !== last ? recommended_itinerary_template : recommended_itinerary_template + '</div></div><div class="row-fluid"><div class="span12 marbot10">';
                    $('#recommendedItineraryModal .marbot10').append(Mustache.to_html(template, {
                      STATIC_URL: '/static/',
                      description: trans(obj, 'recommended_itinerary__description'),
                      name: trans(obj, 'recommended_itinerary__name'),
                      num_days: obj.nights,
                      id: obj.id
                    }));
                }
            }
            $('#recommendModal').modal('hide');
            $('#recommendedItineraryModal').modal('show');
        });
    });

    $(document).on('click', '.use_recommendation', function(e){
        var itinerary_id = $(this).attr('id').split('_').pop(),
            url = get_url('/personalize/itinerary/recommendation');

        $.post(url, {'itinerary_id': itinerary_id}, function(res){
            window.location.replace(get_url('/personalize/itinerary/' + res.id));
        });
    });

    function persist_nights(){
        // Update server when place nights value change.

        var id, nights, data = [], itinerary_id = location.pathname.split('/').pop();

        $('input[name="itinerarysite"]').each(function(){
            id = $(this).val(),
            nights = $(this).parent('tr').find('.input-smallest').val();

            data.push(
                {
                    name: 'site',
                    value: id
                },
                {
                    name: 'night',
                    value: nights
                }
            );
        });

        $.ajax({
            url: get_url('/personalize/itinerary_place/' + itinerary_id),
            type: 'PUT',
            dataType: 'json',
            data: data
        });
    }

    function persist_place_order(){
        // Update server when place order changes.

        var id, data = [], itinerary_id = location.pathname.split('/').pop();

        $('input[name="itinerarysite"]').each(function(){
            id = $(this).val(),

            data.push(
                {
                    name: 'site',
                    value: id
                }
            );
        });

        $.ajax({
            url: get_url('/personalize/itinerary_place/' + itinerary_id),
            type: 'PUT',
            dataType: 'json',
            data: data
        });
    }

    if($('#datepicker').length && $('#datepicker').val()) update_activity_dates();
});




$(function(){

 $("input[type='button'][name='btncng']").click(function(){
 $("#qq").empty();
     var btnid = this.id;
     btnid1=("id"+btnid)

   $(".loopitems").each(function(){                                                             
       var item= this.id;


     if (btnid1==item){
       $('#sitelooprec').empty();
       $("#sitelooprec").append($(this).html() )
       //Add a hotel in the selected site
       // $('#hotellooprec').empty();
       //$("#hotellooprec").append($(this).html() )
      }  
                          
    });

 });


});

$(function(){

$("input[type='button'][name='qw']").click(function(){

  var btn_id=this.id;

$("a").click(function(){

 var item_id=this.id;
 $("."+btn_id).empty();
 $("."+btn_id).append($("."+item_id).html());

     });

   });

$(function(){
$('#addcar').click(function(){

  $(".appendcar").empty();
  $("#addcar").remove();
  $("#appendcar").remove();
  $('.appendcar').append($('#addcars').html());
  $('.appendcar').append($('#notbooked').html());

   });
  });

});

      
