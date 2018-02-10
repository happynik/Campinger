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

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, retain) NSSet<MNAAdventureItem *> *items;
@property (nullable, nonatomic, retain) NSSet<MNAMember *> *members;

@end

@interface MNAAdvanture (CoreDataGeneratedAccessors)

- (void)addItemsObject:(MNAAdventureItem *)value;
- (void)removeItemsObject:(MNAAdventureItem *)value;
- (void)addItems:(NSSet<MNAAdventureItem *> *)values;
- (void)removeItems:(NSSet<MNAAdventureItem *> *)values;

- (void)addMembersObject:(MNAMember *)value;
- (void)removeMembersObject:(MNAMember *)value;
- (void)addMembers:(NSSet<MNAMember *> *)values;
- (void)removeMembers:(NSSet<MNAMember *> *)values;

@end

NS_ASSUME_NONNULL_END
