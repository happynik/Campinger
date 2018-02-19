//
//  MNAAdventureItem+CoreDataClass.m
//  Campinger
//
//  Created by Nikita Moiseev on 13.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAAdventureItem+CoreDataClass.h"

@implementation MNAAdventureItem

@synthesize style = _style;
- (MNAAdventureItemStyle)style
{
    if (_style != 0)
    {
        return _style;
    }
    
    NSString *type = self.type;
    if ([type isEqualToString:@"flight"])
    {
        return MNAAdventureItemStyleFly;
    }
    if ([type isEqualToString:@"transfer"])
    {
        return MNAAdventureItemStyleTransfer;
    }
    if ([type isEqualToString:@"place"])
    {
        return MNAAdventureItemStylePlace;
    }
    return MNAAdventureItemStyleNone;
}

- (void) parseFromJson: (NSDictionary *)json
{
    self.title = json[@"title"];
    self.type = json[@"type"];
    
    NSDateFormatter *formater = [NSDateFormatter new];
    formater.dateFormat = @"yyyy-MM-dd'T'HH:mm";
    self.begin = [formater dateFromString:json[@"begin"]];
    self.end = [formater dateFromString:json[@"end"]];
}

@end
