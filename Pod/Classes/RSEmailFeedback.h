//
//  RSEmailFeedback.h
//  RSEmailFeedback
//
//  Created by Ric Santos on 9/03/2016.
//  Copyright © 2016 Ric Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

typedef void (^RSEmailFeedbackCompletion)(MFMailComposeResult result, NSError *error);

@interface RSEmailFeedback : NSObject

- (void)showOnViewController:(UIViewController *)viewController withCompletionHandler:(RSEmailFeedbackCompletion)completion;

@property (nonatomic, strong) NSArray<NSString *> *toRecipients;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSArray<NSString *> *additionalDeviceInfo;

@property (nonatomic, strong) UIColor *tintColor;

@end
