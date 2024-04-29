import http from 'node:http';
import { createLightship } from 'lightship';

const port = 5050;

const lightship = await createLightship();

const requestListener = function (req, res) {
    console.log(JSON.stringify(req.headers));
    if(req.url == '/') {
        res.statusCode = 200;
        res.setHeader('Content-Type', 'text/html');   
        res.write('<html><body><p>Home Page</p></body></html>');
        res.end();
    } else {
        res.statusCode = 400;
        res.setHeader('Content-Type', 'text/html');   
        res.write('<html><body><p>Bad Request</p></body></html>');
        res.end();
    }
    console.log(JSON.stringify(res.getHeaders()));
}

const server = http.createServer(requestListener).listen(port, '127.0.01', () => {
    lightship.signalReady();
    console.log(`Node.js web server at port ${port} is running..`);
})
.on('error', () =>{
    lightship.shutdown();
});

lightship.registerShutdownHandler(() => {
    console.log(`Node.js web server shutting down..`);
    server.close();
});