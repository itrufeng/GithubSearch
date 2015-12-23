//
// Created by Jian Zhang on 12/23/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import "NetworkService.h"

#import <AFNetworking/AFNetworking.h>

@implementation NetworkService

- (void)getWithurl:(NSURL *)url
         parameter:(NSDictionary *)parameter
              fail:(NetworkServiceFail)fail
           success:(NetworkServiceSuccess)success
{

  [[AFHTTPSessionManager manager] GET:[url absoluteString]
                           parameters:parameter
                             progress:NULL
                              success:^(NSURLSessionDataTask *task, id responseObject) {
                                success(responseObject);
                              }
                              failure:^(NSURLSessionDataTask *task, NSError *error) {
                                fail(error);
                              }];
}

- (void)postWithurl:(NSURL *)url
          parameter:(NSDictionary *)parameter
               fail:(NetworkServiceFail)fail
            success:(NetworkServiceSuccess)success
{

  [[AFHTTPSessionManager manager] POST:[url absoluteString]
                            parameters:parameter
                              progress:NULL
                               success:^(NSURLSessionDataTask *task, id responseObject) {
                                 success(responseObject);
                               }
                               failure:^(NSURLSessionDataTask *task, NSError *error) {
                                 fail(error);
                               }];
}

@end
