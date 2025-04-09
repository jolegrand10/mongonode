/*
* How to use mongodb locally with js on node
*
*/
const http = require('http');
const { MongoClient } = require('mongodb');

const mongoURL = "mongodb://localhost:27017";
const dbName = "contactsDB";
let db;

// Connexion à MongoDB
MongoClient.connect(mongoURL).then(client => {
    db = client.db(dbName);
    console.log("Connecté à MongoDB");
}).catch(err => console.error("Erreur MongoDB :", err));

//process.exit();

const server = http.createServer(async (req, res) => {
    if (req.method === "OPTIONS") {
        res.writeHead(204, corsHeaders);
        return res.end();
    }
    if (req.url === "/contacts" && req.method === "GET") {
        const contacts = await
            db.collection('contacts').find().toArray();
        res.writeHead(200, {
            'Content-Type':
                'application/json', ...corsHeaders
        });
        return res.end(JSON.stringify(contacts));
    }
    if (req.url === "/add" && req.method === "POST") {
        let body = "";
        req.on("data", chunk => body += chunk);
        req.on("end", async () => {
            const { name, email } = JSON.parse(body);
            await db.collection('contacts').insertOne(
                { name, email });
            res.writeHead(201, corsHeaders);
            res.end(JSON.stringify(
                { message: "Contact ajouté !" }));
        });
        return;
    }

    res.writeHead(404, { 'Content-Type': 'text/plain' });
    res.end("404 Not Found");
});

const corsHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "OPTIONS, POST, GET",
    "Access-Control-Allow-Headers": "Content-Type"
};

server.listen(3000, () =>
    console.log("� Serveur lancé sur http://localhost:3000"));
