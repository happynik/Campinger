//
//  UIImageView.m
//  Campinger
//
//  Created by Nikita Moiseev on 06.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "UIImage+MNAImageExtensions.h"

@implementation UIImage (MNAImageExtensions)

+ (instancetype) mna_imageNamed:(NSString *)named scaledToSize:(CGSize)newSize
{
    UIImage *image = [UIImage imageNamed:named];
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
