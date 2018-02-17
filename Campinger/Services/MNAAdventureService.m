//
//  MNAAdventureService.m
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "MNAAdventureService.h"
#import "MNAAdventure+CoreDataProperties.h"
#import "MNAAdventure+CoreDataProperties.h"

@interface MNAAdventureService ()

@property (nonatomic, strong) id<MNACoreDataServiceProtocol> coreDataService;
@property (nonatomic, strong) id<MNAStorageServiceProtocol> storageService;

@property (nonatomic, strong) MNAAdventure *adventure;

@end

@implementation MNAAdventureService

- (instancetype) initWithCoreDataService: (id<MNACoreDataServiceProtocol>)coreDataService
                          StorageService: (id<MNAStorageServiceProtocol>) storageService
{
    if (self = [super init])
    {
        _coreDataService = coreDataService;
        _storageService = storageService;
    }
    return self;
}

#pragma mark - MNAAdventureDataProtocol

- (MNAAdventure *) createAdventure
{
    MNAAdventure *newAdventure = [self.coreDataService createManageObjectForEntityName:@"Adventure"];
    [self save];
    return newAdventure;
}

- (NSArray<MNAAdventure *> *) adventures
{
    NSFetchRequest *fetchRequest = [MNAAdventure fetchRequest];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:NO];
    fetchRequest.sortDescriptors = @[sortDescriptor];
    
    NSError *error = nil;
    return [self.coreDataService.context executeFetchRequest:fetchRequest error:&error];
}

#pragma mark - MNASavedableProtocol

- (void) save
{
    [self.coreDataService save];
}

#pragma mark - MNAAdventureServiceProtocol

@synthesize me = _me;
- (MNAMember *)me
{
    if (!_me)
    {
        NSSet<MNAMember *> *members = self.adventure.members;
        if (members.count != 0)
        {
            NSPredicate *p = [NSPredicate predicateWithFormat:@"name == %@", @"me"];
            NSSet *result = [members filteredSetUsingPredicate:p];
            _me = [result anyObject];
        }
        else
        {
            _me = [self createMember];
            _me.name = @"me";
            [self.adventure addMembersObject:_me];
        }
    }
    return _me;
}

@synthesize summary = _summary;
- (NSArray *) summary
{
    if (!_summary)
    {
        NSDictionary *json = [self.storageService jsonFromFileName:@"adventureItems"];
        _summary = json[@"items"];
    }
    return _summary;
}

- (MNAAdventure *) adventure
{
    if (_adventure)
    {
        return _adventure;
    }
    
    NSArray<MNAAdventure *> *adventures = [self adventures];
    if (adventures.count != 0)
    {
        _adventure = adventures[0];
        return _adventure;
    }
    
    MNAAdventure *newAdventure = [self createAdventure];
    newAdventure.title = @"первое путешествие";
    _adventure = newAdventure;
    return _adventure;
}

- (MNAMember *) createMember
{
    MNAMember *newMember = [self.coreDataService createManageObjectForEntityName:@"Member"];
    [self save];
    return newMember;
}

@end
