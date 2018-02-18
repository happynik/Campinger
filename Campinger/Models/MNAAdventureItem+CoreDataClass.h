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
    MNAAdventureItemStyleNone,
    MNAAdventureItemStyleFly,
    MNAAdventureItemStyleTransfer,
    MNAAdventureItemStylePlace
};

NS_ASSUME_NONNULL_BEGIN

@interface MNAAdventureItem : NSManagedObject

- (void) parseFromJson: (NSDictionary *)json;

@property (nonatomic, assign) MNAAdventureItemStyle style;

@end

NS_ASSUME_NONNULL_END

#import "MNAAdventureItem+CoreDataProperties.h"
