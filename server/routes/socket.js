/*const wsModule = require('ws');

module.exports = function(_server){
    const wss = new wsModule.Server({server:_server});

    wss.on('connection', function(ws, req){
        let ip = req.header['x-forwarded-for'] || req.connection.remoteAddress;
        console.log(ip + "아이피의 클라이언트로 부터 접속 요청이 있었습니다.");

        ws.on('message', function(message){
            console.log(ip + "로 부터 바든 메세지 : " + message);
            ws.send("echo:" + message);
        });

        ws.on('error', function(error){
            console.log(ip + "클라이언트와 연결 중 오류 발생:" + error);
        });

        ws.on('close', function(){
            console.log(ip + "클라이언트와 접속이 끊어 졌습니다.");
        });
    });
}*/
var express = require('express');
var express = require('socket.io');
var router = express.Router();

router.get('/', function(req,res){
    const { url } = socket.
    console.log(`접속`);
});

module.exports = router;
