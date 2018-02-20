//
//  NSString+MNAStringExtensions.m
//  Campinger
//
//  Created by Nikita Moiseev on 20.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "NSString+MNAStringExtensions.h"

@implementation NSString (MNAStringExtensions)

+ (instancetype)mna_persentStringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2)
{
    va_list args;
    va_start(args, format);
    NSString *result = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    NSCharacterSet *allowedCharacters = [NSCharacterSet URLFragmentAllowedCharacterSet];
    return [result stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
}

@end
