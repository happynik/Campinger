//
//  MNAAdventureService.h
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNACoreDataService.h"

#import "MNAMember+CoreDataClass.h"
#import "MNAWish+CoreDataClass.h"

@protocol MNAAdventureServiceProtocol

@property (nonatomic, strong) MNAMember *me;

/*
 Возвращает список выбранных желаний для участника
 */
- (NSArray<MNAWish *> *) selectedWishesForMember: (MNAMember *)member;

/*
 Возвращает список доступных желаний для участника
 */
- (NSArray<MNAWish *> *) availableWishesForMember: (id)member;

@end

@interface MNAAdventureService : NSObject <MNAAdventureServiceProtocol>

- (instancetype) initWithCoreDataService: (MNACoreDataService *)coreDataService;

@end
