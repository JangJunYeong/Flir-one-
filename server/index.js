const net = require('net');

const ipaddr = "192.168.56.1";
const port = 5001;

let server = net.createServer(function (socket) {
    console.log(socket.address().address + " connected.");

    socket.setEncoding('utf-8');

    socket.on('data', function (data) {
        console.log(data);
    });

    socket.on('close', function () {
        console.log('client disconncted');
    })
});

server.listen(port, ipaddr, function () {
    console.log(`listening on ${port}..`);
});