//
//  GNSContentScrollViewController.h
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GNSContent.h"
#import "GNSContentViewController.h"

@protocol GNSContentScrollViewDelegate <NSObject>
- (void)contentViewChanged:(NSInteger)index;
@end

@interface GNSContentScrollViewController : UIViewController<
    UIScrollViewDelegate
>

@property id<GNSContentScrollViewDelegate> delegate;

- (instancetype)initController;
- (void)setCategories:(NSArray *)categories;
- (void)selectPageAtIndex:(NSInteger)index;
@end
