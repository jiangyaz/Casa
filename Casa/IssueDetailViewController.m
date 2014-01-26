//
//  IssueDetailViewController.m
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import "IssueDetailViewController.h"

@interface IssueDetailViewController ()

@end

@implementation IssueDetailViewController

@synthesize issueDetailTableView;
@synthesize selectedIssue;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 6;
        case 1:
            return 1;
        default:
            return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"Issue Info";
        case 1:
            return @"Details";
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *urgencyName = [[NSArray alloc] initWithObjects: @"Not urgent", @"Urgent", @"Extreme urgent", nil];
    NSArray *statusName = [[NSArray alloc] initWithObjects: @"New issue", @"In progress", @"Resolved", nil];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier: @"IssueNormalCell"];
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Tenant Name";
                    cell.detailTextLabel.text = @"Johnathan Sutherland";
                    break;
                case 1:
                    cell.textLabel.text = @"Category";
                    cell.detailTextLabel.text = selectedIssue[@"type"];
                    break;
                case 2:
                    cell.textLabel.text = @"Status";
                    cell.detailTextLabel.text = [statusName objectAtIndex: [selectedIssue[@"status"] integerValue]];
                    break;
                case 3:
                    cell.textLabel.text = @"Urgency";
                    cell.detailTextLabel.text = [urgencyName objectAtIndex: [selectedIssue[@"urgency_level"] integerValue]];
                    break;
                case 4:
                    cell.textLabel.text = @"Issue date";
                    cell.detailTextLabel.text = [formatter stringFromDate: selectedIssue[@"issue_date"]];
                    break;
                case 5:
                    cell.textLabel.text = @"Completion";
                    cell.detailTextLabel.text = [formatter stringFromDate: selectedIssue[@"completion_date"]];
                    break;
                default:
                    break;
            }
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier: @"IssueDetailCell"];
            UITextView *issueDetailTextView = (UITextView *)[cell viewWithTag:1];
            issueDetailTextView.text = selectedIssue[@"details"];
            break;
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
    case 0:
        return 44;
    case 1:
        return 100;
    default:
        return 0;
    }
}


@end
