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

static int const columnsInCollectionView = 2;

@interface MNAWishListViewController ()

@property (nonatomic, strong) id<MNAWishesServiceProtocol> wishesService;

@property (nonatomic) NSInteger selectedItemsCount;

@property (nonatomic, strong) UIBarButtonItem *nextBarButton;

@end

@implementation MNAWishListViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype) initWithWishesService: (id<MNAWishesServiceProtocol>) wishesService
{
    if (self = [super initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]])
    {
        _wishesService = wishesService;
        _nextBarButton = [[UIBarButtonItem alloc] initWithTitle:@"далее" style:UIBarButtonItemStylePlain target:self action:@selector(p_nextButtonClick)];
        
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
    //[self p_setEstimatedSizeIfNeeded];
    self.navigationItem.rightBarButtonItem = self.nextBarButton;
}

- (void)p_setEstimatedSizeIfNeeded
{
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    CGFloat estimatedWidth = 60.f;
    if (flowLayout.estimatedItemSize.width != estimatedWidth) {
        [flowLayout setEstimatedItemSize:CGSizeMake(estimatedWidth, 200)];
        [flowLayout invalidateLayout];
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        [self.collectionViewLayout invalidateLayout];
        [self.collectionView reloadData];
    }];
}

- (void) p_nextButtonClick
{
    MNAChoosePeriodViewController *choosePeriodViewController = [MNAChoosePeriodViewController new];
    [self.navigationController pushViewController:choosePeriodViewController animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
#warning Incomplete implementation, return the number of items
    return self.wishesService.AllWishes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MNAWishCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.name = self.wishesService.AllWishes[indexPath.row];
    
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
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MNAWishCollectionViewCell *cell = (MNAWishCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    [cell highlightForDeselected];
    self.selectedItemsCount--;
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
