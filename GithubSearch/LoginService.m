//
// Created by Yanzi Li on 12/24/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import "LoginService.h"
#import "NetworkService.h"
#import "Employee.h"

@interface LoginService ()

@property(nonatomic, strong) NetworkService *service;

@end

@implementation LoginService

- (instancetype)initWithNetService:(NetworkService *)service
{
  self = [super init];
  if (self)
  {
    _service = service;
  }
  return self;
}

- (void)loginWithEmployee:(Employee *)employee
                 complete:(void(^)(Employee *employee))complete
{
  [self.service postWithUrl:[NSURL URLWithString:@"http://106.187.43.111:3000/login"]
                  parameter:@{@"email" : employee.email, @"password" : employee.password}
                       fail:^(NSError *error) {
                         NSLog(@"error:%@", error);
                       }
                    success:^(NSDictionary *result) {
                      NSLog(@"result:%@", result);
                      if ([result[@"code"] isEqual:@0])
                      {
                        complete(employee);
                      }
                    }];
}

@end
