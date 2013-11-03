//
//  Media.h
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Post;

@interface Media : NSManagedObject

@property (nonatomic, retain) NSString * fileName;
@property (nonatomic, retain) NSString * mediaType;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSSet *post;
@end

@interface Media (CoreDataGeneratedAccessors)

- (void)addPostObject:(Post *)value;
- (void)removePostObject:(Post *)value;
- (void)addPost:(NSSet *)values;
- (void)removePost:(NSSet *)values;

@end
