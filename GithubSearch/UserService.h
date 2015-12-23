//
// Created by Jian Zhang on 12/24/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NetworkService;
@class User;

@interface UserService : NSObject

- (instancetype)initWithNetworkService:(NetworkService *)service;

- (void)searchUserWithKeyword:(NSString *)keyword
                     complete:(void (^)(NSArray<User *> *users))complete;

@end
