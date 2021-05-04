import {Satellite} from '@eadigital/analytics-core';
import {ClientFunction} from 'testcafe';

declare global {
  interface Window {
    satelliteTrackSpyData: string[];
    originalSatelliteTrack: (ruleName: string) => void;
    _satellite: Satellite;
  }
}
export const callAdobeSatelliteTrack = ClientFunction((ruleName: string) => {
  return window.analyticsTools.callAdobeRule(ruleName);
});
export const spyOn = ClientFunction(() => {
  // Create an array where we store information about `window._satellite.track` calls
  const currentData = localStorage.getItem('satelliteTrackSpyData');
  window.satelliteTrackSpyData = typeof currentData === 'undefined' || currentData === null ? [] : JSON.parse(currentData);
  if (window._satellite) {
    // Store the original `window._satellite.track` value
    window.originalSatelliteTrack = window._satellite.track;
    window._satellite.track = function () {
      // Save data about the current call
      window.satelliteTrackSpyData.push(arguments[0]);
      localStorage.setItem('satelliteTrackSpyData', JSON.stringify(window.satelliteTrackSpyData));
      // Call the original `window._satellite.track` value
      window.originalSatelliteTrack(arguments[0]);
    };
  }
});
export const getSpyData = ClientFunction(() => {
  // Retrieve data about window._satellite.track calls from client
  const currentData = localStorage.getItem('satelliteTrackSpyData');
  window.satelliteTrackSpyData = typeof currentData === 'undefined' || currentData === null ? [] : JSON.parse(currentData);
  return window.satelliteTrackSpyData;
});
export const spyOff = ClientFunction(() => {
  // Restore the original window._satellite.track value
  window._satellite.track = window.originalSatelliteTrack;
  window.satelliteTrackSpyData = [];
  localStorage.removeItem('satelliteTrackSpyData');
});
