const functions = require("firebase-functions");

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});

exports.addUser = functions.firestore.document("angya/v1/users")
  .onWrite((change, context)=>{
    functions.logger.info("ADD USER!!", {structuredData: true});
  });
