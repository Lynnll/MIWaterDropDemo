//
//  MIFactory.h
//  MIWaterDropDemo
//
//  Created by lynnjinglei on 15/10/28.
//  Copyright © 2015年 XiaoLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface MIFactory : NSObject

//按色值取颜色
+(UIColor*)colorWithHexString:(NSString *)stringToConvert;

@end
