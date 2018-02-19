//
//  MNAAdventureItem+CoreDataClass.h
//  Campinger
//
//  Created by Nikita Moiseev on 13.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef NS_ENUM(NSInteger, MNAAdventureItemStyle){
    MNAAdventureItemStyleNone = 1,
    MNAAdventureItemStyleFly,
    MNAAdventureItemStyleTransfer,
    MNAAdventureItemStylePlace
};

NS_ASSUME_NONNULL_BEGIN

@interface MNAAdventureItem : NSManagedObject

@property (nonatomic, assign) MNAAdventureItemStyle style;

- (void)parseFromJson:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END

#import "MNAAdventureItem+CoreDataProperties.h"
