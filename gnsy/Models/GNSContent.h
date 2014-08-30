//
//  GNSContent.h
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GNSContentDelegate <NSObject>
- (void)contentDidFinishLoad:(NSArray *)contents;
- (void)contentDidFailLoad;
@end

@interface GNSContent : NSObject
- (void)load;
@end
