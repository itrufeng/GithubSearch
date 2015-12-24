//
// Created by Jian Zhang on 12/24/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserCollectionViewCellModel : NSObject

- (instancetype)initWithUser:(User *)user;

- (NSString *)avatorURL;

- (NSString *)nickName;

- (NSString *)colorHex;

@end