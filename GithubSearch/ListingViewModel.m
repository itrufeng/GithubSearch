//
// Created by Jian Zhang on 12/24/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import "ListingViewModel.h"
#import "User.h"
#import "UserCollectionViewCellModel.h"
#import "NSArray+Functional.h"

@interface ListingViewModel ()

@property (nonatomic, strong) NSArray<User *> *users;

@end

@implementation ListingViewModel

- (instancetype)initWithUsers:(NSArray<User *> *)users
{
  self = [super init];
  if (self)
  {
    _users = users;
  }
  return self;
}

- (NSArray<UserCollectionViewCellModel *> *)userCollectionViewCellModels
{
  return [self.users mapUsingBlock:^id(User *user) {
    return [[UserCollectionViewCellModel alloc] initWithUser:user];
  }];
}

@end
