//
//  GNSTabView.m
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSTabView.h"

@interface GNSTabView ()

@property (strong, nonatomic) IBOutlet UIView *tabBackgroundView;

@end

@implementation GNSTabView {
    CGRect _defaultFrame;
    CGRect _tabFrameWhenInactive;
    CGRect _tabFrameWhenActive;
}

- (instancetype)initWithCategory:(GNSCategory *)category
                        tabColor:(UIColor *)color
                           frame:(CGRect)frame {
    
    if((self = [GNSTabView new])) {
        self.frame = frame;
        _tabFrameWhenInactive = CGRectMake(0,
                                           frame.origin.y + frame.size.height,
                                           CGRectGetWidth(frame),
                                           CGRectGetHeight(frame));
        
        _tabFrameWhenActive = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        
        self.tabBackgroundView.frame = _tabFrameWhenInactive;
        self.tabTitleLabel.text = category.categoryTitle;
        self.tabColor = color;
        [self setTabSelected:NO];
    }
    return self;
}

- (instancetype)init {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                         owner:nil
                                       options:nil][0];
}

- (void)setTabSelected:(BOOL)selected {
    if (selected) {
        self.tabBackgroundView.backgroundColor = self.tabColor;
        self.tabTitleLabel.textColor = [UIColor whiteColor];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.tabBackgroundView.frame = _tabFrameWhenActive;
        }];
    } else {
        self.tabBackgroundView.backgroundColor = [UIColor whiteColor];
        self.tabTitleLabel.textColor = self.tabColor;
        
        [UIView animateWithDuration:0.3 animations:^{
            self.tabBackgroundView.frame = _tabFrameWhenInactive;
        }];
    }
}

@end
