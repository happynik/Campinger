//
//  MNAAssembly.h
//  Campinger
//
//  Created by Nikita Moiseev on 01.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MNACoreDataService.h"

@class MNAWishListViewController;
@class MNAChoosePeriodViewController;
@class MNAAdventureSummaryViewController;

@interface MNAAssembly : NSObject

@property (nonatomic, strong) MNACoreDataService *coreDataService;

@property (nonatomic, strong) UIViewController *rootViewController;

@property (readonly, nonatomic, strong) MNAWishListViewController *wishListViewController;
@property (readonly, nonatomic, strong) MNAChoosePeriodViewController *choosePeriodViewController;
@property (readonly, nonatomic, strong) MNAAdventureSummaryViewController *adventureSummaryViewController;

/*
 конфигурируем приложение
 */
- (instancetype) configureIsNavigationBar: (BOOL)isNavigationBar;

@end
