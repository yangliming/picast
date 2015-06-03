var net = require('net');
var dgram = require('dgram');
var OMXPlayer = require('./omxplayer.js');
var omxplayer = null;
var broadcastMsg = new Buffer("Where are you?");
var broadcaster = dgram.createSocket("udp4");
var desktopAddress = null;

broadcaster.bind('4321');
broadcaster.on('message', function() {
    broadcaster.setBroadcast(true);
    broadcaster.send(broadcastMsg, 0, broadcastMsg.length, 1234, "255.255.255.255");
    console.log("Sending broadcast");
});

var relay = dgram.createSocket("udp4");
var relayMsg = new Buffer("Send broadcast");
var sendBroadcast = function() {
    relay.send(relayMsg, 0, relayMsg.length, 4321, "127.0.0.1");
    console.log("Sending relay");
};

var timeout = setInterval(sendBroadcast, 1000);

// var server = net.createServer(function(socket) {
//     var address = socket.address();
//     desktopAddress = socket.remoteAddress;
//     clearInterval(timeout);
//     console.log("Interval cleared");

//     socket.on('data', function(data) {
//         var str = data.toString();
//         console.log(str);
// 	    switch(str) {
//             case 'start':
//                 if(omxplayer) {
//                     console.log('omxplayer exists');
//                     omxplayer.stop();
//                 }
//                 omxplayer = new OMXPlayer(desktopAddress);
//                 break;
//             case 'playPause':
//                 if(omxplayer) {
//                     omxplayer.playPause();
//                 }
//                 break;
//             case 'stop':
//                 if(omxplayer) {  
//                     omxplayer.stop();
//                 }
//                 break;
//         }
//         console.log(data.toString());
//     });

//     socket.on('close', function() {
//         console.log("Connection ended. Should send broadcasts again");
//         timeout = setInterval(sendBroadcast, 1000);
//     });

// });

// server.listen('1234', function() {
//     console.log("Server is listening");
// });


var http = require('http');
var url = require('url');
var path = require('path');

PORT = 8080;

http.createServer(function (req, res) {
    var uri = url.parse(req.url).pathname;
    console.log(uri);
    if(uri == "/start") {
        if(omxplayer) {
            console.log('omxplayer exists');
            omxplayer.stop();
        }
        omxplayer = new OMXPlayer(desktopAddress);
        res.writeHead(200);
        res.end();
    }
    else if(uri == "/playPause") {
        if(omxplayer) {
            omxplayer.playPause();
        }
        res.writeHead(200);
        res.end();
    }
    else if(uri == "/stop") {
        if(omxplayer) {  
            omxplayer.stop();
        }
        res.writeHead(200);
        res.end();
    }
    else {
        res.writeHead(404);
        res.end();
    }
    
}).listen(PORT);
