//
//  MNAAdventureService.m
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//


#import "MNAAdventureService.h"
#import "MNAAdventure+CoreDataProperties.h"
#import "MNAAdventureItem+CoreDataClass.h"


@interface MNAAdventureService ()

@property (nonatomic, strong) id<MNAAdventureFacadeProtocol> adventureFacade;
@property (nonatomic, strong) MNAAdventure *adventure;

@end


@implementation MNAAdventureService

- (instancetype)initWithAdventureFacade:(id<MNAAdventureFacadeProtocol>)adventureFacade;
{
    if (self = [super init])
    {
        _adventureFacade = adventureFacade;
    }
    return self;
}

#pragma mark - MNASavedableProtocol

- (void)save
{
    [self.adventureFacade save];
}

#pragma mark - MNAAdventureServiceProtocol

@synthesize me = _me;
- (MNAMember *)me
{
    if (!_me)
    {
        NSArray *members = [self.adventureFacade membersForAdventure:self.adventure];
        _me = members[0];
    }
    return _me;
}

@synthesize summary;

- (void)loadSummaryWithBlock:(void (^)(void))block
{
    NSArray *items = [self.adventureFacade itemsForAdventure:self.adventure];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"priority" ascending:NO];
    NSArray *orderedArray = [items sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
    self.summary = orderedArray;
    if (block)
    {
        block();
    }
}

- (MNAAdventure *)adventure
{
    if (!_adventure)
    {
        _adventure = [self.adventureFacade adventureForName:@"первое путешествие"];
    }
    return _adventure;
}

@end
