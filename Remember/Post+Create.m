//
//  Post+Create.m
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import "Post+Create.h"

@implementation Post (Create)

+(Post *)postWithDict:(NSDictionary *)dict inManagedObjectContext:(NSManagedObjectContext *)context
{
    Post *post = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Post"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"id" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"id == %@", dict[@"postId"]];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if(!matches || ([matches count] > 1)) {
        //handle error
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    } else if (![matches count]) {
        post = [NSEntityDescription insertNewObjectForEntityForName:@"Post" inManagedObjectContext:context];
        post.id = dict[@"postId"];
    } else {
        post = [matches lastObject];
    }
    
    post.range = dict[@"range"];
    post.year = dict[@"year"];
    post.isLiked = dict[@"isLiked"];
    post.type = dict[@"type"];
    post.locationLat = dict[@"locationLat"];
    post.contentText = dict[@"contentText"];
    post.headline = dict[@"headline"];
    
    return post;
}

@end
