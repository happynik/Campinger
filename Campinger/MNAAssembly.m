//
//  MNAAssembly.m
//  Campinger
//
//  Created by Nikita Moiseev on 01.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//


#import "MNAAssembly.h"
#import "MNAAdventureService.h"
#import "MNAAdvantureFacade.h"
#import "MNAWishesService.h"
#import "MNAWishListViewController.h"
#import "MNAAdventureSummaryViewController.h"


@interface MNAAssembly ()

@property (nonatomic, strong) MNAFlickrService *flickrService;
@property (nonatomic, strong) id<MNAAdventureServiceProtocol> adventureService;
@property (nonatomic, strong) id<MNAWishesServiceProtocol> wishesService;

@end


@implementation MNAAssembly

- (instancetype)init
{
    if (self = [super init])
    {
        _flickrService = [MNAFlickrService new];
        _coreDataService = [MNACoreDataService new];
        MNAStorageService* storageService = [MNAStorageService new];
        
        MNAAdvantureFacade *adventureFacade = [[MNAAdvantureFacade alloc] initWithCoreDataService:_coreDataService StorageService:storageService];
        _adventureService = [[MNAAdventureService alloc] initWithAdventureFacade:adventureFacade];
        _wishesService = [[MNAWishesService alloc] initWitchCoreDataService:_coreDataService];
    }
    return self;
}

- (MNAWishListViewController *)wishListViewController
{
    return [[MNAWishListViewController alloc] initWithAssembly:self
                                                 WishesService:self.wishesService
                                                 FlickrService:self.flickrService
                                                     ForMember:self.adventureService.me];
}

- (MNAAdventureSummaryViewController *)adventureSummaryViewController
{
    return [[MNAAdventureSummaryViewController alloc] initWithAdventureService:_adventureService];
}

- (instancetype)configureIsNavigationBar:(BOOL)isNavigationBar
{
    MNAWishListViewController *startViewController = self.wishListViewController;
    self.rootViewController = isNavigationBar
        ? [[UINavigationController alloc] initWithRootViewController:startViewController]
        : startViewController;
    
    return self;
}

@end
