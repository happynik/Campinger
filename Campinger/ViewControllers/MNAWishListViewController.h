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
#import "MNAFlickrService.h"


@interface MNAWishListViewController : UICollectionViewController

- (instancetype) initWithAssembly:(MNAAssembly *) assembly
                    WishesService:(id<MNAWishesServiceProtocol>) wishesService
                    FlickrService:(MNAFlickrService *) flickrService
                        ForMember:(MNAMember *)member NS_DESIGNATED_INITIALIZER;

@end
