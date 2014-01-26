//
//  MaintainenceViewController.m
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import "RESideMenu.h"
#import <Parse/Parse.h>
#import "MaintainenceViewController.h"


@interface MaintainenceViewController ()

@end

@implementation MaintainenceViewController

@synthesize issuesTableView;
@synthesize maintainHUD;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    maintainHUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview: maintainHUD];
	maintainHUD.delegate = self;
	maintainHUD.labelText = @"Loading";
    [maintainHUD show:YES];
    
    [self loadIssues];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.theNewIssueArray  = [[NSMutableArray alloc] init];
    self.curIssueArray  = [[NSMutableArray alloc] init];
    self.pastIssueArray = [[NSMutableArray alloc] init];
}

- (void) loadIssues {
    [self.theNewIssueArray removeAllObjects];
    [self.curIssueArray removeAllObjects];
    [self.pastIssueArray removeAllObjects];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Issue"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *object in objects) {
                switch ([object[@"status"] integerValue]) {
                    case 0:
                        [self.theNewIssueArray addObject:object];
                        break;
                    case 1:
                        [self.curIssueArray addObject:object];
                        break;
                    case 2:
                        [self.pastIssueArray addObject:object];
                        break;
                    default:
                        break;
                }
            }
            [issuesTableView reloadData];
            [maintainHUD hide:YES];
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMenu:(id)sender {
    [self.sideMenuViewController presentMenuViewController];
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return [self.theNewIssueArray count];
        case 1:
            return [self.curIssueArray count];
        case 2:
            return [self.pastIssueArray count];
        default:
            return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"New issues";
        case 1:
            return @"In progress";
        case 2:
            return @"Past issues";
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSArray *urgencyName = [[NSArray alloc] initWithObjects: @"Not urgent", @"Urgent", @"Extreme urgent", nil];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"IssueCell"];
    
    UILabel *issueNameLabel = (UILabel *)[cell viewWithTag:1];
    UILabel *issueUrgencyLabel = (UILabel *)[cell viewWithTag:2];
    UILabel *issueBeginDateLabel = (UILabel *)[cell viewWithTag:3];
    UILabel *issueEndDateLabel = (UILabel *)[cell viewWithTag:4];
    UILabel *issueDescriptionLabel = (UILabel *)[cell viewWithTag:5];
    
    PFObject *issue;
    switch (indexPath.section) {
        case 0:
            issue = [self.theNewIssueArray objectAtIndex: indexPath.row];
            break;
        case 1:
            issue = [self.curIssueArray objectAtIndex: indexPath.row];
            break;
        case 2:
            issue = [self.pastIssueArray objectAtIndex: indexPath.row];
            break;
        default:
            break;
    }
    
    issueNameLabel.text = issue[@"type"];
    issueUrgencyLabel.text = [urgencyName objectAtIndex: [issue[@"urgency_level"] integerValue]];
    issueBeginDateLabel.text = [formatter stringFromDate: issue[@"issue_date"]];
    issueEndDateLabel.text = [formatter stringFromDate: issue[@"completion_date"]];
    issueDescriptionLabel.text = issue[@"details"];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}



@end
