//
//  MNACoreDataService.h
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MNAAdventure;
@class MNAMember;
@class MNAWish;

@interface MNACoreDataService : NSObject

/*
 Создает новое приключение в CoreData
 */
- (MNAAdventure *) createAdventure;
/*
 Возвращает все приключения из CoreData
 */
- (NSArray<MNAAdventure *> *) adventures;

/*
 Создает нового участника приключения в CoreData
 */
- (MNAMember *) createMember;

/*
 Создает новое желание в CoreData
 */
- (MNAWish *) createWish;

- (void)saveContext;

@end
