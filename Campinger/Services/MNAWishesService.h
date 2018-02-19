//
//  MNAWishesService.h
//  Campinger
//
//  Created by Nikita Moiseev on 17.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MNACoreDataService.h"


@class MNAWish;
@class MNAMember;


@protocol MNAWishesServiceProtocol <MNASavingProtocol>

/*
 Создает новое желание в CoreData
 */
- (MNAWish *) createWish;

- (NSArray *) allWishes;

/*
 Возвращает список выбранных желаний для участника
 */
- (NSArray<MNAWish *> *) selectedWishesForMember: (MNAMember *)member;

/*
 Возвращает список доступных желаний для участника
 */
- (NSArray<MNAWish *> *) availableWishesForMember: (id)member;

@end


@interface MNAWishesService : NSObject <MNAWishesServiceProtocol>

- (instancetype)initWitchCoreDataService:(id<MNACoreDataServiceProtocol>)coredataService;

@end
