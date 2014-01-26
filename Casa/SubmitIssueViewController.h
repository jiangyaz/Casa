//
//  SubmitIssueViewController.h
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubmitIssueViewController : UIViewController
<UIPickerViewDataSource,UIPickerViewDelegate, UITextViewDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *issuePicker;
@property (strong, nonatomic) IBOutlet UISegmentedControl *urgencyControl;

@property (strong, nonatomic) NSArray *issuesArray;
@property (strong, nonatomic) NSArray *urgencyArray;

@property (strong, nonatomic) NSString *issueTypeString;
@property (strong, nonatomic) NSString *issueDetailString;

- (IBAction) submitIssue:(id)sender;

@end
