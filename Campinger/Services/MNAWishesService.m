//
//  WishesManager.m
//  Campinger
//
//  Created by Nikita Moiseev on 01.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "MNAWishesService.h"

@interface MNAWishesService ()

@end

@implementation MNAWishesService

@synthesize AllWishes = _allWishes;

- (instancetype) init
{
    if (self = [super init])
    {
        _allWishes = @[@"surf", @"bitch", @"snowboard", @"bitch"];
    }
    return self;
}

@end
