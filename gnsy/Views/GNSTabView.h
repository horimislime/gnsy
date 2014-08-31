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
@property (strong, nonatomic) IBOutlet UIView *tabColorAreaView;
@property (strong, nonatomic) IBOutlet UILabel *tabTitleLabel;
- (void)setContent:(GNSCategory *)category;
@end
