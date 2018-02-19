//
//  AdvantureFacade.m
//  Campinger
//
//  Created by Nikita Moiseev on 18.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//


#import "MNAAdvantureFacade.h"
#import "MNACoreDataService.h"
#import "MNAStorageService.h"
#import "MNAAdventure+CoreDataProperties.h"
#import "MNAAdventureItem+CoreDataClass.h"
#import "MNAMember+CoreDataProperties.h"


@interface MNAAdvantureFacade ()

@property (nonatomic, strong) id<MNACoreDataServiceProtocol> coreDataService;
@property (nonatomic, strong) id<MNAStorageServiceProtocol> storageService;

@end


@implementation MNAAdvantureFacade

- (instancetype)initWithCoreDataService:(id<MNACoreDataServiceProtocol>)coreDataService StorageService:(id<MNAStorageServiceProtocol>)storageService;
{
    if (self = [super init])
    {
        _coreDataService = coreDataService;
        _storageService = storageService;
    }
    return self;
}

- (MNAAdventure *)adventureForName:(NSString *)name
{
    NSFetchRequest *fetchRequest = [MNAAdventure fetchRequest];
    fetchRequest.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"title" ascending:NO]];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"title == %@", name];
    
    NSError *error = nil;
    NSArray<MNAAdventure *> *adventures = [self.coreDataService.context executeFetchRequest:fetchRequest error:&error];
    if (adventures.count > 0)
    {
        return adventures.firstObject;
    }
    
    MNAAdventure *newAdventure = [self createAdventure];
    newAdventure.title = name;
    return newAdventure;
}

- (NSArray<MNAMember *> *)membersForAdventure:(MNAAdventure *)adventure
{
    NSSet<MNAMember *> *members = adventure.members;
    if (members.count == 0)
    {
        MNAMember *me = [self createMember];
        me.name = @"me";
        [adventure addMembersObject:me];
        [self save];
    }
    return adventure.members.allObjects;
}

- (NSArray<MNAAdventureItem *> *)itemsForAdventure:(MNAAdventure *)adventure;
{
    NSSet<MNAAdventureItem *> *items = adventure.adventureItems;
    if (items.count != 0)
    {
        return items.allObjects;
    }
    
    // тут может быть вытаскиваение из сети
    NSDictionary *json = [self.storageService jsonFromFileName:adventure.title];
    
    // кладу в CoreData
    NSArray *jsonItems = json[@"items"];
    NSMutableArray *newItems = [NSMutableArray new];
    [jsonItems enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
        MNAAdventureItem *newItem = [self.coreDataService createManageObjectForEntityName:@"AdventureItem"];
        [newItem parseFromJson:obj];
        newItem.priority = (int)(jsonItems.count - idx);
        [newItems addObject:newItem];
    }];
    [adventure addAdventureItems:[[NSSet alloc] initWithArray:newItems]];
    [self.coreDataService save];
    return adventure.adventureItems.allObjects;
}

- (void)save
{
    [self.coreDataService save];
}

- (MNAAdventure *)createAdventure
{
    MNAAdventure *newAdventure = [self.coreDataService createManageObjectForEntityName:@"Adventure"];
    [self save];
    return newAdventure;
}

- (MNAMember *)createMember
{
    MNAMember *newMember = [self.coreDataService createManageObjectForEntityName:@"Member"];
    [self save];
    return newMember;
}

@end
