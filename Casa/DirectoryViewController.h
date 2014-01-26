//
//  DirectoryViewController.h
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectoryViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

- (IBAction)showMenu:(id)sender;

@property (nonatomic, retain) IBOutlet UITableView *directoryTableView;
@property (nonatomic, strong) NSArray *tenantArray;

@end
