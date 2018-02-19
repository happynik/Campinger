//
//  MNACoreDataService.m
//  Campinger
//
//  Created by Nikita Moiseev on 10.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "MNACoreDataService.h"
#import "MNAAdventure+CoreDataClass.h"
#import "MNAMember+CoreDataClass.h"
#import "MNAWish+CoreDataClass.h"


@interface MNACoreDataService ()

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@end


@implementation MNACoreDataService

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;
- (NSPersistentContainer *)persistentContainer
{
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Campinger"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

- (NSManagedObjectContext *)context
{
    return self.persistentContainer.viewContext;
}

#pragma mark - Core Data Saving support

- (void)save
{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    BOOL hasChanges = [context hasChanges];
    if (!hasChanges)
    {
        return;
    }
    
    BOOL saveSuccess = [context save:&error];
    if (!saveSuccess) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

- (id)createManageObjectForEntityName:(NSString *)entityName
{
    return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.context];
}

@end
