//
//  NetworkSocket.m
//  picast
//
//  Created by Alexander Yang on 5/12/15.
//  Copyright (c) 2015 Alexander Yang. All rights reserved.
//

#import "NetworkSocket.h"
#import <Foundation/Foundation.h>
#import "Utils.h"
#import "MovieData.h"

@implementation NetworkSocket {
    NSMutableArray* _dataSource;
    UICollectionView* _collectionViewRef;
    NSMutableData* _responseData;
    NSString* _url;
    NSMutableDictionary* _imgConn;
}

- (id)initWithURL:(NSString *)url {
    _url = url;
    return self;
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _responseData = [[NSMutableData alloc] init];
    
    // so we should get a HTTP response back, the body of the data is not located in this object
    // we can use httpResp to see the status code, and any headers
    NSHTTPURLResponse* httpResp = (NSHTTPURLResponse*)response;
    
    if (httpResp.statusCode >= 400) {
        Alert([NSString stringWithFormat:@"Error: %li", (long)httpResp.statusCode]);
    }
}

// this function will be called after every block of data is sent, this is why we append the
// data to our _responseData object; however, each chunk is not complete though. all of the data
// will be received when connectionDidFinishLoading is called
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {

    if (_imgConn == nil) {
        _imgConn = [[NSMutableDictionary alloc] init];
    }
    
    NSString* key = [NSString stringWithFormat:@"%d", (int)connection];
    NSDictionary* data = [_imgConn objectForKey:key];
    
    
    // When we got a list
    if (data == nil && [_responseData length] != 0) {
        NSError* error;
        NSDictionary* data = [NSJSONSerialization JSONObjectWithData:_responseData options:kNilOptions error:&error];
        
        NSString* dKey = [data allKeys][0];
        int conn = (int)[self makeGenericRequest:data[dKey][@"Poster"]];
        
        NSString* newKey = [NSString stringWithFormat:@"%d", conn];
        [_imgConn setObject:data forKey:newKey];
    }
    // When we got an image
    else {
        if (_dataSource != nil) {
            
            UIImage* image = [[UIImage alloc] initWithData:_responseData];
            MovieData* md = [[MovieData alloc] initWithDictionary:data Image:image];
            [_dataSource addObject: md];
        }
        
        if (_collectionViewRef != nil) {
            [_collectionViewRef reloadData];
        }
        
        [_imgConn removeObjectForKey:key];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    Alert(@"Connection Error");
}


- (NSURLConnection*)makeGenericRequest:(NSString *)req {
    NSString* url = req;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString: url]];
    return [[NSURLConnection alloc] initWithRequest:request delegate: self];
}

- (NSURLConnection*)makeRequest:(NSString *)req {
    NSString* url = [NSString stringWithFormat: @"http://%@/%@", _url, req];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString: url]];
    return [[NSURLConnection alloc] initWithRequest:request delegate: self];
}

- (NSURLConnection*)makeRequest:(NSString *)req data:(NSMutableArray*)dataSource CollectionView:(UICollectionView *)collectionViewRef{
    
    _dataSource = dataSource;
    _collectionViewRef = collectionViewRef;
    
    NSString* url = [NSString stringWithFormat: @"http://%@/%@", _url, req];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString: url]];
    return [[NSURLConnection alloc] initWithRequest:request delegate: self];
}

@end