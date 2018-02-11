//
//  MNAAdventure+CoreDataProperties.h
//  Campinger
//
//  Created by Nikita Moiseev on 11.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAAdventure+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MNAAdventure (CoreDataProperties)

+ (NSFetchRequest<MNAAdventure *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, retain) NSSet<MNAAdventureItem *> *adventureItems;
@property (nullable, nonatomic, retain) NSSet<MNAMember *> *members;

@end

@interface MNAAdventure (CoreDataGeneratedAccessors)

- (void)addAdventureItemsObject:(MNAAdventureItem *)value;
- (void)removeAdventureItemsObject:(MNAAdventureItem *)value;
- (void)addAdventureItems:(NSSet<MNAAdventureItem *> *)values;
- (void)removeAdventureItems:(NSSet<MNAAdventureItem *> *)values;

- (void)addMembersObject:(MNAMember *)value;
- (void)removeMembersObject:(MNAMember *)value;
- (void)addMembers:(NSSet<MNAMember *> *)values;
- (void)removeMembers:(NSSet<MNAMember *> *)values;

@end

NS_ASSUME_NONNULL_END
