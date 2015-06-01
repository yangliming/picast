//
//  ViewController.m
//  picast
//
//  Created by Alexander Yang on 4/30/15.
//  Copyright (c) 2015 Alexander Yang. All rights reserved.

@import AVKit;
@import AVFoundation;
#import "ViewController.h"
#import "CollectionViewController.h"
#import "NetworkRunner.h"
#import "Utils.h"
#import "MovieData.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray* dataSource;
    __weak IBOutlet UITableView *tableViewRef;
    __weak IBOutlet UIButton *testVideo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = self;
    
    dataSource = [[NSMutableArray alloc] init];
    
    [NetworkRunner setupListener:1234];
    [NetworkRunner loadServerList:dataSource TableView:tableViewRef];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (sender == testVideo) {
        AVPlayerViewController* destination = (AVPlayerViewController*)segue.destinationViewController;
        NSURL* url = [[NSURL alloc] initWithString: @"http://192.168.137.156:8000/out.m3u8"];
        destination.player = [[AVPlayer alloc] initWithURL: url];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"cell"];
    cell.textLabel.text = dataSource[[indexPath indexAtPosition: 1]][0];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* ip = dataSource[[indexPath indexAtPosition: 1]][1];
    [NetworkRunner setConnection:ip];
    
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    CollectionViewController* cvc = [[CollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self presentViewController:cvc animated:YES completion:nil];
}

- (UIViewController*)getViewController {
    return self;
}

- (IBAction)broadcastClick:(id)sender {
    [NetworkRunner broadcast];
}

- (IBAction)connectClick:(id)sender {
    [NetworkRunner setConnection:nil];
}

- (IBAction)loadListClick:(id)sender {
    [NetworkRunner loadVideoList:dataSource CollectionView:nil];
}

- (IBAction)setStreamClick:(id)sender {
    [NetworkRunner setStream];
}



@end
