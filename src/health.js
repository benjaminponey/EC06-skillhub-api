/**
 * Retourne l'état de santé courant de l'API.
 * Utilisé par GET /health et par le HEALTHCHECK Docker.
 */
function getHealth() {
  return {
    status: 'ok',
    service: 'skillhub-api',
  };
}

module.exports = { getHealth };
