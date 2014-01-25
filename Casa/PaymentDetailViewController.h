//
//  PaymentDetailViewController.h
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentDetailViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

- (IBAction)payNow:(id)sender;

@property (nonatomic, retain) IBOutlet UITableView *paymentDetailTableView;

@end
