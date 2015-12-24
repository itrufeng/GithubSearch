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
    it(@"should equal Tom", ^{
      User *user = [User nullMock];
      [user stub:@selector(loginName) andReturn:@"tom"];
      UserCollectionViewCellModel *cellModel = [[UserCollectionViewCellModel alloc] initWithUser:user];
      [[[cellModel nickName] should] equal:@"Tom"];
    });
  });

  describe(@"colorHex", ^{
    context(@"the type is user", ^{
      it(@"should equal 000000", ^{
        User *user = [User nullMock];
        [user stub:@selector(type) andReturn:@"User"];
        UserCollectionViewCellModel *cellModel = [[UserCollectionViewCellModel alloc] initWithUser:user];
        [[[cellModel colorHex] should] equal:@"000000"];
      });
    });

    context(@"the type is organization", ^{
      it(@"should equal FF00FF", ^{
        User *user = [User nullMock];
        [user stub:@selector(type) andReturn:@"Organization"];
        UserCollectionViewCellModel *cellModel = [[UserCollectionViewCellModel alloc] initWithUser:user];
        [[[cellModel colorHex] should] equal:@"FF00FF"];
      });
    });

    context(@"the type is others", ^{
      it(@"should equal FFFFFF", ^{
        User *user = [User nullMock];
        [user stub:@selector(type) andReturn:@"xxx"];
        UserCollectionViewCellModel *cellModel = [[UserCollectionViewCellModel alloc] initWithUser:user];
        [[[cellModel colorHex] should] equal:@"FFFFFF"];
      });
    });
  });

});

SPEC_END
