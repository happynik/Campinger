//
//  NSString+MNAStringExtensions.h
//  Campinger
//
//  Created by Nikita Moiseev on 20.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MNAStringExtensions)

+ (instancetype)mna_persentStringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

@end
