# RSEmailFeedback

[![CI Status](http://img.shields.io/travis/ricsantos/RSEmailFeedback.svg?style=flat)](https://travis-ci.org/ricsantos/RSEmailFeedback)
[![Version](https://img.shields.io/cocoapods/v/RSEmailFeedback.svg?style=flat)](http://cocoapods.org/pods/RSEmailFeedback)
[![License](https://img.shields.io/cocoapods/l/RSEmailFeedback.svg?style=flat)](http://cocoapods.org/pods/RSEmailFeedback)
[![Platform](https://img.shields.io/cocoapods/p/RSEmailFeedback.svg?style=flat)](http://cocoapods.org/pods/RSEmailFeedback)

A simple way to get direct feedback from your App users is via email. This component simplifies the presentation of the email composer by adding blocks, and pre-populates the email message body with details about the device, OS and app version.


<img src=https://github.com/ricsantos/RSEmailFeedback/raw/develop/Screenshots/screenshot-01.png width=375>

## Installation

RSEmailFeedback is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RSEmailFeedback'
```

## Usage

(see sample Xcode project in /Demo)

Create an instance of `RSEmailFeedback` and present it by passing a reference the the visible view controller, and an optional block to run on completion.

#### Objective C:

    RSEmailFeedback *emailFeedback = [[RSEmailFeedback alloc] init];
    emailFeedback.toRecipients = @[@"rics@ntos.me"];
    emailFeedback.subject = @"Feedback for RSEmailFeedback";
    [emailFeedback showOnViewController:self withCompletionHandler:^(MFMailComposeResult result, NSError *error) {
        if (result == MFMailComposeResultSent) {
            NSLog(@"email sent 😁");   
        }
    }];
    
#### Swift:

    let emailFeedback = RSEmailFeedback()
    emailFeedback.toRecipients = ["rics@ntos.me"]
    emailFeedback.subject = "Feedback for RSEmailFeedback"
    emailFeedback.showOnViewController(self, withCompletionHandler: nil)

## License

RSEmailFeedback is available under the MIT license. See the LICENSE file for more info.
