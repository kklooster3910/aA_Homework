console.log("Hello from the JavaScript console!");

$.ajax({
    type: 'GET',
    url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=e303710d76e0670c6aa5a738ba26ee65',
    success(data) {
        console.log("HERE'S THE WEATHER FAM")
        console.log(data);
    },
    error() {
        console.error("dis not work");
    },
});

console.log("let's hope this ajax is working")

// Your AJAX request here

// Add another console log here, outside your AJAX request
