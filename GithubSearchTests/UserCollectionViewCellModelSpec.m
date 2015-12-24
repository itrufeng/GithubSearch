//
//  UserCollectionViewCellModelSpec.m
//  GithubSearch
//
//  Created by Yanzi Li on 12/24/15.
//  Copyright 2015 Jian Zhang. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "UserCollectionViewCellModel.h"


SPEC_BEGIN(UserCollectionViewCellModelSpec)

describe(@"UserCollectionViewCellModel", ^{
  describe(@"avatorURL", ^{
    it(@"shoud equal http://tw.com/avator/3", ^{
      User *user = [User nullMock];
      [user stub:@selector(avatarURL) andReturn:@"http://tw.com/avator/3"];
      UserCollectionViewCellModel *cellModel = [[UserCollectionViewCellModel alloc] initWithUser:user];
      [[[cellModel avatorURL] should] equal:@"http://tw.com/avator/3"];
    });
  });

  describe(@"nickName", ^{
    it(@"shoud equal Tom", ^{
      User *user = [User nullMock];
      [user stub:@selector(loginName) andReturn:@"tom"];
      UserCollectionViewCellModel *cellModel = [[UserCollectionViewCellModel alloc] initWithUser:user];
      [[[cellModel nickName] should] equal:@"Tom"];
    });
  });
});

SPEC_END
