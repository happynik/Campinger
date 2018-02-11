//
//  MNAAdventureService.h
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "MNAMember+CoreDataClass.h"

@protocol MNAAdventureServiceProtocol

/*
 Возвращает список выбранных желаний для участника
 */
//- (NSArray *) selectedWishesForMember: (MNAMember *)member;
- (NSArray *) selectedWishesForMember: (id)member;

/*
 Возвращает список доступных желаний для участника
 */
- (NSArray *) availableWishesForMember: (id)member;

@end

@interface MNAAdventureService : NSObject <MNAAdventureServiceProtocol>

@end
