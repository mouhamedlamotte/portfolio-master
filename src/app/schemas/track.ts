import { z } from 'zod';

// Schéma de validation pour les données de la visite
export const visitSchema = z.object({
  visitedPage: z.string().url(), // L'URL de la page visitée
  referrer: z.string().url().nullable(), // URL de la page précédente, nullable
  language: z.string().min(2), // Langue du navigateur
  deviceType: z.enum(['mobile', 'desktop', 'tablet']), // Type d'appareil
  os: z.enum(['Windows', 'MacOS', 'Linux', 'Android', 'iOS', 'Unknown']), // Système d'exploitation
  browser: z.enum(['Chrome', 'Firefox', 'Safari', 'Edge', 'Internet Explorer', 'Unknown']), // Navigateur
//   ipAddress: z.string().nullable(), // Adresse IP (nullable)
//   country: z.string().nullable(), // Pays (nullable)
//   region: z.string().nullable(), // Région (nullable)
});