//
// Created by Jian Zhang on 12/23/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Employee : NSObject

@property (nonatomic, copy, readonly) NSString *email;
@property (nonatomic, copy, readonly) NSString *password;

- (instancetype)initWithEmail:(NSString *)email
                     password:(NSString *)password;

@end