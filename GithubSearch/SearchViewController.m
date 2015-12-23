//
// Created by Jian Zhang on 12/23/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import "SearchViewController.h"
#import "NetworkService.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation SearchViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.service = [NetworkService new];
}


- (IBAction)onSearch:(id)sender
{
  [self.service getWithurl:[NSURL URLWithString:@"https://api.github.com/search/users"]
                 parameter:@{@"q" : self.searchTextField.text}
                      fail:^(NSError *error) {

                      }
                   success:^(NSDictionary *result) {
                     UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ListingViewController"];
                     [self.navigationController showViewController:controller
                                                            sender:nil];
                   }];
}

@end
