//
//  SelfCell.h
//  QieHuan
//
//  Created by 东皇太二 on 15-4-24.
//  Copyright (c) 2015年 jiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelfCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pngImageView;
@property (weak, nonatomic) IBOutlet UILabel *courseName;
@property (weak, nonatomic) IBOutlet UILabel *teacherName;
@property (weak, nonatomic) IBOutlet UILabel *courseAttributes;
@end
