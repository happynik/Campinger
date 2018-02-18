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

@synthesize style;

- (void) parseFromJson: (NSDictionary *)json
{
    self.title = json[@"title"];
    MNAAdventureItemStyle style;
    NSString *type = json[@"type"];
    if ([type isEqualToString:@"fly"])
    {
        style = MNAAdventureItemStyleFly;
    }
    else if ([type isEqualToString:@"transfer"])
    {
        style = MNAAdventureItemStyleTransfer;
    }
    else if ([type isEqualToString:@"place"])
    {
        style = MNAAdventureItemStylePlace;
    }
    else
    {
        style = MNAAdventureItemStyleNone;
    }
    self.style = style;
}

@end
