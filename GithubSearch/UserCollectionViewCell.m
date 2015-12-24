//
//  UserCollectionViewCell.m
//  GithubSearch
//
//  Created by Jian Zhang on 12/24/15.
//  Copyright © 2015 Jian Zhang. All rights reserved.
//

#import "UserCollectionViewCell.h"
#import "UserCollectionViewCellModel.h"
#import "UIColor+Additions.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface UserCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UIView *nicknameBackgroundView;

@end

@implementation UserCollectionViewCell

- (void)configCellModel:(UserCollectionViewCellModel *)cellModel
{
  [self.avatorImageView setImageWithURL:[NSURL URLWithString:[cellModel avatorURL]] placeholderImage:nil];
  self.nickLabel.text = [cellModel nickName];
  self.nicknameBackgroundView.backgroundColor = [UIColor add_colorWithRGBHexString:[cellModel colorHex]];
}

@end
