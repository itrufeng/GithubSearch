//
//  UserCollectionViewCell.h
//  GithubSearch
//
//  Created by Jian Zhang on 12/24/15.
//  Copyright © 2015 Jian Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserCollectionViewCellModel;

@interface UserCollectionViewCell : UICollectionViewCell

- (void)configCellModel:(UserCollectionViewCellModel *)cellModel;

@end
