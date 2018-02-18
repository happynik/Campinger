//
//  MNAWishesService.m
//  Campinger
//
//  Created by Nikita Moiseev on 17.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "MNAWishesService.h"
#import "MNAWish+CoreDataProperties.h"
#import "MNAMember+CoreDataProperties.h"

@interface MNAWishesService ()

@property (nonatomic, strong) id<MNACoreDataServiceProtocol> coreDataService;

@end

@implementation MNAWishesService

- (instancetype) initWitchCoreDataService: (id<MNACoreDataServiceProtocol>)coredataService
{
    if (self = [super init])
    {
        _coreDataService = coredataService;
    }
    return self;
}

#pragma mark - MNAWishesServiceProtocol

- (MNAWish *) createWish
{
    MNAWish *newWith = [self.coreDataService createManageObjectForEntityName:@"Wish"];
    [self.coreDataService save];
    return newWith;
}

- (NSArray *) allWishes
{
    NSFetchRequest *fetchRequest = [MNAWish fetchRequest];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    fetchRequest.sortDescriptors = @[sortDescriptor];
    
    NSError *error = nil;
    NSArray *fetchResult = [self.coreDataService.context executeFetchRequest:fetchRequest error:&error];
    if (fetchResult.count != 0){
        return fetchResult;
    }
    
    return [self p_createDefaultWishes];
}

- (NSArray<MNAWish *> *) selectedWishesForMember: (MNAMember *)member
{
    return [member.wishes allObjects];
}

- (NSArray<MNAWish *> *) availableWishesForMember: (MNAMember *)member
{
    return [self allWishes];
}

- (NSArray<MNAWish *> *)p_createDefaultWishes
{
    MNAWish *surf = [self createWish];
    surf.name = @"surf";
    
    MNAWish *snownboard = [self createWish];
    snownboard.name = @"snownboard";
    
    [self.coreDataService save];
    return @[surf, snownboard];
}

#pragma mark - MNASavingProtocol

- (void) save
{
    [self.coreDataService save];
}

@end
