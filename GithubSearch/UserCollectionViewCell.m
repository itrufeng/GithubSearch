//
//  UserCollectionViewCell.m
//  GithubSearch
//
//  Created by Jian Zhang on 12/24/15.
//  Copyright © 2015 Jian Zhang. All rights reserved.
//

#import "UserCollectionViewCell.h"
#import "UserCollectionViewCellModel.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface UserCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;

@end

@implementation UserCollectionViewCell

- (void)configCellModel:(UserCollectionViewCellModel *)cellModel
{
  [self.avatorImageView setImageWithURL:[NSURL URLWithString:[cellModel avatorURL]] placeholderImage:nil];
  self.nickLabel.text = [cellModel nickName];
}

@end
