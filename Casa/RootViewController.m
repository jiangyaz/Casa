//
//  RootViewController.m
//  Casa
//
//  Created by Jiangyang Zhang on 1/25/14.
//  Copyright (c) 2014 HackTech. All rights reserved.
//

#import "RootViewController.h"
#import "MenuViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)awakeFromNib {
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"];
    self.backgroundImage = [UIImage imageNamed:@"background"];
    self.scaleBackgroundImageView = NO;
    self.parallaxEnabled = NO;
    self.panGestureEnabled = NO;
    self.delegate = (MenuViewController *)self.menuViewController;
}

@end
