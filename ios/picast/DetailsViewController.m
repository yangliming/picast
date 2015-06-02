//
//  DetailsViewController.m
//  picast
//
//  Created by Ada Lea on 31/05/15.
//  Copyright (c) 2015 Alexander Yang. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *MovieTitle;
@property (weak, nonatomic) IBOutlet UIImageView *Image;
@property (weak, nonatomic) IBOutlet UILabel *Released;
@property (weak, nonatomic) IBOutlet UILabel *Genre;

@property (weak, nonatomic) IBOutlet UILabel *IMDb;
@property (weak, nonatomic) IBOutlet UILabel *Actors;

@property (weak, nonatomic) IBOutlet UILabel *Director;

@property (weak, nonatomic) IBOutlet UILabel *Synopsis;

@end

@implementation DetailsViewController
- (IBAction)StreamToPhone:(id)sender {
}
- (IBAction)StreamOnPi:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
