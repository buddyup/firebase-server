// Sourced from: https://www.firebase.com/blog/2015-04-24-end-to-end-testing-firebase-server.html

console.log("Starting firebase server...");
var FirebaseServer = require('firebase-server');
new FirebaseServer(5000, 'dev.firebase.bu', {
  /* You can put your initial data model here, or just leave it empty */
});