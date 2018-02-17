//
//  MNAAdventureSummaryViewController.h
//  Campinger
//
//  Created by Nikita Moiseev on 13.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNAAdventureService.h"

@interface MNAAdventureSummaryViewController : UITableViewController

- (instancetype) initWithAdventureService: (id<MNAAdventureServiceProtocol>) adventureService;

@end
