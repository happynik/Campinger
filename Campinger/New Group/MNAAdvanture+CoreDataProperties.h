//
//  MNAAdvanture+CoreDataProperties.h
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAAdvanture+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MNAAdvanture (CoreDataProperties)

+ (NSFetchRequest<MNAAdvanture *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dateFromMe;
@property (nullable, nonatomic, copy) NSDate *dateFromPartner;
@property (nullable, nonatomic, copy) NSDate *dateToMe;
@property (nullable, nonatomic, copy) NSDate *dateToPartner;
@property (nullable, nonatomic, copy) NSString *partnerName;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, retain) NSSet<MNAWish *> *wishes;
@property (nullable, nonatomic, retain) NSSet<MNAPlace *> *places;
@property (nullable, nonatomic, retain) NSSet<MNAAdventureItem *> *items;

@end

@interface MNAAdvanture (CoreDataGeneratedAccessors)

- (void)addWishesObject:(MNAWish *)value;
- (void)removeWishesObject:(MNAWish *)value;
- (void)addWishes:(NSSet<MNAWish *> *)values;
- (void)removeWishes:(NSSet<MNAWish *> *)values;

- (void)addPlacesObject:(MNAPlace *)value;
- (void)removePlacesObject:(MNAPlace *)value;
- (void)addPlaces:(NSSet<MNAPlace *> *)values;
- (void)removePlaces:(NSSet<MNAPlace *> *)values;

- (void)addItemsObject:(MNAAdventureItem *)value;
- (void)removeItemsObject:(MNAAdventureItem *)value;
- (void)addItems:(NSSet<MNAAdventureItem *> *)values;
- (void)removeItems:(NSSet<MNAAdventureItem *> *)values;

@end

NS_ASSUME_NONNULL_END
