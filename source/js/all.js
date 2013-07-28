function getTime(zone, success) {
    var url = 'http://json-time.appspot.com/time.json?tz=' + zone,
        ud = 'json' + (+new Date());
    window[ud]= function(o){
        success && success(new Date(o.datetime));
    };
    document.getElementsByTagName('head')[0].appendChild((function(){
        var s = document.createElement('script');
        s.type = 'text/javascript';
        s.src = url + '&callback=' + ud;
        return s;
    })());
}

getTime('GMT', function(time){
    var midnight = new Date(
        time.getFullYear(),
        time.getMonth(),
        time.getDate(),
        0,0,0
    )
      , diff = (time.getTime() - midnight.getTime()) / 60 / 60 / 1000
      , meal = false;

    if (diff > 23 || diff < 4) {
        // Sleep Time
        meal = 'dinner';
    } else if (diff > 6 && diff < 13) {
        // Good Morning
        meal = 'breakfast';
    } else if (diff > 13 && diff < 20) {
        // Nom Nom
        meal = "lunch";
    }

    if (meal) {
        var element = document.querySelectorAll('.head-nav-outer');
        console.log(element);
        element[0].className += ' ' + meal;
    }

});