//
//  Post.h
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Media;

@interface Post : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * range;
@property (nonatomic, retain) NSString * year;
@property (nonatomic, retain) NSNumber * isLiked;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * locationLat;
@property (nonatomic, retain) NSString * contentText;
@property (nonatomic, retain) NSString * headline;
@property (nonatomic, retain) NSNumber * isCollapsable;
@property (nonatomic, retain) NSNumber * locationLong;
@property (nonatomic, retain) NSSet *media;
@end

@interface Post (CoreDataGeneratedAccessors)

- (void)addMediaObject:(Media *)value;
- (void)removeMediaObject:(Media *)value;
- (void)addMedia:(NSSet *)values;
- (void)removeMedia:(NSSet *)values;

@end
