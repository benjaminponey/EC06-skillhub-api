const { getHealth } = require('../src/health');

describe('getHealth()', () => {
  test('retourne un statut "ok"', () => {
    const result = getHealth();
    expect(result.status).toBe('ok');
  });

  test('retourne le nom du service', () => {
    const result = getHealth();
    expect(result.service).toBe('skillhub-api');
  });
});
