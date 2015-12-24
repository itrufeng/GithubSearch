//
//  LoginViewController.h
//  GithubSearch
//
//  Created by Jian Zhang on 12/23/15.
//  Copyright © 2015 Jian Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkService.h"

@class LoginService;

@interface LoginViewController : UIViewController

@property (nonatomic, strong) LoginService *service;

@end

