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


@interface MNAWishListViewController ()

@property (nonatomic, weak) MNAAssembly *assembly;

@property (nonatomic, strong) id<MNAWishesServiceProtocol> wishesService;

@property (nonatomic, strong) MNAMember *currentMember;
@property (nonatomic, strong) NSArray<MNAWish *> *wishes;

@property (nonatomic) NSInteger selectedItemsCount;
@property (nonatomic, strong) UIBarButtonItem *nextBarButton;

@end


@implementation MNAWishListViewController

static int const columnsInCollectionView = 2;
static NSString * const reuseIdentifier = @"WishCell";

- (instancetype)initWithAssembly:(MNAAssembly *) assembly
                   WishesService:(id<MNAWishesServiceProtocol>) wishesService
                       ForMember:(MNAMember *)member
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
    
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [self.collectionView registerClass:[MNAWishCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
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

- (void)p_nextButtonClick
{
    [self.navigationController pushViewController:self.assembly.adventureSummaryViewController animated:YES];
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


- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}

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

@end
