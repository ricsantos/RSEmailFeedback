//
//  RSViewController.m
//  RSEmailFeedback
//
//  Created by Ric Santos on 03/08/2016.
//  Copyright (c) 2016 Ric Santos. All rights reserved.
//

#import "RSViewController.h"
#import <RSEmailFeedback/RSEmailFeedback.h>

NSString * const kRSExampleItemShowDefault = @"default";
NSString * const kRSExampleItemShowWithAdditionalInfo = @"with-additional-info";

@interface RSViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *items;

@end

@implementation RSViewController

- (instancetype)init {
    self = [super init];
    
    self.items = @[kRSExampleItemShowDefault,
                   kRSExampleItemShowWithAdditionalInfo];
    
    return self;
}

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
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    id item = self.items[indexPath.row];
    if (item == kRSExampleItemShowDefault) {
        cell.textLabel.text = NSLocalizedString(@"Show default", nil);
        
    } else if (item == kRSExampleItemShowWithAdditionalInfo ) {
        cell.textLabel.text = NSLocalizedString(@"Show with additional info", nil);
    }

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RSEmailFeedback *emailFeedback = [[RSEmailFeedback alloc] init];
    emailFeedback.toRecipients = @[@"rics@ntos.me"];
    emailFeedback.subject = @"Feedback for RSEmailFeedback";
    
    id item = self.items[indexPath.row];
    if (item == kRSExampleItemShowWithAdditionalInfo) {
        emailFeedback.additionalDeviceInfo = @[@"Place custom info here",
                                               @"One array object per line"];
    }
    
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
