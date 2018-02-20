//
//  MNAAdventureServiceTests.m
//  CampingerTests
//
//  Created by Nikita Moiseev on 20.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock.h>
#import <Expecta.h>
#import "AppDelegate.h"
#import "MNAAdvantureFacade.h"
#import "MNAAdventureService.h"
#import "MNAAdventureItem+CoreDataClass.h"

@interface MNAAdventureServiceTests : XCTestCase

@property (nonatomic, strong) id<MNAAdventureFacadeProtocol> facade;
@property (nonatomic, strong) MNAAdventureService *service;

@end

@implementation MNAAdventureServiceTests

- (void)setUp {
    [super setUp];
    self.facade = OCMProtocolMock(@protocol(MNAAdventureFacadeProtocol));
    self.service = OCMPartialMock([[MNAAdventureService alloc] initWithAdventureFacade:self.facade]);
}

- (void)tearDown {
    self.service = nil;
    self.facade = nil;
    
    [super tearDown];
}

- (void)testLoadSummaryWithBlocItemsNil
{
    // arrange
    OCMStub([self.facade itemsForAdventure:[OCMArg any]]).andReturn(nil);
    
    // act
    [self.service loadSummaryWithBlock:nil];
    
    // assert
    expect(self.service.summary).to.beNil();
}

- (void)testLoadSummaryWithBlocItemsNoEmpty
{
    // arrange
    NSArray *expectedItems = @[OCMClassMock([MNAAdventureItem class]), OCMClassMock([MNAAdventureItem class])];
    OCMStub([self.facade itemsForAdventure:[OCMArg any]]).andReturn(expectedItems);
    
    // act
    [self.service loadSummaryWithBlock:nil];
    
    // assert
    expect(self.service.summary).to.equal(expectedItems);
}

- (void)testLoadSummaryWithBlocBlockNotNil
{
    [self.service loadSummaryWithBlock:^{
        expect(true);
    }];
    
    //OCMVerify(self.service);
}

//- (void)loadSummaryWithBlock:(void (^)(void))block
//{
//    NSArray *items = [self.adventureFacade itemsForAdventure:self.adventure];
//    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"priority" ascending:NO];
//    NSArray *orderedArray = [items sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
//    self.summary = orderedArray;
//    if (block)
//    {
//        block();
//    }
//}

@end
