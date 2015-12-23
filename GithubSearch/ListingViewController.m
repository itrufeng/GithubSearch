//
// Created by Jian Zhang on 12/23/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import "ListingViewController.h"
#import "UserCollectionViewCell.h"
#import "UserCollectionViewCellModel.h"

@interface ListingViewController () <UICollectionViewDataSource>

@end

@implementation ListingViewController

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  UserCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UserCollectionViewCell"
                                                                                  forIndexPath:indexPath];
  User *user = [[User alloc] initWithDict:@{@"avatar_url": @"https://avatars.githubusercontent.com/u/1?v=3", @"login": @"mojombo"}];
  UserCollectionViewCellModel *model = [[UserCollectionViewCellModel alloc] initWithUser:user];
  [cell configCellModel:model];
  return cell;
}


@end
