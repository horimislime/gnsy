//
//  GNSTabView.h
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GNSCategory.h"

@interface GNSTabView : UIView
@property (strong, nonatomic) IBOutlet UILabel *tabTitleLabel;
@property UIColor *tabColor;

- (instancetype)initWithCategory:(GNSCategory *)category tabColor:(UIColor *)color frame:(CGRect)frame;
- (void)setTabSelected:(BOOL)selected;
@end
