//
//  MNAWishListViewController.h
//  Campinger
//
//  Created by Nikita Moiseev on 04.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNAWishesService.h"

@interface MNAWishListViewController : UICollectionViewController

- (instancetype) initWithWishesService: (id<MNAWishesServiceProtocol>) wishesService;

@end
