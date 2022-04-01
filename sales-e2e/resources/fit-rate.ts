const SolarMaxRates = {
  solarMaxPlan : {
    singleRate: {
      text: 'Single rate feed-in tariff (excl. GST)',
      rate: '10c/kWh'
    },
    timeOfUse: {
      text: 'Time of use feed-in tariffs (excl. GST)',
      Peak: {
        text: 'Peak:',
        rate: '16.3c/kWh',
        timeDuration: '(3pm-9pm Weekdays)'
      },
      Shoulder: {
        text: 'Shoulder:',
        rate: '10c/kWh',
        weekDayTime:'(7am-3pm, 9pm-10pm Weekdays)',
        weekendTime: '(7am-10pm Weekends)'
      },
      OffPeak: {
        text: 'Off Peak:',
        rate: '9.1c/kWh',
        timeDuration: '(10pm-7am Everyday)'
      }
    }
  },
  nonSolarMaxPlan: {
    singleRate: {
      text: 'Single rate feed-in tariff (excl. GST)',
      rate: '7.1c/kWh'
    },
    timeOfUse: {
      text: 'Time of use feed-in tariffs (excl. GST)',
      Peak: {
        text: 'Peak:',
        rate: '11.6c/kWh',
        timeDuration: '(3pm-9pm Weekdays)'
      },
      Shoulder: {
        text: 'Shoulder:',
        rate: '6.5c/kWh',
        weekDayTime:'(7am-3pm, 9pm-10pm Weekdays)',
        weekendTime: '(7am-10pm Weekends)'
      },
      OffPeak: {
        text: 'Off Peak:',
        rate: '7.1c/kWh',
        timeDuration: '(10pm-7am Everyday)'
      }
    }
  }
}

export {SolarMaxRates}
