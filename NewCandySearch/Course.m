//
//  Candy.m
//  CandySearch
//
//  Created by 东皇太二 on 15-5-22.
//  Copyright (c) 2015年 jiao. All rights reserved.
//

#import "Course.h"

@implementation Course
@synthesize courseName;
@synthesize teachers;
@synthesize courseAttribute;
@synthesize tablepng;
@synthesize information;
+ (id)courseOfAttribute:(NSString *)attribute name:(NSString *)name teacher:(NSString *)teacher tablepng:(NSString *)tablepng
{
    Course *newCourse = [[Course alloc] init];
    newCourse.courseName = name;
    newCourse.courseAttribute = attribute;
    newCourse.teachers=teacher;
    newCourse.tablepng=tablepng;
    return newCourse;
}
@end
