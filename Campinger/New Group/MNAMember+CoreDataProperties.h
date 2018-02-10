//
//  MNAMember+CoreDataProperties.h
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAMember+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MNAMember (CoreDataProperties)

+ (NSFetchRequest<MNAMember *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSDate *dateFrom;
@property (nullable, nonatomic, copy) NSDate *dateTo;
@property (nullable, nonatomic, retain) NSSet<MNAWish *> *wishes;
@property (nullable, nonatomic, retain) MNAPlace *places;

@end

@interface MNAMember (CoreDataGeneratedAccessors)

- (void)addWishesObject:(MNAWish *)value;
- (void)removeWishesObject:(MNAWish *)value;
- (void)addWishes:(NSSet<MNAWish *> *)values;
- (void)removeWishes:(NSSet<MNAWish *> *)values;

@end

NS_ASSUME_NONNULL_END
