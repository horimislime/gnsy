//
//  GNSTableViewCell.m
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSTableViewCell.h"

@interface GNSTableViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *contentImageView;
@property (strong, nonatomic) IBOutlet UILabel *contentTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentMediaLabel;
@end

@implementation GNSTableViewCell

- (void)loadContent:(GNSNews *)content category:(GNSCategory *)category {
    
    self.contentTitleLabel.text = content.newsTitle;
    self.contentMediaLabel.text = category.categoryTitle;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:content.newsPicture]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.contentImageView.image = img;
        });
    });
}

@end
