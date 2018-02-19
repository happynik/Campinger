//
//  AdvantureFacade.h
//  Campinger
//
//  Created by Nikita Moiseev on 18.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MNACoreDataService.h"
#import "MNAStorageService.h"


@class MNAAdventureItem;
@class MNAAdventure;


@protocol MNAAdventureFacadeProtocol <MNASavingProtocol>

- (MNAAdventure *)adventureForName:(NSString *)name;
- (NSArray<MNAMember *> *)membersForAdventure:(MNAAdventure *)adventure;
- (NSArray<MNAAdventureItem *> *)itemsForAdventure:(MNAAdventure *)adventure;

@end


@interface MNAAdvantureFacade : NSObject <MNAAdventureFacadeProtocol>

- (instancetype)initWithCoreDataService:(id<MNACoreDataServiceProtocol>)coreDataService StorageService:(id<MNAStorageServiceProtocol>)storageService;

@end
