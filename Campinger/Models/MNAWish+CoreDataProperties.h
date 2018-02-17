//
//  MNAWish+CoreDataProperties.h
//  Campinger
//
//  Created by Nikita Moiseev on 13.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//
//

#import "MNAWish+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MNAWish (CoreDataProperties)

+ (NSFetchRequest<MNAWish *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *imageUrl;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<MNAMember *> *members;

@end

@interface MNAWish (CoreDataGeneratedAccessors)

- (void)addMembersObject:(MNAMember *)value;
- (void)removeMembersObject:(MNAMember *)value;
- (void)addMembers:(NSSet<MNAMember *> *)values;
- (void)removeMembers:(NSSet<MNAMember *> *)values;

@end

NS_ASSUME_NONNULL_END
