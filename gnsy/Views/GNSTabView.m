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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        if (self) {
            if (!self.subviews.count) {
                GNSTabView *topView =
                [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                              owner:nil
                                            options:nil][0];
                [self addSubview:topView];
            }
        }
    }
  return self;
}

@end
