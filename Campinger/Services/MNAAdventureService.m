//
//  MNAAdventureService.m
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "MNAAdventureService.h"
#import "MNAAdventure+CoreDataProperties.h"

@interface MNAAdventureService ()

@property (nonatomic, strong) MNACoreDataService *coreDataService;

@property (nonatomic, strong) MNAAdventure *adventure;

@end

@implementation MNAAdventureService

- (instancetype) initWithCoreDataService: (MNACoreDataService *)coreDataService
{
    if (self = [super init])
    {
        _coreDataService = coreDataService;
    }
    return self;
}

@synthesize me = _me;
- (MNAMember *)me
{
    if (!_me)
    {
        NSSet<MNAMember *> *members = self.adventure.members;
        if (members.count != 0)
        {
            NSPredicate *p = [NSPredicate predicateWithFormat:@"name == %@", @"me"];
            NSArray *result = [[members filteredSetUsingPredicate:p] allObjects];
            _me = result[0];
        }
        else
        {
            _me = [self.coreDataService createMember];
            _me.name = @"me";
            [self.adventure addMembersObject:_me];
        }
    }
    return _me;
}

- (MNAAdventure *) adventure
{
    if (_adventure)
    {
        return _adventure;
    }
    
    NSArray<MNAAdventure *> *adventures = [self.coreDataService adventures];
    if (adventures.count != 0)
    {
        _adventure = adventures[0];
        return _adventure;
    }
    
    MNAAdventure *newAdventure = [self.coreDataService createAdventure];
    newAdventure.title = @"первое путешествие";
    _adventure = newAdventure;
    return _adventure;
}

- (NSArray<MNAWish *> *) selectedWishesForMember: (MNAMember *)member
{
    return nil;
}

- (NSArray<MNAWish *> *) availableWishesForMember: (MNAMember *)member
{
    return nil;
}

@end
