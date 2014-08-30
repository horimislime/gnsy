//
//  GNSContentViewController.h
//  gnsy
//
//  Created by horimislime on 2014/08/29.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GNSCategory.h"

@interface GNSContentViewController : UIViewController<GNSContentDelegate>
- (id)initWithContentInfo:(GNSCategory *)info lazy:(BOOL)lazy;
@end
