# ClickToPay

[![Quality Gate Status](https://sonar.ealan.shinesolutions.com/api/project_badges/measure?project=click-to-pay&metric=alert_status)](https://sonar.ealan.shinesolutions.com/dashboard?id=click-to-pay)
[![Coverage](https://sonar.ealan.shinesolutions.com/api/project_badges/measure?project=click-to-pay&metric=coverage)](https://sonar.ealan.shinesolutions.com/dashboard?id=click-to-pay)
[![Duplicated Lines (%)](https://sonar.ealan.shinesolutions.com/api/project_badges/measure?project=click-to-pay&metric=duplicated_lines_density)](https://sonar.ealan.shinesolutions.com/dashboard?id=click-to-pay)
[![Bugs](https://sonar.ealan.shinesolutions.com/api/project_badges/measure?project=click-to-pay&metric=bugs)](https://sonar.ealan.shinesolutions.com/dashboard?id=click-to-pay)
[![Code Smells](https://sonar.ealan.shinesolutions.com/api/project_badges/measure?project=click-to-pay&metric=code_smells)](https://sonar.ealan.shinesolutions.com/dashboard?id=click-to-pay)
[![Quality Gate Status](https://sonar.ealan.shinesolutions.com/api/project_badges/measure?project=click-to-pay&metric=alert_status)](https://sonar.ealan.shinesolutions.com/dashboard?id=click-to-pay) 
[![Vulnerabilities](https://sonar.ealan.shinesolutions.com/api/project_badges/measure?project=click-to-pay&metric=vulnerabilities)](https://sonar.ealan.shinesolutions.com/dashboard?id=click-to-pay)

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 7.3.9.

Click-to-pay is a page for users to pay their bills. It can be accessed via an SMS link (with amount and customer ref pre-filled),
or as a standalone page, with nothing pre-filled. Future states will also include a logged-in variant, where everything is pre-filled.

## Running locally
Currently, this project relies on online backend services and can't be run entirely locally.
If you're having trouble connecting to backend services, try changing the URLs in proxy.conf.js to point to different environments.
1. `npm run start`
2. Navigate to `http://localhost:4302`

The app will automatically reload if you change any of the source files.

### Details to enter
Account number: `3542987272`
Amount: whatever you like
Credit card number: `5123 4567 8901 2346` (or any other valid Mastercard/Visa/Amex test card number)
Name: anything
Expires: any valid expiry date
CVN: anything

You can also send an email receipt, just enter any valid email address.

### SMS flow
You can also simulate launching the page via an SMS reminder. Just go to `http://localhost:4302/pay/?Ref1=5517477175&Amount=123`
instead.


## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).
Or, run `npm run test` to run unit tests with test-coverage + watch.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).
