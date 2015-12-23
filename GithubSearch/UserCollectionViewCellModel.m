//
// Created by Jian Zhang on 12/24/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import "UserCollectionViewCellModel.h"

@interface UserCollectionViewCellModel()

@property (nonatomic, strong) User *user;

@end

@implementation UserCollectionViewCellModel

- (instancetype)initWithUser:(User *)user
{
  self = [super init];
  if (self)
  {
    _user = user;
  }
  return self;
}

- (NSString *)avatorURL
{
  return self.user.avatarURL;
}

- (NSString *)nickName
{
  NSString *capitalized = [[[self.user.loginName substringToIndex:1] uppercaseString] stringByAppendingString:[self.user.loginName substringFromIndex:1]];
  return capitalized;
}


@end
