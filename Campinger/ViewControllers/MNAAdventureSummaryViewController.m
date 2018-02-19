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
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:AdventureItemReuseIdentifier];
    [self.tableView registerClass:[MNAFlyItemTableViewCell class] forCellReuseIdentifier:AdventureFlyReuseIdentifier];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    //self.navigationController.navigationBar.hidden = YES;
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
