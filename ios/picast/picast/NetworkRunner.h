//
//  NetworkRunner.h
//  picast
//
//  Created by Alexander Yang on 5/1/15.
//  Copyright (c) 2015 Alexander Yang. All rights reserved.
//

#ifndef picast_NetworkRunner_h
#define picast_NetworkRunner_h

#import <UIKit/UIKit.h>

@interface NetworkRunner : NSObject

// Finding Streaming Services
+ (void)broadcast;
+ (void)setupListener:(int)port;
+ (void)loadServerList:(NSMutableArray*)dataSource TableView:(UITableView*)tableViewRef;


// Setting Connection
+ (void)setConnection:(NSString*)connectURL; // should be of the form x.x.x.x:port

// Retrieving Data
+ (void)loadVideoList:(NSMutableArray*)data CollectionView:(UICollectionView*)collectionViewRef;

// Iphone Controls
+ (void)selectVideo:(NSString*)videoURL;
+ (void)playVideo;
+ (void)setStream;

// Pi Controls
+ (void)setStreamPi:(NSString*)videoURL;
+ (void)togglePlayPi;
+ (void)stopPlayPi;

@end


#endif
