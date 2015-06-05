//
//  Candy.h
//  CandySearch
//
//  Created by 东皇太二 on 15-5-22.
//  Copyright (c) 2015年 jiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject
@property (nonatomic,strong)NSString *courseName;
@property (nonatomic,strong)NSString *teachers;
@property (nonatomic,strong)NSString *courseAttribute;
@property (nonatomic,strong)NSString *information;
@property (nonatomic,strong)NSString *tablepng;
+ (id)courseOfAttribute:(NSString *)attribute name:(NSString *)name teacher:(NSString  *)teacher tablepng:(NSString *)tablepng;
@end
