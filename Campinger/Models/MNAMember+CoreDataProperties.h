//
//  MNAMember+CoreDataProperties.h
//  Campinger
//
//  Created by Nikita Moiseev on 13.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAMember+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MNAMember (CoreDataProperties)

+ (NSFetchRequest<MNAMember *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dateFrom;
@property (nullable, nonatomic, copy) NSDate *dateTo;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<MNAPlace *> *places;
@property (nullable, nonatomic, retain) NSSet<MNAWish *> *wishes;

@end

@interface MNAMember (CoreDataGeneratedAccessors)

- (void)addPlacesObject:(MNAPlace *)value;
- (void)removePlacesObject:(MNAPlace *)value;
- (void)addPlaces:(NSSet<MNAPlace *> *)values;
- (void)removePlaces:(NSSet<MNAPlace *> *)values;

- (void)addWishesObject:(MNAWish *)value;
- (void)removeWishesObject:(MNAWish *)value;
- (void)addWishes:(NSSet<MNAWish *> *)values;
- (void)removeWishes:(NSSet<MNAWish *> *)values;

@end

NS_ASSUME_NONNULL_END
