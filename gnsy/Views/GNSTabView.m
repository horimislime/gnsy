//
//  GNSTabView.m
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSTabView.h"

@interface GNSTabView ()

@end

@implementation GNSTabView

- (id)initWithFrame:(CGRect)frame category:(GNSCategory *)category {
    self = [super initWithFrame:frame];
    if (self) {
        //        self.tabTitleLabel=
    }
    return self;
}

- (id)init {
    if (self = [super init]) {
        if (self && !self.subviews.count) {
            GNSTabView *topView =
            [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                          owner:nil
                                        options:nil][0];
            [self addSubview:topView];
        }
    }
    return self;
}

- (void)setContent:(GNSCategory *)category {
    GNSTabView *tab = self.subviews[0];
    tab.tabTitleLabel.text = category.categoryTitle;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    GNSTabView *sub = self.subviews[0];
    sub.backgroundColor = backgroundColor;
}

- (void)setFrameSize:(CGRect)frame {
    GNSTabView *sub = self.subviews[0];
    self.frame = frame;
    sub.frame = frame;
}
@end
