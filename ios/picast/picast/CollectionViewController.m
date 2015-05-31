//
//  CollectionViewController.m
//  picast
//
//  Created by Alexander Yang on 5/31/15.
//  Copyright (c) 2015 Alexander Yang. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController()

@end

@implementation CollectionViewController {
    NSMutableDictionary* _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout* layout = (UICollectionViewFlowLayout*)self.collectionViewLayout;
    [layout setItemSize:CGSizeMake(50, 50)];
    
    _data = [[NSMutableDictionary alloc] init];
    [_data setObject:@"test" forKey:@"1"];
    [_data setObject:@"test2" forKey:@"2"];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

@end
