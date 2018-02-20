//
//  MNAAdventureFacadeTests.m
//  CampingerTests
//
//  Created by Nikita Moiseev on 20.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock.h>
#import "MNAAdvantureFacade.h"
#include "MNACoreDataService.h"
#include "MNAStorageService.h"

@interface MNAAdventureFacadeTests : XCTestCase

@property (nonatomic, strong) id<MNACoreDataServiceProtocol> coredata;
@property (nonatomic, strong) id<MNAStorageServiceProtocol> storage;
@property (nonatomic, strong) MNAAdvantureFacade *facade;

@end

@implementation MNAAdventureFacadeTests

- (void)setUp {
    [super setUp];
    
//    self.coredata = OCMProtocolMock(@protocol(MNACoreDataServiceProtocol));
//    self.storage = OCMProtocolMock(@protocol(MNAStorageServiceProtocol));
//    self.facade = OCMPartialMock([[MNAAdvantureFacade alloc] initWithCoreDataService:self.coredata StorageService:self.storage]);
}

- (void)tearDown {
    self.facade = nil;
    self.coredata = nil;
    self.storage = nil;
    
    [super tearDown];
}

//- (MNAAdventure *)adventureForName:(NSString *)name
//{
//    NSFetchRequest *fetchRequest = [MNAAdventure fetchRequest];
//    fetchRequest.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"title" ascending:NO]];
//    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"title == %@", name];
//
//    NSError *error = nil;
//    NSArray<MNAAdventure *> *adventures = [self.coreDataService.context executeFetchRequest:fetchRequest error:&error];
//    if (adventures.count > 0)
//    {
//        return adventures.firstObject;
//    }
//
//    MNAAdventure *newAdventure = [self createAdventure];
//    newAdventure.title = name;
//    return newAdventure;
//}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
