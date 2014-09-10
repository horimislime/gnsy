//
//  GNSTableViewCell.m
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface GNSTableViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *contentImageView;
@property (strong, nonatomic) IBOutlet UILabel *contentTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentMediaLabel;
@end

@implementation GNSTableViewCell

- (void)loadContent:(GNSNews *)content category:(GNSCategory *)category {
    
    self.contentTitleLabel.text = content.newsTitle;
    self.contentMediaLabel.text = category.categoryTitle;
    
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:content.newsPicture]
                             placeholderImage:nil
                                      options:SDWebImageCacheMemoryOnly | SDWebImageRetryFailed
                                    completed:nil];
}

@end
