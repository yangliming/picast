//
//  NetworkSocket.h
//  picast
//
//  Created by Alexander Yang on 5/12/15.
//  Copyright (c) 2015 Alexander Yang. All rights reserved.
//

#ifndef picast_NetworkSocket_h
#define picast_NetworkSocket_h

@import Foundation;
#import <UIKit/UIKit.h>

@interface NetworkSocket : NSObject <NSURLConnectionDelegate>

- (id)initWithURL:(NSString*)url;
- (NSURLConnection*)makeGenericRequest:(NSString*)req;
- (NSURLConnection*)makeRequest:(NSString*)req;
- (NSURLConnection*)makeRequest:(NSString*)req data:(NSMutableArray*)dataSource CollectionView:(UICollectionView*)tableVewRef;

@end


#endif
