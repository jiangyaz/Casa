//
//  SubmitIssueViewController.m
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import "RESideMenu.h"
#import <Parse/Parse.h>
#import "SubmitIssueViewController.h"

@interface SubmitIssueViewController ()

@end

@implementation SubmitIssueViewController

@synthesize urgencyControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.issuesArray  = [[NSArray alloc] initWithObjects: @"Noisy neighbors", @"Electrical", @"Plumming", @"Appliances", @"Locks", @"Parking", @"Other", nil];
    self.urgencyArray = [[NSArray alloc] initWithObjects: @"Not urgent", @"Urgent", @"Extreme urgent", nil];
    self.issueDetailString = @"";
    self.issueTypeString = [self.issuesArray  objectAtIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component {
    return 7;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.issuesArray objectAtIndex:row];
}


- (void) textViewDidBeginEditing:(UITextView *)textView {
    textView.text = self.issueDetailString;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    self.view.frame = CGRectMake(0, -120.0f, 320.0, self.view.frame.size.height);
    [UIView commitAnimations];
}


- (BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
{
	if ([text isEqualToString: @"\n"]) {
        [textView resignFirstResponder];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.50];
        [UIView setAnimationDelay:0.0];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        self.view.frame = CGRectMake(0, 0.0, 320.0, self.view.frame.size.height);
        [UIView commitAnimations];
        
        self.issueDetailString = textView.text;
        
        return NO;
    }
    return YES;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.issueTypeString = [self.issuesArray objectAtIndex: row];
}


- (IBAction) submitIssue:(id)sender {
    PFObject *issueObject = [PFObject objectWithClassName:@"Issue"];
    issueObject[@"type"] = self.issueTypeString;
    issueObject[@"status"] = @0;
    issueObject[@"tenant_id"] = @"xlFCyOZQKp";     // Hard coded as Jonathan Sutherland
    issueObject[@"issue_date"] = [NSDate date];
    issueObject[@"details"] = self.issueDetailString;
    issueObject[@"urgency_level"] = [NSNumber numberWithInteger: urgencyControl.selectedSegmentIndex];
    [issueObject saveInBackground];

    [self showAlert];
}

- (void) showAlert {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Issue submitted"
                          message: @"Your issue has been reported to your landlord and will soon be processed!"
                          delegate: self
                          cancelButtonTitle:@"Sounds Good!" otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
