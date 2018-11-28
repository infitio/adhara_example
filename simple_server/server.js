const http = require('http');
const fs = require('fs');

let port = process.argv[2]||2347;

http.createServer((req, res)=>{
    let ts_start = Date.now();
    let sp = req.url.split("?")[0].split("/");
    let is_json = req.headers['content-type'] === 'application/json';
    let headers = {
        'Content-Type': req.headers['content-type']
    };
    if(sp[sp.length-1].indexOf(".") !== -1){
        try{
            let file_name = sp[sp.length-1];
            res.writeHead(200, headers);
            res.write(fs.readFileSync(sp.join("/").substring(1)));
        }catch(e){
            console.error(e.message);
            res.writeHead(404, 'text/html');
        }
    }else{
        res.writeHead(200, headers);
        res.write(fs.readFileSync(is_json?"index.json":"index.html"));
    }
    console.log(`${Date.now()-ts_start} ms | ${new Date()} | "200" | ${req.url}`);
    res.end();
}).listen(port, {host:"0.0.0.0"});
console.info(`App listening on ${port}`);