//
//  MNAWishListViewController.h
//  Campinger
//
//  Created by Nikita Moiseev on 04.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNAAssembly.h"
#import "MNAWishesService.h"

@interface MNAWishListViewController : UICollectionViewController

- (instancetype) initWithAssembly: (MNAAssembly *) assembly
                    WishesService: (id<MNAWishesServiceProtocol>) wishesService
                        ForMember: (MNAMember *)member NS_DESIGNATED_INITIALIZER;

@end
