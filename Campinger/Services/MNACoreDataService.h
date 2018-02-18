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

@protocol MNAMemberDataProtocol

/*
 Создает нового участника приключения в CoreData
 */
- (MNAMember *) createMember;

@end

@protocol MNASavingProtocol

- (void) save;

@end

@protocol MNACoreDataServiceProtocol <MNASavingProtocol>

- (NSManagedObjectContext *) context;

- (id) createManageObjectForEntityName: (NSString *) entityName;

@end

@interface MNACoreDataService : NSObject <MNACoreDataServiceProtocol>

@end
