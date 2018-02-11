//
//  MNAWishListViewController.h
//  Campinger
//
//  Created by Nikita Moiseev on 04.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNAAdventureService.h"

@interface MNAWishListViewController : UICollectionViewController

- (instancetype) initWithAdventureService: (id<MNAAdventureServiceProtocol>) adventureService
                                ForMember: (MNAMember *)member NS_DESIGNATED_INITIALIZER;

- (instancetype) initWithAdventureService: (id<MNAAdventureServiceProtocol>) adventureService;

@end
