
$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "ProductDetails.aspx/GetAvailability",
        data: {},
        contentType: "application/json; charset=utf-8",     
        dataType: "json",
        success: function (jsonString) {
            var json = JSON.parse(jsonString.d);
            for (var i = 0; i < json.length; i++) {
                document.getElementById(json[i].Id + '_availability').innerHTML = json[i].Availability
                var description = document.getElementById(json[i].Id + '_description').textContent;
                document.getElementById(json[i].Id + '_description').innerHTML = "(" + json[i].Id + ") " + description;
            }         
        },
        failure: function (response) {
            alert(response.d);
        }
    });
});
