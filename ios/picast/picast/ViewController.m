//
//  ViewController.m
//  picast
//
//  Created by Alexander Yang on 4/30/15.
//  Copyright (c) 2015 Alexander Yang. All rights reserved.

@import AVKit;
@import AVFoundation;
#import "ViewController.h"
#import "NetworkRunner.h"
#import "Utils.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray* dataSource;
    __weak IBOutlet UITableView *tableViewRef;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = self;
    // Do any additional setup after loading the view, typically from a nib.
    
    dataSource = [[NSMutableArray alloc] init];
    [dataSource addObject: @"Item 1"];
    [dataSource addObject: @"Item 2"];
    [dataSource addObject: @"Item 3"];
    [dataSource addObject: @"Item 4"];
    [dataSource addObject: @"Item 5"];
    [dataSource addObject: @"Item 6"];
    [dataSource addObject: @"Item 7"];
    [dataSource addObject: @"Item 8"];
    [dataSource addObject: @"Item 9"];
    
    [NetworkRunner setupListener:1234];
}

- (IBAction)popupButton:(id)sender {
    Alert(@"this is our button");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AVPlayerViewController* destination = (AVPlayerViewController*)segue.destinationViewController;
    NSURL* url = [[NSURL alloc] initWithString: @"http://192.168.43.236:8000/out.m3u8"];
    destination.player = [[AVPlayer alloc] initWithURL: url];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        
    NSString* string = [NSString stringWithFormat: @"Selected Row: %lu", (unsigned long)[indexPath indexAtPosition: 1]];
    Alert(string);
    
    return indexPath;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"cell"];
    cell.textLabel.text = dataSource[[indexPath indexAtPosition: 1]];
    return cell;
}

- (UIViewController*)getViewController {
    return self;
}
- (IBAction)setStreamClick:(id)sender {
    [NetworkRunner setStream];
}

- (IBAction)addLabelClick:(id)sender {
    [NetworkRunner loadVideoList:dataSource TableView:tableViewRef];
}

- (IBAction)broadcastClick:(id)sender {
    [NetworkRunner broadcast];
}

@end
