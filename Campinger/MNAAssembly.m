//
//  MNAAssembly.m
//  Campinger
//
//  Created by Nikita Moiseev on 01.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "MNAAssembly.h"
#import "MNAAdventureService.h"
#import "MNAWishListViewController.h"

@interface MNAAssembly ()

@property (nonatomic, strong) id<MNAAdventureServiceProtocol> adventureService;

@end

@implementation MNAAssembly

- (instancetype) init
{
    if (self = [super init])
    {
        _coreDataService = [MNACoreDataService new];
        _adventureService = [[MNAAdventureService alloc] initWithCoreDataService:_coreDataService];
    }
    return self;
}

- (instancetype) configureIsNavigationBar: (BOOL)isNavigationBar
{
    MNAWishListViewController *startViewController = [[MNAWishListViewController alloc] initWithAdventureService:self.adventureService
                                                      ForMember:self.adventureService.me];
    self.rootViewController = isNavigationBar
        ? [[UINavigationController alloc] initWithRootViewController:startViewController]
        : startViewController;
    
    return self;
}

@end
