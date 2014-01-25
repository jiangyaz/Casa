//
//  PayRentViewController.h
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayRentViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (IBAction)showMenu:(id)sender;
- (IBAction)makePayment:(id)sender;

@property (nonatomic, retain) IBOutlet UITableView *historyPaymentTableView;
@property (nonatomic, retain) IBOutlet UILabel *amountDueLabel;
@property (nonatomic, retain) IBOutlet UILabel *dueDateLabel;

@end
