//
//  RSEmailFeedback.m
//  RSEmailFeedback
//
//  Created by Ric Santos on 9/03/2016.
//  Copyright © 2016 Ric Santos. All rights reserved.
//

#import "RSEmailFeedback.h"
#import <GBDeviceInfo/GBDeviceInfo.h>

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
        mailComposeViewController.mailComposeDelegate = self;
        if (self.tintColor) {
            mailComposeViewController.navigationBar.tintColor = self.tintColor;
        }
        
        [mailComposeViewController setToRecipients:self.toRecipients];
        [mailComposeViewController setSubject:self.subject];

        NSMutableArray *lines = [NSMutableArray array];
        [lines addObject:@"<br><br><br><br><br><br><br><br><br><br><br>"];
        [lines addObject:@"<hr>Device info:"];
        
        NSString *deviceModel = [GBDeviceInfo deviceInfo].modelString;
        [lines addObject:deviceModel];
        
        NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
        [lines addObject:[NSString stringWithFormat:@"iOS %@", systemVersion]];
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *majorVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        NSString *minorVersion = [infoDictionary objectForKey:@"CFBundleVersion"];
        [lines addObject:[NSString stringWithFormat:@"App Version %@ (%@)", majorVersion, minorVersion]];
        
        [lines addObjectsFromArray:self.additionalDeviceInfo];
        
        [lines addObject:@"<hr>"];
        
        [mailComposeViewController setMessageBody:[lines componentsJoinedByString:@"<br>"] isHTML:YES];
        
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
