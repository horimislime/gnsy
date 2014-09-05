//
//  GNSTableViewCell.h
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GNSNews.h"
#import "GNSCategory.h"

@interface GNSTableViewCell : UITableViewCell
- (void)loadContent:(GNSNews *)content category:(GNSCategory *)category;
@end
