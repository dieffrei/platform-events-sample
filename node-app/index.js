const jsforce = require('jsforce');
const conn = new jsforce.Connection({
    loginUrl : 'https://test.salesforce.com'
});
const http = require('http'),
    faye = require('faye');

conn.login('platform-event@playground.com', 'Tobi86!@!@B3ok2s6fxdELCsmDnEjoXM8N', function(err, res) {
    
    if (err) { 
        return console.error(err); 
    }

    console.log('Observing Opportunity events...');

    var client = new faye.Client(conn.instanceUrl + '/cometd/40.0/');
    client.setHeader('Authorization', 'OAuth ' + conn.accessToken);
    client.subscribe('/event/Opportunity__e', function(message) {
        console.log(message);
    });

});