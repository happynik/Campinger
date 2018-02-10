//
//  UIImageView.h
//  Campinger
//
//  Created by Nikita Moiseev on 06.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (MNAImageExtensions)

+ (instancetype) mna_imageNamed:(NSString *)named scaledToSize:(CGSize)newSize;

@end
