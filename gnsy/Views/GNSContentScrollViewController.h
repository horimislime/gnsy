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

@interface GNSContentScrollViewController : UIViewController<
    GNSContentDelegate,
    UIScrollViewDelegate
>
@end
