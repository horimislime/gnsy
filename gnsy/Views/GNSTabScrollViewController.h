//
//  GNSTabScrollViewController.h
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GNSTabView.h"

@protocol GNSTabDelegate <NSObject>
- (void)tabSelectionChanged:(NSInteger)index;
@end
@interface GNSTabScrollViewController : UIViewController<UIScrollViewDelegate>
@property id<GNSTabDelegate> delegate;

- (instancetype)initController;
- (void)initTabForContents:(NSArray *)contents;
- (void)selectTabAtIndex:(NSInteger)index;
@end
