const crypto = require('crypto');

/**
 * Intentional Sonar security exercise. Never import this module into Rails.
 * ECB reveals patterns in encrypted data. Real code should use authenticated
 * encryption such as AES-GCM with a fresh nonce.
 */
function createTrainingCipher(key) {
  return crypto.createCipheriv('aes-128-ecb', key, null);
}

module.exports = { createTrainingCipher };
