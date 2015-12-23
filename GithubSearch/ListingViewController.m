//
// Created by Jian Zhang on 12/23/15.
// Copyright (c) 2015 Jian Zhang. All rights reserved.
//

#import "ListingViewController.h"
#import "UserCollectionViewCell.h"
#import "UserCollectionViewCellModel.h"
#import "ListingViewModel.h"

@interface ListingViewController () <UICollectionViewDataSource>

@property (nonatomic, strong) ListingViewModel *viewModel;

@end

@implementation ListingViewController

- (void)configListingViewModel:(ListingViewModel *)viewModel
{
  _viewModel = viewModel;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return [[self.viewModel userCollectionViewCellModels] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  UserCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UserCollectionViewCell"
                                                                                  forIndexPath:indexPath];
  UserCollectionViewCellModel *model = [[self.viewModel userCollectionViewCellModels] objectAtIndex:indexPath.row];
  [cell configCellModel:model];
  return cell;
}

@end
