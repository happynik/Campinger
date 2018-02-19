//
//  MNAAdventureSummaryViewController.m
//  Campinger
//
//  Created by Nikita Moiseev on 13.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "MNAAdventureSummaryViewController.h"
#import "MNAFlyItemTableViewCell.h"

#import "MNAAdventureItem+CoreDataClass.h"

@interface MNAAdventureSummaryViewController ()

@property (nonatomic, strong) id<MNAAdventureServiceProtocol> adventureService;

@end

@implementation MNAAdventureSummaryViewController

static NSString * const AdventureItemReuseIdentifier = @"AdventureItemCell";
static NSString * const AdventureFlyReuseIdentifier = @"AdventureFlyCell";

- (instancetype) initWithAdventureService: (id<MNAAdventureServiceProtocol>) adventureService
{
    if (self = [super initWithStyle:UITableViewStylePlain])
    {
        _adventureService = adventureService;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.adventureService loadSummaryWithBlock:^{
        // скрыть прогресс бар
    }];
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:AdventureItemReuseIdentifier];
    [self.tableView registerClass:[MNAFlyItemTableViewCell class] forCellReuseIdentifier:AdventureFlyReuseIdentifier];
}

- (void)viewWillAppear:(BOOL)animated
{
    //self.navigationController.navigationBar.hidden = YES;
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.adventureService.summary.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MNAAdventureItem *item = self.adventureService.summary[indexPath.row];
    if (item.style == MNAAdventureItemStyleFly)
    {
        MNAFlyItemTableViewCell *flyCell = [tableView dequeueReusableCellWithIdentifier:AdventureFlyReuseIdentifier forIndexPath:indexPath];
        if (!flyCell)
        {
            flyCell = [[MNAFlyItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:AdventureFlyReuseIdentifier];
        }
        flyCell.flightItem = item;
        return flyCell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AdventureItemReuseIdentifier forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AdventureFlyReuseIdentifier];
    }
    cell.textLabel.text = item.title;
    return cell;
}

@end
