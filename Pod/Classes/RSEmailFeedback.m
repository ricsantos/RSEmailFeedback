//
//  RSEmailFeedback.m
//  RSEmailFeedback
//
//  Created by Ric Santos on 9/03/2016.
//  Copyright © 2016 Ric Santos. All rights reserved.
//

#import "RSEmailFeedback.h"

@implementation RSEmailFeedback

+ (void)showOnViewController:(UIViewController *)viewController {
    UIViewController *testViewController = [[UIViewController alloc] init];
    testViewController.view.backgroundColor = [UIColor magentaColor];
    [viewController presentViewController:testViewController animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [viewController dismissViewControllerAnimated:YES completion:nil];
        });
    }];
}

@end
