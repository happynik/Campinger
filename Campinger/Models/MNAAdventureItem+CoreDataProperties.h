//
//  MNAAdventureItem+CoreDataProperties.h
//  Campinger
//
//  Created by Nikita Moiseev on 13.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAAdventureItem+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MNAAdventureItem (CoreDataProperties)

+ (NSFetchRequest<MNAAdventureItem *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *begin;
@property (nullable, nonatomic, copy) NSString *details;
@property (nullable, nonatomic, copy) NSDate *end;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *type;

@end

NS_ASSUME_NONNULL_END
