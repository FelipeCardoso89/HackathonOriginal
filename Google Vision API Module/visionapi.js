// Imports the Google Cloud client library
const Vision = require('@google-cloud/vision');

// Creates a client
const vision = new Vision();

const fileName = './bateria.jpg';

// Prepare the request object
const request = {
  source: {
    filename: fileName
  }
};

// Performs label detection on the image file
vision.labelDetection(request)
  .then((results) => {
    const labels = results[0].labelAnnotations;

    console.log('Labels:');
    labels.forEach((label) => console.log(label.description));
  })
  .catch((err) => {
    console.error('ERROR:', err);
  });