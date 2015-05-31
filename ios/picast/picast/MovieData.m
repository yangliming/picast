//
//  MovieData.m
//  picast
//
//  Created by Alexander Yang on 5/31/15.
//  Copyright (c) 2015 Alexander Yang. All rights reserved.
//

#import "MovieData.h"

@implementation MovieData

@synthesize url = _url;
@synthesize title = _title;
@synthesize year = _year;
@synthesize rated = _rated;
@synthesize released = _released;
@synthesize runtime = _runtime;
@synthesize genre = _genre;
@synthesize director = _director;
@synthesize writer = _writer;
@synthesize actors = _actors;
@synthesize plot = _plot;
@synthesize language = _language;
@synthesize country = _country;
@synthesize awards = _awards;
@synthesize poster = _poster;
@synthesize metascore = _metascore;
@synthesize imdbRating = _imdbRating;
@synthesize imdbVotes = _imdbVotes;
@synthesize imdbID = _imdbID;
@synthesize type = _type;
@synthesize response = _response;
@synthesize mime = _mime;
@synthesize image = _image;

- (id)initWithDictionary:(NSDictionary *)data Image:(UIImage*)image{
    
    NSArray* keys = [data allKeys];
    NSArray* values = [data allValues];
    
    _url = keys[0];
    _title = values[0][@"Title"];
    _year = values[0][@"Year"];
    _rated = values[0][@"Rated"];
    _released = values[0][@"Released"];
    _runtime = values[0][@"Runtime"];
    _genre = values[0][@"Genre"];
    _director = values[0][@"Director"];
    _writer = values[0][@"Writer"];
    _actors = values[0][@"Actors"];
    _plot = values[0][@"Plot"];
    _language = values[0][@"Language"];
    _country = values[0][@"Country"];
    _awards = values[0][@"Awards"];
    _poster = values[0][@"Poster"];
    _metascore = values[0][@"Metascore"];
    _imdbRating = values[0][@"imdbRating"];
    _imdbVotes = values[0][@"imdbVotes"];
    _imdbID = values[0][@"imdbID"];
    _type = values[0][@"Type"];
    _response = values[0][@"Response"];
    _mime = values[0][@"mime"];
    _image = image;
    
    return self;
}

@end
