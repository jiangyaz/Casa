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
#import "IssueDetailViewController.h"


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
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 100)];
    footer.backgroundColor = [UIColor clearColor];
    issuesTableView.tableFooterView = footer;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"IssueCell"];
    
    UILabel *issueNameLabel = (UILabel *)[cell viewWithTag:1];
    UIImageView *statusIndicatorImageView = (UIImageView *)[cell viewWithTag:2];
    
    UILabel *issueDescriptionLabel = (UILabel *)[cell viewWithTag:5];
    
    PFObject *issue;
    NSString *dotImageName;
    switch (indexPath.section) {
        case 0:
            issue = [self.theNewIssueArray objectAtIndex: indexPath.row];
            dotImageName = @"red-dot";
            break;
        case 1:
            issue = [self.curIssueArray objectAtIndex: indexPath.row];
            dotImageName = @"orange-dot";
            break;
        case 2:
            issue = [self.pastIssueArray objectAtIndex: indexPath.row];
            dotImageName = @"green-dot";
            break;
        default:
            break;
    }
    
    issueNameLabel.text = issue[@"type"];
    [statusIndicatorImageView setImage:[UIImage imageNamed:dotImageName]];
    issueDescriptionLabel.text = issue[@"details"];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    IssueDetailViewController *issueDetailController = (IssueDetailViewController *) [self.storyboard instantiateViewControllerWithIdentifier:@"issueDetailController"];
    
    switch (indexPath.section) {
        case 0:
            issueDetailController.selectedIssue = [self.theNewIssueArray objectAtIndex: indexPath.row];
            break;
        case 1:
            issueDetailController.selectedIssue = [self.curIssueArray objectAtIndex: indexPath.row];
            break;
        case 2:
            issueDetailController.selectedIssue = [self.pastIssueArray objectAtIndex: indexPath.row];
            break;
        default:
            break;
    }
    
    [self.navigationController pushViewController:issueDetailController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}



@end
