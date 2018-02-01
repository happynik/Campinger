//
//  WishListTableViewController.h
//  Campinger
//
//  Created by Nikita Moiseev on 01.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNAWishesService.h"

@interface MNAWishListTableViewController : UITableViewController

- (instancetype) initWithWishesService: (id<MNAWishesServiceProtocol>) wishesService;

@end
