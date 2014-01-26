//
//  MyCasaViewController.m
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import "RESideMenu.h"
#import "MyCasaViewController.h"

@interface MyCasaViewController ()

@end

@implementation MyCasaViewController

@synthesize myCasaTableView;

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
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor : [UIColor whiteColor]};
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 5;
        default:
            return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"";
        case 1:
            return @"What's New";
        default:
            return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier: @"ApartmentInfoCell"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier: @"ApartmentActivityCell"];
            UIImageView *activityImage = (UIImageView *)[cell viewWithTag:1];
            UILabel *activityNameLabel = (UILabel *)[cell viewWithTag:2];
            UILabel *activityLocationTimeLabel = (UILabel *)[cell viewWithTag:3];
            UILabel *acticityInfoLabel = (UILabel *)[cell viewWithTag:4];
            UILabel *acticityDateLabel = (UILabel *)[cell viewWithTag:5];
            UILabel *acticityDateInfoLabel = (UILabel *)[cell viewWithTag:6];
            
            switch (indexPath.row) {
                case 0:
                    [activityImage setImage:[UIImage imageNamed:@"lost_found"]];
                    activityNameLabel.text = @"Keys found!";
                    activityLocationTimeLabel.text = @"10+ keys with LA fitness tag";
                    acticityInfoLabel.text = @"Please come to see landlord";
                    acticityDateLabel.text = @"01/24/2014";
                    acticityDateInfoLabel.text = @"Yesterday";
                    break;
                case 1:
                    [activityImage setImage:[UIImage imageNamed:@"houseparty"]];
                    activityNameLabel.text = @"Ted's house warming party";
                    activityLocationTimeLabel.text = @"Unit 102, 7pm-9pm";
                    acticityInfoLabel.text = @"You're invited!";
                    acticityDateLabel.text = @"01/25/2014";
                    acticityDateInfoLabel.text = @"Today";
                    break;
                case 2:
                    [activityImage setImage:[UIImage imageNamed:@"water_shut"]];
                    activityNameLabel.text = @"Temporary water shut-off";
                    activityLocationTimeLabel.text = @"All units, 11am-3pm";
                    acticityInfoLabel.text = @"Apologies for the inconvenience";
                    acticityDateLabel.text = @"01/28/2014";
                    acticityDateInfoLabel.text = @"in 3 days";
                    break;
                case 3:
                    [activityImage setImage:[UIImage imageNamed:@"rent_due"]];
                    activityNameLabel.text = @"January rent due";
                    activityLocationTimeLabel.text = @"Due at 11:59pm";
                    acticityInfoLabel.text = @"Don't be late!";
                    acticityDateLabel.text = @"01/31/2014";
                    acticityDateInfoLabel.text = @"in 6 days";
                    break;
                case 4:
                    [activityImage setImage:[UIImage imageNamed:@"pool_maintain"]];
                    activityNameLabel.text = @"Pool maintainence";
                    activityLocationTimeLabel.text = @"Only for swimming pool, jacuzzi still open";
                    acticityInfoLabel.text = @"Closed till 02/10/2014";
                    acticityDateLabel.text = @"02/03/2014";
                    acticityDateInfoLabel.text = @"in 10 days";
                    break;
                default:
                    break;
            }
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
            return 100;
        case 1:
            return 60;
        default:
            return 0;
    }
}

@end
