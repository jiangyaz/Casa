//
//  MaintainenceViewController.h
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface MaintainenceViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, MBProgressHUDDelegate>

@property (nonatomic, retain) IBOutlet UITableView *issuesTableView;

@property (strong, nonatomic) NSMutableArray *theNewIssueArray;
@property (retain, nonatomic) NSMutableArray *curIssueArray;
@property (retain, nonatomic) NSMutableArray *pastIssueArray;

@property (nonatomic, strong) MBProgressHUD *maintainHUD;

- (IBAction)showMenu:(id)sender;

@end
