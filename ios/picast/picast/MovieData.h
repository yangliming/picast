//
//  MovieData.h
//  picast
//
//  Created by Alexander Yang on 5/31/15.
//  Copyright (c) 2015 Alexander Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MovieData : NSObject

@property (readonly) NSString* url;
@property (readonly) NSString* title;
@property (readonly) NSString* year;
@property (readonly) NSString* rated;
@property (readonly) NSString* released;
@property (readonly) NSString* runtime;
@property (readonly) NSString* genre;
@property (readonly) NSString* director;
@property (readonly) NSString* writer;
@property (readonly) NSString* actors;
@property (readonly) NSString* plot;
@property (readonly) NSString* language;
@property (readonly) NSString* country;
@property (readonly) NSString* awards;
@property (readonly) NSString* poster;
@property (readonly) NSString* metascore;
@property (readonly) NSString* imdbRating;
@property (readonly) NSString* imdbVotes;
@property (readonly) NSString* imdbID;
@property (readonly) NSString* type;
@property (readonly) NSString* response;
@property (readonly) NSString* mime;
@property (readonly) UIImage* image;

- (id)initWithDictionary:(NSDictionary *)data Image:(UIImage*)image;

@end

/*

 {
	"/Users/alexanderyang/Movies/This.Is.the.End.2013.720p.BluRay.x264.mp4": {
 "Title": "This Is the End",
 "Year": "2013",
 "Rated": "R",
 "Released": "12 Jun 2013",
 "Runtime": "107 min",
 "Genre": "Comedy, Fantasy",
 "Director": "Evan Goldberg, Seth Rogen",
 "Writer": "Seth Rogen (screenplay), Evan Goldberg (screenplay), Seth Rogen (screen story), Evan Goldberg (screen story), Seth Rogen (short film \"Jay and Seth vs. The Apocalypse\"), Jason Stone (based on the short film \"Jay and Seth vs. The Apocalypse\" by), Evan Goldberg (short film \"Jay and Seth vs. The Apocalypse\")",
 "Actors": "James Franco, Jonah Hill, Seth Rogen, Jay Baruchel",
 "Plot": "While attending a party at James Franco's house, Seth Rogen, Jay Baruchel and many other celebrities are faced with the apocalypse.",
 "Language": "English, Spanish",
 "Country": "USA",
 "Awards": "12 wins & 12 nominations.",
 "Poster": "http://ia.media-imdb.com/images/M/MV5BMTQxODE3NjM1Ml5BMl5BanBnXkFtZTcwMzkzNjc4OA@@._V1_SX300.jpg",
 "Metascore": "67",
 "imdbRating": "6.7",
 "imdbVotes": "265723",
 "imdbID": "tt1245492",
 "Type": "movie",
 "Response": "True",
 "mime": "video/mp4",
 "type": "movie"
	}
 }
 
*/