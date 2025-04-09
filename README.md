# MongoDB @ Node.js  #
## Purpose 
- API on Node.js

- CRUD requests on a local instance of MongodDB

- Use of the API in HTML pages
## Pre-requisites
- mongodb 
- node.js
- curl
- an internet browser

## API

The API lives in server.js.

Starts with `node server.js`

Operates on local port 3000.


## API @ CURL 
Use CURL to test the API

### Add contacts with CURL

The add end point uses POST.

```curl -X POST -H "Content-Type: application/json" -d '{"name": "Alice", "email": "alice@example.com"}' http://127.0.0.1:3000/add```


### List contacts with CURL

The contacts end point uses GET.

```curl -X GET  http://127.0.0.1:3000/contacts```

## API @ Browser

### Browse directly
Head at  `http://127.0.0.1:3000/contacts` to see JSON data displayed in a dedicated view of your browser.

### index.html
Page `index.html` shows the list of contacts.

### add.html
Page `add.html` displays a form to enter a new contact

## Database
The database is `contactsDB`.

It is very simple with only one collection for `contacts`.

Contacts have a `name` and an `email` field, in addition to the unavoidable `_id`.