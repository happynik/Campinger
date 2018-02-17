//
//  MNAWishListViewController.m
//  Campinger
//
//  Created by Nikita Moiseev on 04.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "MNAWishListViewController.h"
#import "MNAWishCollectionViewCell.h"
#import "MNAChoosePeriodViewController.h"
#import "MNAAdventureSummaryViewController.h"

static int const columnsInCollectionView = 2;

@interface MNAWishListViewController ()

@property (nonatomic, weak) MNAAssembly *assembly;

@property (nonatomic, strong) id<MNAWishesServiceProtocol> wishesService;

@property (nonatomic, strong) MNAMember *currentMember;
@property (nonatomic, strong) NSArray<MNAWish *> *wishes;

@property (nonatomic) NSInteger selectedItemsCount;
@property (nonatomic, strong) UIBarButtonItem *nextBarButton;

@end

@implementation MNAWishListViewController

static NSString * const reuseIdentifier = @"WishCell";

- (instancetype) initWithAssembly: (MNAAssembly *) assembly
                    WishesService: (id<MNAWishesServiceProtocol>) wishesService
                        ForMember: (MNAMember *)member
{
    if (self = [super initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]])
    {
        _assembly = assembly;
        _wishesService = wishesService;
        _currentMember = member;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.allowsMultipleSelection = YES;
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[MNAWishCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    self.nextBarButton = [[UIBarButtonItem alloc] initWithTitle:@"далее"
                                                      style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:@selector(p_nextButtonClick)];
    self.navigationItem.rightBarButtonItem = self.nextBarButton;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.wishes = [self.wishesService availableWishesForMember:self.currentMember];
    [self.collectionView reloadData];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self.wishesService save];
    
    [super viewDidDisappear:animated];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
//    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
//        
//    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
//        [self.collectionViewLayout invalidateLayout];
//        [self.collectionView reloadData];
//    }];
}

- (void) p_nextButtonClick
{
//    MNAChoosePeriodViewController *choosePeriodViewController = [MNAChoosePeriodViewController new];
//    [self.navigationController pushViewController:choosePeriodViewController animated:NO];
    [self.navigationController pushViewController:self.assembly.adventureSummaryViewController animated:NO];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.wishes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MNAWishCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    MNAWish *wish = self.wishes[indexPath.row];
    
    // Configure the cell
    cell.name = wish.name;
    
    if ([self.currentMember.wishes containsObject:wish])
    {
        [cell highlightForSelected];
    }
    else
    {
        [cell highlightForDeselected];
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat side = collectionView.frame.size.width/columnsInCollectionView - 5;
    return CGSizeMake(side, side);
}


// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}

// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.selectedItemsCount < 2;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MNAWishCollectionViewCell *cell = (MNAWishCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    [cell highlightForSelected];
    self.selectedItemsCount++;
    
    [self.currentMember addWishesObject:self.wishes[indexPath.row]];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MNAWishCollectionViewCell *cell = (MNAWishCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    [cell highlightForDeselected];
    self.selectedItemsCount--;
    
    
    MNAWish *wish = self.wishes[indexPath.row];
    [self.currentMember removeWishesObject:wish];
    [wish removeMembersObject:self.currentMember];
}

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
