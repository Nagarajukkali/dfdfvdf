# Quote Tool Level 4 Automation Suite

To run E2E tests locally use the following commands

```
npm ci
npm run e2e:all
```
This will start the testcafe server and run our scripts according to the provided tag,env and browser
 - tag we provide in `e2e_tags` config section of `package.json`
 - env we provide in `env` config section of `package.json`
 - browser we provide in `browsers` section of `.testcaferc.json`
 
 To debug tests
  - If we want to debug on each step we can set `debugMode` in `.testcafetc.json` to `true`
  - If we want to debug on fail we can set `debugOnFail` in `.testcafetc.json` to `true`
  
  To take screenshots on each page
  - Change the value of `screenshot` in `non-prod-resources.ts` file under `resources` folder to `Y`
  
  To enable visual validation
  - Change the value of `validate` in `visualValidation` section of `non-prod-resources.ts` file under `resources` folder to `Y`

  To rerun the failure scenario again at runtime
  - Set `quarantineMode` in `.testcafetc.json` to `true`. It will retry 3 times.
  
  To change the concurrency of test run
  - Change the value of `concurrency` in `.testcafetc.json`
  
  #### To run tests in remote device
  - Make sure remote device and system both are connected in same network
  ```
    npm run e2e:remote
``` 
  - It will provide an url and qr code to scan in terminal
  - Scan the qr code or type the url in browser
  - Tests will get trigger in remote device
  
  #### To run tests in Jenkins
  Job name : Quotetool_Level_4_E2E
  We can trigger tests using below options
  - Branch
  - Environment
  - Tag
  - Browser

