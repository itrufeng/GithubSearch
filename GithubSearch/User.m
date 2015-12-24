//
// Created by Jian Zhang on 12/23/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import "User.h"

@interface User ()

@property (nonatomic, copy, readwrite) NSString *id;
@property (nonatomic, copy, readwrite) NSString *loginName;
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *avatarURL;
@property (nonatomic, copy, readwrite) NSString *blogURL;
@property (nonatomic, copy, readwrite) NSString *location;
@property (nonatomic, copy, readwrite) NSString *email;
@property (nonatomic, copy, readwrite) NSString *reposCount;
@property (nonatomic, copy, readwrite) NSString *followers;
@property (nonatomic, copy, readwrite) NSString *type;

@end

@implementation User

- (instancetype)initWithDict:(NSDictionary *)dict
{
  self = [super init];
  if (self)
  {
    _id = dict[@"id"];
    _loginName = dict[@"login"];
    _name = dict[@"name"];
    _avatarURL = dict[@"avatar_url"];
    _blogURL = dict[@"blog"];
    _location = dict[@"location"];
    _email = dict[@"email"];
    _reposCount = dict[@"public_repos"];
    _followers = dict[@"followers"];
    _type = dict[@"type"];
  }
  return self;
}

@end
