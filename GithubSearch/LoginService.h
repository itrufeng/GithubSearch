//
// Created by Yanzi Li on 12/24/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NetworkService;
@class Employee;

@interface LoginService : NSObject

- (instancetype)initWithNetService:(NetworkService *)service;

- (void)loginWithEmployee:(Employee *)employee
                 complete:(void (^)(Employee *employee))complete
                     fail:(void(^)(NSString *msg))fail;

@end
