const https = require('https');

/**
 * Intentional Sonar security exercise. Never import this module into the app.
 * This function is not called by the Rails application or any workflow.
 * Fix: remove checkServerIdentity so Node uses its default hostname validation.
 */
function createInsecureTrainingRequest() {
  return https.request({
    hostname: 'example.invalid',
    checkServerIdentity: () => undefined,
  });
}

module.exports = { createInsecureTrainingRequest };
