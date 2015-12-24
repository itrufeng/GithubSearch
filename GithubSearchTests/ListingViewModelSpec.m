//
//  ListingViewModelSpec.m
//  GithubSearch
//
//  Created by Yanzi Li on 12/24/15.
//  Copyright 2015 Jian Zhang. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "ListingViewModel.h"
#import "User.h"
#import "UserCollectionViewCellModel.h"


SPEC_BEGIN(ListingViewModelSpec)

describe(@"ListingViewModel", ^{
  describe(@"userCollectionViewCellModels", ^{
    it(@"shoud have 3 cellModels", ^{
      NSArray<User *> *users = @[[User nullMock], [User nullMock], [User nullMock]];
      ListingViewModel *viewModel = [[ListingViewModel alloc] initWithUsers:users];
      NSArray<UserCollectionViewCellModel *> *cellModels = [viewModel userCollectionViewCellModels];
      [[theValue([cellModels count]) should] equal:theValue(3)];
    });
  });
});

SPEC_END
