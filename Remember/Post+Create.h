//
//  Post+Create.h
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import "Post.h"

@interface Post (Create)

+(Post *)postWithDict:(NSDictionary *)dict inManagedObjectContext:(NSManagedObjectContext *)context;

@end
