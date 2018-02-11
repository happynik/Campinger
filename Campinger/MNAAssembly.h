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

@interface MNAAssembly : NSObject

@property (nonatomic, strong) UIViewController *rootViewController;

@property (nonatomic, strong) MNACoreDataService *coreDataService;

/*
 конфигурируем приложение
 */
- (instancetype) configureIsNavigationBar: (BOOL)isNavigationBar;

@end
