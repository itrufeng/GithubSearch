//
// Created by Jian Zhang on 12/23/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ListingViewModel;

@interface ListingViewController : UICollectionViewController

- (void)configListingViewModel:(ListingViewModel *)viewModel;

@end
