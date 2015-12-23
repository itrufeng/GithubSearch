//
// Created by Jian Zhang on 12/23/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import "SearchViewController.h"
#import "NetworkService.h"
#import "UserService.h"
#import "ListingViewModel.h"
#import "ListingViewController.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation SearchViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.service = [[UserService alloc] initWithNetworkService:[NetworkService new]];
}


- (IBAction)onSearch:(id)sender
{
  [self.service searchUserWithKeyword:self.searchTextField.text
                             complete:^(NSArray<User *> *users) {
                               ListingViewModel *viewModel = [[ListingViewModel alloc] initWithUsers:users];
                               ListingViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ListingViewController"];
                               [controller configListingViewModel:viewModel];
                               [self.navigationController showViewController:controller
                                                                      sender:nil];
                             }];
}

@end
