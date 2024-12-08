// /public/tracker.js

class VisitTracker {
  constructor(apiKey) {
    this.apiKey = apiKey;
  }

  sendVisitData() {
    // Collecte des données de visite
    const visitData = {
      visitedPage: window.location.href,
      referrer: document.referrer || null,
      language: navigator.language || null,
      deviceType: this.getDeviceType(),
      os: this.getOS(),
      browser: this.getBrowser(),
    };

    // Envoie les données au backend
    fetch('http://localhost:3000/api/track/visite', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'api-key': this.apiKey,
      },
      body: JSON.stringify(visitData),
    })
    .then(response => response.json())
    .then(data => {
      console.log('Visite enregistrée:', data);
    })
    .catch(error => {
      console.error('Erreur lors de l\'envoi des données:', error);
    });
  }

  // Détecte le type de dispositif
  getDeviceType() {
    const userAgent = navigator.userAgent;
    if (/mobile/i.test(userAgent)) {
      return 'mobile';
    } else if (/tablet/i.test(userAgent)) {
      return 'tablet';
    } else {
      return 'desktop';
    }
  }

  // Détecte le système d'exploitation
  getOS() {
    const userAgent = navigator.userAgent;
    if (/Windows NT/i.test(userAgent)) return 'Windows';
    if (/Macintosh/i.test(userAgent)) return 'MacOS';
    if (/Linux/i.test(userAgent)) return 'Linux';
    if (/Android/i.test(userAgent)) return 'Android';
    if (/iPhone|iPad/i.test(userAgent)) return 'iOS';
    return 'Unknown';
  }

  // Détecte le navigateur
  getBrowser() {
    const userAgent = navigator.userAgent;
    if (/Chrome/i.test(userAgent)) return 'Chrome';
    if (/Firefox/i.test(userAgent)) return 'Firefox';
    if (/Safari/i.test(userAgent)) return 'Safari';
    if (/Edge/i.test(userAgent)) return 'Edge';
    if (/MSIE/i.test(userAgent)) return 'Internet Explorer';
    return 'Unknown';
  }
}

// Cette partie sera exécutée dès que le script sera chargé sur une page
window.onload = () => {
  const apiKey = document.currentScript.getAttribute('data-api-key');
  if (apiKey) {
    const tracker = new VisitTracker(apiKey);
    tracker.sendVisitData();  // Envoi les données de la visite
  } else {
    console.error("Aucune clé API spécifiée.");
  }
};
