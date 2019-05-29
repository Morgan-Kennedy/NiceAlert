# NiceAlert
Swift Alert that is easy, professional and clean.

Configuration:
1) Import NiceAlert into your project by either downloading the file and adding it, or going through cocoapods
2) If you are using the cancel button or ok button options. Add the following to your localisation.strings file: 
```
"GOkButton" = "Ok";
"GCancelButton" = "Cancel";
```

Displaying an OK alert:
Somewhere in your viewController do the following:
```
NiceAlertPresentationManager.presentAlertOver(controller: self, okAlertTitle: titleText, message: messageText)
```

Displaying an Alert with custom buttons:
Each button has a closure you can use anytime the button is tapped. So you create the buttons, and attach them to the alert like so:
```
let suggestionButton = NiceAlertButton(localizedKeyTitle: "WelcomeLeaveFeedbackAlertSuggestion") {
//self.sendEmailWithType(type: .suggestion)
}

let reportBugButton = NiceAlertButton(localizedKeyTitle: "WelcomeLeaveFeedbackAlertReportBug") {
//self.sendEmailWithType(type: .bug)
}

let rateButton = NiceAlertButton(localizedKeyTitle: "WelcomeLeaveFeedbackAlertRate") {
//self.goToRateMyApp()
}

NiceAlertPresentationManager.presentAlertOver(controller: self,
title: title,
message: message,
button1: suggestionButton,
button2: reportBugButton,
button3: rateButton,
button4: nil,
usesDefaultCancelButton: true)
```

And that's it! Super easy, and it looks amazing!
