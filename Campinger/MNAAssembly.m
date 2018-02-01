//
//  MNAAssembly.m
//  Campinger
//
//  Created by Nikita Moiseev on 01.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "MNAAssembly.h"
#import "MNAWishesService.h"
#import "MNAWishListTableViewController.h"

@interface MNAAssembly ()

@property (nonatomic, strong) id<MNAWishesServiceProtocol> wishesService;

@end

@implementation MNAAssembly

- (instancetype) init
{
    if (self = [super init])
    {
        _wishesService = [MNAWishesService new];
    }
    return self;
}

- (instancetype) configure
{
    MNAWishListTableViewController *startViewController = [[MNAWishListTableViewController alloc] initWithWishesService:self.wishesService];
    self.rootViewController = [[UINavigationController alloc] initWithRootViewController:startViewController];
    
    return self;
}

@end
