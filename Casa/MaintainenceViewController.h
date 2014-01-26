//
//  MaintainenceViewController.h
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaintainenceViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) IBOutlet UITableView *issuesTableView;

@property (strong, nonatomic) NSMutableArray *theNewIssueArray;
@property (retain, nonatomic) NSMutableArray *curIssueArray;
@property (retain, nonatomic) NSMutableArray *pastIssueArray;

- (IBAction)showMenu:(id)sender;

@end
