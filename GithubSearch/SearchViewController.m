//
// Created by Jian Zhang on 12/23/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import "SearchViewController.h"


@implementation SearchViewController

- (IBAction)onSearch:(id)sender {
  UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ListingViewController"];
  [self.navigationController showViewController:controller
                                         sender:nil];
}

@end
