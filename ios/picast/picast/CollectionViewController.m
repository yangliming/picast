//
//  CollectionViewController.m
//  picast
//
//  Created by Alexander Yang on 5/31/15.
//  Copyright (c) 2015 Alexander Yang. All rights reserved.
//

#import "CollectionViewController.h"
#import "DetailsViewController.h"

@interface CollectionViewController()

@end

@implementation CollectionViewController {
    NSMutableDictionary* _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UIFont * customFont = [UIFont fontWithName:ProximaNovaSemibold size:12]; //custom font
    NSString * text = @"Your Movies";
    
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(-10, 10, 320, 50)];
    fromLabel.text = text;
    fromLabel.numberOfLines = 1;
    [fromLabel setFont:[UIFont systemFontOfSize:36]];
    fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
    fromLabel.adjustsFontSizeToFitWidth = YES;
    fromLabel.adjustsLetterSpacingToFitWidth = YES;
    fromLabel.minimumScaleFactor = 10.0f/12.0f;
    fromLabel.clipsToBounds = YES;
    fromLabel.backgroundColor = [UIColor clearColor];
    fromLabel.textColor = [UIColor whiteColor];
    fromLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:fromLabel];
    
    self.movieImages = [NSArray arrayWithObjects:@"ashton.jpg",@"avatar.jpg", @"dumb.jpg",nil];
    UICollectionViewFlowLayout* layout = (UICollectionViewFlowLayout*)self.collectionViewLayout;
    [layout setItemSize:CGSizeMake(95, 150)];
    
    [layout setSectionInset:UIEdgeInsetsMake(50, 5, -30, 5)];
    [layout setHeaderReferenceSize:CGSizeMake(0.0f, 30.0f)];
    
    
    _data = [[NSMutableDictionary alloc] init];
    [_data setObject:@"test" forKey:@"1"];
    [_data setObject:@"test2" forKey:@"2"];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.movieImages count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    UIImageView *movieImageView = (UIImageView *)[cell viewWithTag:100];
    
    movieImageView.image = [UIImage imageNamed:[self.movieImages objectAtIndex:indexPath.row]];
   
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pie.jpg"]];
    [self.view addSubview:movieImageView];

    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    DetailsViewController* dvc = [[DetailsViewController alloc] init];
    [self presentViewController:dvc animated:YES completion:nil];
    

}


@end
