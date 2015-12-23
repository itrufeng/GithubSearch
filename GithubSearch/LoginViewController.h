//
//  LoginViewController.h
//  GithubSearch
//
//  Created by Jian Zhang on 12/23/15.
//  Copyright © 2015 Jian Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkService.h"

@interface LoginViewController : UIViewController

@property (nonatomic, strong) NetworkService *service;

@end

