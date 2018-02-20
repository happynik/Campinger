//
//  MNAPhotoModel.m
//  Campinger
//
//  Created by Nikita Moiseev on 20.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "MNAPhotoModel.h"

@implementation MNAPhotoModel

- (instancetype)initFromJson:(NSDictionary *)json
{
    if (self = [super init])
    {
        _id = json[@"id"];
        _owner = json[@"owner"];
        _secret = json[@"secret"];
        _server = json[@"server"];
        _farm = ((NSNumber *)json[@"farm"]).unsignedIntegerValue;
        _title = json[@"title"];
    }
    return self;
}

@end
