//
//  PayRentViewController.m
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import "RESideMenu.h"
#import "PayRentViewController.h"
#import "CasaAppDelegate.h"

@interface PayRentViewController ()

@end

@implementation PayRentViewController

@synthesize historyPaymentTableView;
@synthesize amountDueLabel;
@synthesize dueDateLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    CasaAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    amountDueLabel.text = [NSString stringWithFormat:@"%d", delegate.balanceVal];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMenu:(id)sender {
    [self.sideMenuViewController presentMenuViewController];
}


- (IBAction)makePayment:(id)sender {
    
}


#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Payment history";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"PaymentInfoCell"];
    
    UILabel *paymentAmountLabel = (UILabel *)[cell viewWithTag:1];
    UILabel *paymentNameLabel = (UILabel *)[cell viewWithTag:2];
    UILabel *payDateLabel = (UILabel *)[cell viewWithTag:3];
    UILabel *paymentStatusLabel = (UILabel *)[cell viewWithTag:4];
    
    switch (indexPath.row) {
        case 0:
            paymentAmountLabel.text = @"$920";
            paymentNameLabel.text = @"December Rent";
            payDateLabel.text = @"12/06/2013";
            paymentStatusLabel.text = @"Late payment";
            paymentStatusLabel.textColor = [UIColor redColor];
            break;
        case 1:
            paymentAmountLabel.text = @"$45.12";
            paymentNameLabel.text = @"Utilities";
            payDateLabel.text = @"11/14/2013";
            paymentStatusLabel.text = @"On-time";
            break;
        case 2:
            paymentAmountLabel.text = @"$120";
            paymentNameLabel.text = @"November Parking";
            payDateLabel.text = @"11/03/2013";
            paymentStatusLabel.text = @"On-time";
            break;
        default:
            break;
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

@end
