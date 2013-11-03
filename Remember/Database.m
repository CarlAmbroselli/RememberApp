
//
//  Database.m
//  Pinivo
//
//  Created by Carl Ambroselli on 06.08.13.
//  Copyright (c) 2013 Ambsky. All rights reserved.
//

#import "Database.h"
#import "Post+Create.h"
#import "Media+Create.h"

@implementation Database

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (Database *)sharedInstance
{
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    // returns the same object each time
    return _sharedObject;
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Model.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

-(void)initializeSampleData
{
    NSDictionary *postOneDict = @{@"postId": @1,
                              @"range" : @"you",
                              @"year" : @"1990",
                              @"isLiked" : @NO,
                              @"type" : @"sound",
                              @"locationLat" : @93.33223f,
                              @"locationLong" : @93.33223f,
                              @"headline" : @"Pokemon Fight Sound"};
    
    NSDictionary *mediaOneDict = @{@"fileName": @"pokemonBattleSound.mp3",
                               @"mediaId" : @1 };
    
    Post *postOne = [Post postWithDict:postOneDict inManagedObjectContext:[self managedObjectContext]];
    Media *mediaOne = [Media mediaWithDict:mediaOneDict inManagedObjectContext:[self managedObjectContext]];
    
    [postOne addMediaObject:mediaOne];
    
    NSDictionary *postTwoDict = @{@"postId": @2,
                                  @"range" : @"everyone",
                                  @"year" : @"1990's",
                                  @"isLiked" : @NO,
                                  @"type" : @"video",
                                  @"locationLat" : @0.0f,
                                  @"locationLong" : @0.0f,
                                  @"headline" : @"The Firestone Family"};
    
    NSDictionary *mediaTwoDict = @{@"fileName": @"firestone_intro_80er_90er.mp4",
                                   @"mediaId" : @1 };
    
    Post *postTwo = [Post postWithDict:postTwoDict inManagedObjectContext:[self managedObjectContext]];
    Media *mediaTwo = [Media mediaWithDict:mediaTwoDict inManagedObjectContext:[self managedObjectContext]];
    
    [postTwo addMediaObject:mediaTwo];
    
    
    NSDictionary *postThreeDict = @{@"postId": @3,
                                  @"range" : @"everyone",
                                  @"year" : @"1998",
                                  @"isLiked" : @NO,
                                  @"type" : @"image",
                                  @"locationLat" : @0.0f,
                                  @"locationLong" : @0.0f,
                                  @"headline" : @"Furby",
                                };
    
    NSDictionary *mediaThreeDict = @{@"fileName": @"furby_1998.jpg",
                                   @"mediaId" : @3 };
    
    Post *postThree = [Post postWithDict:postThreeDict inManagedObjectContext:[self managedObjectContext]];
    Media *mediaThree = [Media mediaWithDict:mediaThreeDict inManagedObjectContext:[self managedObjectContext]];
    
    [postThree addMediaObject:mediaThree];
    
    NSDictionary *post4Dict = @{@"postId": @4,
                                    @"range" : @"everyone",
                                    @"year" : @"1984",
                                    @"isLiked" : @NO,
                                    @"type" : @"sound2",
                                    @"locationLat" : @0.0f,
                                    @"locationLong" : @0.0f,
                                    @"headline" : @"Tetris",
                                    };
    
    NSDictionary *media4Dict = @{@"fileName": @"tetris_Gameboy.jpg",
                                     @"mediaId" : @4 };
    
    NSDictionary *media4Dict2 = @{@"fileName": @"original_tetris.jpg",
                                 @"mediaId" : @42 };
    
    NSDictionary *media4Dict3 = @{@"fileName": @"tetris_sound_1984.mp3",
                                 @"mediaId" : @43 };
    
    Post *post4 = [Post postWithDict:post4Dict inManagedObjectContext:[self managedObjectContext]];
    Media *media4 = [Media mediaWithDict:media4Dict inManagedObjectContext:[self managedObjectContext]];
    Media *media42 = [Media mediaWithDict:media4Dict2 inManagedObjectContext:[self managedObjectContext]];
    Media *media43 = [Media mediaWithDict:media4Dict3 inManagedObjectContext:[self managedObjectContext]];
    
    [post4 addMediaObject:media4];
    [post4 addMediaObject:media42];
    [post4 addMediaObject:media43];
    
    NSDictionary *post5Dict = @{@"postId": @5,
                                  @"range" : @"everyone",
                                  @"year" : @"1996",
                                  @"isLiked" : @NO,
                                  @"type" : @"image",
                                  @"locationLat" : @0.0f,
                                  @"locationLong" : @0.0f,
                                  @"headline" : @"YU-GI-OH",
                                @"contentText" : @"The legendary blue eyes white dragon"};
    
    NSDictionary *media5Dict = @{@"fileName": @"blue_eyes_white_dragon_1996.jpg",
                                   @"mediaId" : @5 };
    
    Post *post5 = [Post postWithDict:post5Dict inManagedObjectContext:[self managedObjectContext]];
    Media *media5 = [Media mediaWithDict:media5Dict inManagedObjectContext:[self managedObjectContext]];
    
    [post5 addMediaObject:media5];

    NSDictionary *post6Dict = @{@"postId": @6,
                                @"range" : @"everyone",
                                @"year" : @"1987",
                                @"isLiked" : @NO,
                                @"type" : @"sound",
                                @"locationLat" : @0.0f,
                                @"locationLong" : @0.0f,
                                @"headline" : @"Kraftwerk - Taschenrechner"};
    
    NSDictionary *media6Dict1 = @{@"fileName": @"computerwelt_kraftwerk_1981.jpg",
                                 @"mediaId" : @61 };
    
    NSDictionary *media6Dict = @{@"fileName": @"Kraftwerk_Taschenrechner_1987.mp3",
                                 @"mediaId" : @6 };
    
    Post *post6 = [Post postWithDict:post6Dict inManagedObjectContext:[self managedObjectContext]];
    Media *media6 = [Media mediaWithDict:media6Dict inManagedObjectContext:[self managedObjectContext]];
    Media *media61 = [Media mediaWithDict:media6Dict1 inManagedObjectContext:[self managedObjectContext]];
    
    [post6 addMediaObject:media6];
    [post6 addMediaObject:media61];
    
    NSDictionary *post7Dict = @{@"postId": @7,
                                @"range" : @"everyone",
                                @"year" : @"1980's",
                                @"isLiked" : @NO,
                                @"type" : @"image",
                                @"locationLat" : @0.0f,
                                @"locationLong" : @0.0f,
                                @"headline" : @"The rubiks cube",
                                @"contentText" : @"Spending hours and hours on it..."};
    
    NSDictionary *media7Dict = @{@"fileName": @"rubiks_cube_80er.jpg",
                                 @"mediaId" : @7 };
    
    Post *post7 = [Post postWithDict:post7Dict inManagedObjectContext:[self managedObjectContext]];
    Media *media7 = [Media mediaWithDict:media7Dict inManagedObjectContext:[self managedObjectContext]];
    
    [post7 addMediaObject:media7];

    NSDictionary *post8Dict = @{@"postId": @8,
                                @"range" : @"everyone",
                                @"year" : @"1980's",
                                @"isLiked" : @NO,
                                @"type" : @"image",
                                @"locationLat" : @0.0f,
                                @"locationLong" : @0.0f,
                                @"headline" : @"Tamagotchi"};
    
    NSDictionary *media8Dict = @{@"fileName": @"tamagotchi_90er.jpeg",
                                 @"mediaId" : @8 };
    
    Post *post8 = [Post postWithDict:post8Dict inManagedObjectContext:[self managedObjectContext]];
    Media *media8 = [Media mediaWithDict:media8Dict inManagedObjectContext:[self managedObjectContext]];
    
    [post8 addMediaObject:media8];
    
    NSDictionary *post9Dict = @{@"postId": @9,
                                @"range" : @"everyone",
                                @"year" : @"1984's",
                                @"isLiked" : @NO,
                                @"type" : @"image",
                                @"locationLat" : @0.0f,
                                @"locationLong" : @0.0f,
                                @"headline" : @"Tamagotchi"};
    
    NSDictionary *media9Dict = @{@"fileName": @"ninjaTurtles_1984.jpg",
                                 @"mediaId" : @9 };
    
    Post *post9 = [Post postWithDict:post9Dict inManagedObjectContext:[self managedObjectContext]];
    Media *media9 = [Media mediaWithDict:media9Dict inManagedObjectContext:[self managedObjectContext]];
    
    [post9 addMediaObject:media9];

    NSDictionary *post10Dict = @{@"postId": @10,
                                @"range" : @"everyone",
                                @"year" : @"1999",
                                @"isLiked" : @NO,
                                @"type" : @"sound",
                                @"locationLat" : @0.0f,
                                @"locationLong" : @0.0f,
                                @"headline" : @"Star Wars"};
    
    NSDictionary *media10Dict = @{@"fileName": @"starwars_theme_1999.mp3",
                                 @"mediaId" : @10 };
    
    NSDictionary *media10Dict1 = @{@"fileName": @"todesstern_1999.gif",
                                  @"mediaId" : @101 };
    
    Post *post10 = [Post postWithDict:post10Dict inManagedObjectContext:[self managedObjectContext]];
    Media *media10 = [Media mediaWithDict:media10Dict inManagedObjectContext:[self managedObjectContext]];
    Media *media101 = [Media mediaWithDict:media10Dict1 inManagedObjectContext:[self managedObjectContext]];
    
    [post10 addMediaObject:media10];
    [post10 addMediaObject:media101];
    
}


@end
