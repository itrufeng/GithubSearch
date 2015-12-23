//
//  LoginViewController.m
//  GithubSearch
//
//  Created by Jian Zhang on 12/23/15.
//  Copyright © 2015 Jian Zhang. All rights reserved.
//

#import "LoginViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface LoginViewController ()

@property (nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.service = [NetworkService new];
}

- (IBAction)onLogin:(id)sender {
  [self.service postWithUrl:[NSURL URLWithString:@"http://106.187.43.111:3000/login"]
                  parameter:@{@"email" : @"jizhang@tw.com", @"password" : @"12345"}
                       fail:^(NSError *error) {

                       } success:^(NSDictionary *result) {
        UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchNavigationViewController"];
        [self presentViewController:controller
                           animated:YES
                         completion:NULL];
      }];
}

@end
