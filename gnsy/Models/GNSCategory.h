//
//  GNSCategory.h
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSContent.h"

@interface GNSCategory : GNSContent

- (id)initWithId:(NSString *)aCategoryId title:(NSString *)aCategoryTitle;

+ (void)fetchContentAsync:(BOOL)doAsync
                  success:(void(^)(NSArray *categories))success
                  failure:(void(^)(NSError *error))failure;

@property(strong, nonatomic)NSString *categoryId;
@property(strong, nonatomic)NSString *categoryTitle;
@end