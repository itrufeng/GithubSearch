//
// Created by Jian Zhang on 12/24/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import "UserService.h"
#import "NetworkService.h"
#import "User.h"
#import "NSArray+Functional.h"

@interface UserService ()

@property(nonatomic, strong) NetworkService *service;

@end

@implementation UserService

- (instancetype)initWithNetworkService:(NetworkService *)service
{
  self = [super init];
  if (self)
  {
    _service = service;
  }
  return self;
}

- (void)searchUserWithKeyword:(NSString *)keyword complete:(void (^)(NSArray<User *> * users))complete
{
  [self.service getWithUrl:[NSURL URLWithString:@"https://api.github.com/search/users"]
                 parameter:@{@"q" : keyword}
                      fail:^(NSError *error) {

                      }
                   success:^(NSDictionary *result) {
                     NSArray *items = result[@"items"];
                     NSArray<User *> *users = [items mapUsingBlock:^id(NSDictionary *item) {
                       return [[User alloc] initWithDict:item];
                     }];
                     complete(users);
                   }];
}


@end
