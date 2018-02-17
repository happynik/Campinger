//
//  MNAAdventureService.h
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNACoreDataService.h"
#import "MNAStorageService.h"

#import "MNAMember+CoreDataClass.h"
#import "MNAWish+CoreDataClass.h"

@class MNAAdventureItem;

@protocol MNAAdventureDataProtocol

/*
 Создает новое приключение в CoreData
 */
- (MNAAdventure *) createAdventure;

/*
 Возвращает все приключения из CoreData
 */
- (NSArray<MNAAdventure *> *) adventures;

@end

@protocol MNAAdventureServiceProtocol <MNAAdventureDataProtocol, MNASavableProtocol>

@property (nonatomic, strong) MNAMember *me;
@property (nonatomic, strong) NSArray *summary;

@end

@interface MNAAdventureService : NSObject <MNAAdventureServiceProtocol>

- (instancetype) initWithCoreDataService: (id<MNACoreDataServiceProtocol>) coreDataService
                          StorageService: (id<MNAStorageServiceProtocol>) storageService;

@end
