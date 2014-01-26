//
//  DirectoryViewController.m
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import "RESideMenu.h"
#import <Parse/Parse.h>
#import "DirectoryViewController.h"

@interface DirectoryViewController ()

@end

@implementation DirectoryViewController

@synthesize directoryTableView;
@synthesize directoryHUD;

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
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 60)];
    footer.backgroundColor = [UIColor clearColor];
    directoryTableView.tableFooterView = footer;
    
    directoryHUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview: directoryHUD];
	directoryHUD.delegate = self;
	directoryHUD.labelText = @"Loading";
    [directoryHUD show:YES];
	
    PFQuery *query = [PFQuery queryWithClassName:@"Tenant"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *object in objects) {
                self.tenantArray = [[NSArray alloc] initWithArray:objects];
            }
            [directoryTableView reloadData];
            [directoryHUD hide:YES];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tenantArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"TenantInfoCell"];
    
    UIImageView *tenantImageView = (UIImageView *)[cell viewWithTag:1];
    UILabel *tenantNameLabel = (UILabel *)[cell viewWithTag:2];
    UILabel *tenantRoomLabel = (UILabel *)[cell viewWithTag:3];
    UILabel *tenantEmailLabel = (UILabel *)[cell viewWithTag:4];
    UILabel *tenantPhoneLabel = (UILabel *)[cell viewWithTag:5];
    
    PFObject *tenant = [self.tenantArray objectAtIndex:indexPath.row];
    tenantNameLabel.text = tenant[@"name"];
    tenantEmailLabel.text = tenant[@"email"];
    tenantPhoneLabel.text = tenant[@"phone"];
    tenantRoomLabel.text = tenant[@"unit"];
    
    [tenantImageView setImage:[UIImage imageNamed:tenant.objectId]];

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}



@end
