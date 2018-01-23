//
//  AppDelegate.h
//  Campinger
//
//  Created by Nikita Moiseev on 24.01.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

