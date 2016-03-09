//
//  RSViewController.m
//  RSEmailFeedback
//
//  Created by Ric Santos on 03/08/2016.
//  Copyright (c) 2016 Ric Santos. All rights reserved.
//

#import "RSViewController.h"
#import <RSEmailFeedback/RSEmailFeedback.h>

@interface RSViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"RSEmailFeedback Example", nil);

    self.tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"Show Mail Composer";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RSEmailFeedback *emailFeedback = [[RSEmailFeedback alloc] init];
    emailFeedback.toRecipients = @[@"rics@ntos.me"];
    emailFeedback.subject = @"Feedback for RSEmailFeedback";
    [emailFeedback showOnViewController:self withCompletionHandler:^(MFMailComposeResult result, NSError *error) {
        if (result == MFMailComposeResultSent) {
            NSLog(@"email sent 😁");
            
        } else {
            NSLog(@"email cancelled 😤");
        }
    }];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
