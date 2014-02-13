/**
 * Created by oburdun on 2/13/14.
 */


var asana_ws = [];
var tasklist = [];

$(document).ready(function() {
    // Add configuration for one or more providers.
    jso_configure({
        "asana": {
            client_id: "10257151362570",
            redirect_uri: "http://localhost:63342/task-aggregator/aggregator-app-js/index.html",
            authorization: "https://app.asana.com/-/oauth_authorize",
            response_type:'token'
        }
    });

    jso_ensureTokens({
        "asana":false
    });

    jso_dump();
});

$('#load_profile').click(function() {
    jso_dump();
    jso_ensureTokens({
        "asana":false
    });
    $.oajax({
        url: "https://app.asana.com/api/1.0/users/me",
        jso_provider: "asana",
        jso_allowia: true,
        dataType: 'json',
        success: function(data) {
            console.log("Response load_profile:");
            console.log(JSON.stringify(data));

            asana_ws = data.data.workspaces;
            loadAsanaTasks();
        },
        error: function(data) {
            console.log("Error:");
            JSON.stringify(data)
        }
    });
});



var loadProjects = function () {

};

var loadAsanaTasks = function () {
    jso_ensureTokens({
       "asana":false
    });

    for (key in asana_ws) {
        $.oajax({
            url: "https://app.asana.com/api/1.0/tasks?workspace="+ asana_ws[key].id + "&assignee=me",
            jso_provider: "asana",
            jso_allowia: true,
            dataType: 'json',
            success: function(data) {
                console.log("Responce tasks:");
                console.log(JSON.stringify(data.data));

                for (key1 in data.data) {
                    $('#tasks').append('<p>id:' + data.data[key1].id + '; name: ' + data.data[key1].name + '</p>');
                }
            },
            error: function(data) {
                console.log("Error:");
                console.log(JSON.stringify(data));
            }
        })
    }
};