//
//  IssueDetailViewController.h
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface IssueDetailViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) IBOutlet UITableView *issueDetailTableView;
@property (nonatomic, retain) PFObject *selectedIssue;

@end
