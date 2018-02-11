//
//  MNACoreDataService.h
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface MNACoreDataService : NSObject

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end
