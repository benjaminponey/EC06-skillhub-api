const express = require('express');
const { getHealth } = require('./health');

const app = express();

app.use(express.json());

app.get('/', (req, res) => {
  res.json({ message: 'SkillHub API — voir GET /health' });
});

app.get('/health', (req, res) => {
  res.json(getHealth());
});

// Démarrage uniquement si ce fichier est exécuté directement
// (évite que le serveur écoute pendant les tests)
if (require.main === module) {
  const port = process.env.PORT || 3000;
  app.listen(port, () => {
    // eslint-disable-next-line no-console
    console.log(`SkillHub API listening on port ${port}`);
  });
}

module.exports = app;
