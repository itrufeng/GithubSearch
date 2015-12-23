//
// Created by Jian Zhang on 12/23/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetworkServiceFail)(NSError *error);
typedef void(^NetworkServiceSuccess)(NSDictionary *result);

@interface NetworkService : NSObject

- (void)getWithurl:(NSURL *)url
         parameter:(NSDictionary *)parameter
              fail:(NetworkServiceFail)fail
           success:(NetworkServiceSuccess)success;

- (void)postWithurl:(NSURL *)url
          parameter:(NSDictionary *)parameter
               fail:(NetworkServiceFail)fail
            success:(NetworkServiceSuccess)success;

@end