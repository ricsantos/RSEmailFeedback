//
//  RSEmailFeedback.m
//  RSEmailFeedback
//
//  Created by Ric Santos on 9/03/2016.
//  Copyright © 2016 Ric Santos. All rights reserved.
//

#import "RSEmailFeedback.h"

@interface RSEmailFeedback () <MFMailComposeViewControllerDelegate>

@property (strong) RSEmailFeedbackCompletion completion;
@property (strong) UIViewController *viewController;
@property (strong) RSEmailFeedback *strongSelf;

@end

@implementation RSEmailFeedback

- (void)showOnViewController:(UIViewController *)viewController withCompletionHandler:(void (^)(MFMailComposeResult result, NSError *error))completion {
    
    if ([MFMailComposeViewController canSendMail]) {
        self.completion = completion;
        self.viewController = viewController;
        self.strongSelf = self;
        
        MFMailComposeViewController *mailComposeViewController = [[MFMailComposeViewController alloc] init];
        //composeViewController.navigationBar.tintColor = [Appearance themeColor1];
        mailComposeViewController.mailComposeDelegate = self;
        
        [mailComposeViewController setToRecipients:self.toRecipients];
        [mailComposeViewController setSubject:self.subject];
        
        NSString *systemName = [[UIDevice currentDevice] systemName];
        NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *majorVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        NSString *minorVersion = [infoDictionary objectForKey:@"CFBundleVersion"];
        
        NSString *messageBody = [NSString stringWithFormat:@"\n\n\n\n\n\n\n\n\n%@ %@\nVersion: %@ (%@)", systemName, systemVersion, majorVersion, minorVersion];
        [mailComposeViewController setMessageBody:messageBody isHTML:NO];
        
        [viewController presentViewController:mailComposeViewController animated:YES completion:nil];
        
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Cannot send mail", nil)
                                                            message:NSLocalizedString(@"This device does not have an email account configured. Please configure one in the device settings to send email.", nil)
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:NSLocalizedString(@"OK", nil), nil];
            [alert show];
        });
    }
}

#pragma mark -  MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
    self.viewController = nil;
    
    if (self.completion) {
        self.completion(result, error);
        self.completion = nil;
    }
    
    self.strongSelf = nil;
}

@end
