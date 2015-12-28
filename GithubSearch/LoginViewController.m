//
//  LoginViewController.m
//  GithubSearch
//
//  Created by Jian Zhang on 12/23/15.
//  Copyright © 2015 Jian Zhang. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginService.h"
#import "Employee.h"
#import <AFNetworking/AFNetworking.h>

@interface LoginViewController ()

@property (nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.service = [[LoginService alloc] initWithNetService:[NetworkService new]];
}

- (IBAction)onLogin:(id)sender {
  [self.service loginWithEmployee:[[Employee alloc] initWithEmail:self.usernameTextField.text password:self.passwordTextField.text]
                         complete:^(Employee *employee) {
                           UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchNavigationViewController"];
                           [self presentViewController:controller
                                              animated:YES
                                            completion:NULL];
                         }
                             fail:^(NSString *msg){
//                               UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
//                                                                                              message:msg
//                                                                                       preferredStyle:UIAlertControllerStyleAlert];
//                               UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault
//                                                                                     handler:^(UIAlertAction *action) {
//                                                                                     }];
//                               [alert addAction:defaultAction];
//                               [self presentViewController:alert
//                                                  animated:YES
//                                                completion:nil];
                             }];
}

@end
