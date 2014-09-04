//
//  GNSViewController.h
//  gnsy
//
//  Created by horimislime on 2014/08/29.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GNSContent.h"
#import "GNSTabScrollViewController.h"
#import "GNSContentScrollViewController.h"
#import "GNSContentViewController.h"

@interface GNSViewController : UIViewController<
    GNSContentDelegate,
    GNSTabDelegate,
    GNSContentScrollViewDelegate
>

@end
