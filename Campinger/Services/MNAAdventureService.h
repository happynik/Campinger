//
//  MNAAdventureService.h
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MNAAdvantureFacade.h"
#import "MNAMember+CoreDataClass.h"
#import "MNAWish+CoreDataClass.h"


@class MNAAdventureItem;


@protocol MNAAdventureDataProtocol

/*
 Создает новое приключение в CoreData
 */
- (MNAAdventure *)createAdventure;

/*
 Возвращает все приключения из CoreData
 */
- (NSArray<MNAAdventure *> *)adventures;

@end


@protocol MNAAdventureServiceProtocol <MNASavingProtocol>

@property (nonatomic, strong) MNAMember *me;
@property (nonatomic, strong) NSArray<MNAAdventureItem *> *summary;
- (void)loadSummaryWithBlock:(void (^)(void))block;

@end


@interface MNAAdventureService : NSObject <MNAAdventureServiceProtocol>

- (instancetype)initWithAdventureFacade:(id<MNAAdventureFacadeProtocol>)adventureFacade;

@end
