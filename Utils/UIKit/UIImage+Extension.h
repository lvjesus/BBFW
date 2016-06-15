//
//  UIImage+Extension.h
//  FrameworkDemo
//
//  Created by Bright on 16/3/17.
//  Copyright © 2016年 yunlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  根据颜色生成图片
 *
 *  @param color  颜色
 *  @param size  尺寸
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
/**
 *  调整图片大小
 *
 *  @param img  image
 *  @param size 尺寸
 *
 *  @return UIImage
 */
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
/**
 *  高性能的给UIImageView加个圆角
 *
 *  @param cropRect <#cropRect description#>
 *
 *  @return <#return value description#>
 */
- (UIImage*)cropImageWithRect:(CGRect)cropRect;

@end
