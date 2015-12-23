//
// Created by Jian Zhang on 12/24/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@class UserCollectionViewCellModel;


@interface ListingViewModel : NSObject

- (instancetype)initWithUsers:(NSArray<User *> *)users;

- (NSArray<UserCollectionViewCellModel *> *)userCollectionViewCellModels;

@end
