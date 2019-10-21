const report = require('multiple-cucumber-html-reporter');
const path = require('path');
const projectName = path.basename(__dirname);
const projectVersion = process.env.npm_package_version;
const reportGenerationTime = new Date().toISOString();
report.generate({
  reportName: 'TestCafe Report',
  jsonDir: 'sales-e2e/results/report',
  reportPath: 'sales-e2e/results/html-reports',
  openReportInBrowser: true,
  disableLog: false,
  displayDuration: true,
  durationInMS: true,
  customData: {
    title: 'Run info',
    data: [
      { label: 'Project', value: `Energy Australia` },
      { label: 'Release', value: `test` },
      { label: 'Report Generation Time', value: `${reportGenerationTime}` },
    ],
  },
});