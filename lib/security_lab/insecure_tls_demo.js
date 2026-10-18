const https = require('https');

/**
 * Intentional Sonar security exercise. Never import this module into the app.
 * This function is not called by the Rails application or any workflow.
 * Fix: remove rejectUnauthorized so Node verifies the server certificate.
 */
function createInsecureTrainingRequest() {
  return https.request({
    hostname: 'example.invalid',
    rejectUnauthorized: false,
  });
}

module.exports = { createInsecureTrainingRequest };
