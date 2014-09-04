//
//  UIScrollView+TouchEvent.m
//  gnsy
//
//  Created by horimislime on 2014/09/04.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "UIScrollView+TouchEvent.h"

@implementation UIScrollView(TouchEvent)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesBegan:touches withEvent:event];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(!self.dragging) {
        [[self nextResponder] touchesEnded:touches withEvent:event];
    }
    [super touchesEnded:touches withEvent:event];
}
@end
