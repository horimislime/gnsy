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

@implementation GNSTabView

- (id)initWithFrame:(CGRect)frame category:(GNSCategory *)category {
    self = [super initWithFrame:frame];
    if (self) {
        //        self.tabTitleLabel=
    }
    return self;
}

- (instancetype)initWithCategory:(GNSCategory *)category
                        tabColor:(UIColor *)color
                           frame:(CGRect)frame {
    
    if((self=[GNSTabView new])) {
        self.frame = frame;
        self.tabTitleLabel.text=category.categoryTitle;
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
    if(selected) {
        self.tabBackgroundView.backgroundColor = self.tabColor;
        self.tabTitleLabel.textColor = [UIColor whiteColor];
    }
    else {
        self.tabBackgroundView.backgroundColor = [UIColor whiteColor];
        self.tabTitleLabel.textColor = self.tabColor;
    }
}

- (void)setContent:(GNSCategory *)category {
    self.tabTitleLabel.text = category.categoryTitle;
}

//- (void)setBackgroundColor:(UIColor *)backgroundColor {
//    GNSTabView *sub = self.subviews[0];
//    sub.backgroundColor = backgroundColor;
//    self.backgroundColor
//}

- (void)setFrameSize:(CGRect)frame {
//    GNSTabView *sub = self.subviews[0];
    self.frame = frame;
//    sub.frame = frame;
}
@end
