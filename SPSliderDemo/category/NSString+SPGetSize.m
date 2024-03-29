//
//  NSString+SPGetSize.m
//  SuperPet
//
//  Created by JackZ on 15/3/20.
//  Copyright © 2015年 Supet. All rights reserved.
//

#import "NSString+SPGetSize.h"

@implementation NSString (SPGetSize)

- (CGSize)spSizeWithFont:(UIFont *)font
{
    CGSize resultSize = [self spSizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, font.lineHeight)];
    
    return resultSize;
}

- (CGSize)spSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    CGSize resultSize = [self spSizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    
    return resultSize;
}

- (CGSize)spSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    CGSize resultSize = [self spSizeWithFont:font maxSize:size lineBreakMode:lineBreakMode];
    
    return resultSize;
}

- (CGSize)spSizeWithFont:(UIFont *)font maxSize:(CGSize)size lineBreakMode:(NSLineBreakMode)mode
{
    CGSize realSize = CGSizeZero;
    CGRect textRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    realSize = textRect.size;
    realSize.width = ceilf(realSize.width);
    realSize.height = ceilf(realSize.height);
    return realSize;
}

@end
