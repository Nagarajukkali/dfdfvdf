const report = require('multiple-cucumber-html-reporter');
const reportGenerationTime = new Date().toISOString();



report.generate({
  reportName: `Energy Australia Sales APP`,
  jsonDir: 'sales-e2e/results/report',
  reportPath: 'sales-e2e/results/html-reports',
  openReportInBrowser: false,
  disableLog: true,
  displayDuration: true,
  displayReportTime: true,
  durationInMS: true,
  customData: {
    title: 'Run information',
    data: [
      {
        label: 'Project',
        value: `EnergyAustralia Digital`,
      },
      { label: 'Release', value: `NA` },
      {
        label: 'Report Generation Time',
        value: `${reportGenerationTime}`,
      },
    ],
  },
});
