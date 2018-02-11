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

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Campinger"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

#pragma mark - Create

- (MNAAdventure *) createAdventure
{
    return [self p_createManageObjectFromClass:@"Adventure"];
}

- (NSArray<MNAAdventure *> *) adventures
{
    NSFetchRequest *fetchRequest = [MNAAdventure fetchRequest];
    //fetchRequest.predicate = [NSPredicate predicateWithFormat:@""];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:NO];
    fetchRequest.sortDescriptors = @[sortDescriptor];
    
    NSError *error = nil;
    return [self.persistentContainer.viewContext executeFetchRequest:fetchRequest error:&error];
}

- (MNAMember *) createMember
{
    return [self p_createManageObjectFromClass:@"Member"];
}

- (MNAWish *) createWish
{
    return [self p_createManageObjectFromClass:@"Wish"];
}

- (id) p_createManageObjectFromClass: (NSString *) entityName
{
    return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.persistentContainer.viewContext];
}

@end
