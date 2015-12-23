//
// Created by Jian Zhang on 12/23/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import "Employee.h"

@interface Employee ()

@property (nonatomic, copy, readwrite) NSString *email;
@property (nonatomic, copy, readwrite) NSString *password;

@end

@implementation Employee

- (instancetype)initWithEmail:(NSString *)email
                     password:(NSString *)password
{
  self = [super init];
  if (self)
  {
    _email = email;
    _password = password;
  }
  return self;
}

@end