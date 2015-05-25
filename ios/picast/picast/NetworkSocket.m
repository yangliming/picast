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

@implementation NetworkSocket {
    NSMutableArray* _dataSource;
    UITableView* _tableViewRef;
    NSMutableData* _responseData;
    NSString* _url;
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
    // we want to serialize the data into a JSON object
    NSError* error;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:_responseData options:kNilOptions error:&error];
    
    // well, need to know what the server is sending before we can actually compose anything :[
    if (_dataSource != nil && _tableViewRef != nil) {
        [_dataSource addObject: @"Yay I added an object to mah data!"];
        [_tableViewRef reloadData];
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    Alert(@"Connection Error");
}

- (void)makeRequest:(NSString *)req {
    NSString* url = [NSString stringWithFormat: @"http://%@/%@", _url, req];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString: url]];
    NSURLConnection* conn = [[NSURLConnection alloc] initWithRequest:request delegate: self];
}

- (void)makeRequest:(NSString *)req data:(NSMutableArray*)dataSource TableView:(UITableView*)tableVewRef{
    NSString* url = [NSString stringWithFormat: @"http://%@/%@", _url, req];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString: url]];
    NSURLConnection* conn = [[NSURLConnection alloc] initWithRequest:request delegate: self];
    
    _dataSource = dataSource;
    _tableViewRef = tableVewRef;
}

@end