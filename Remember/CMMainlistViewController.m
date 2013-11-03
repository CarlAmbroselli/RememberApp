//
//  CMMainlistViewController.m
//  Remember
//
//  Created by Carl Ambroselli on 03.11.13.
//  Copyright (c) 2013 CM. All rights reserved.
//

#import "CMMainlistViewController.h"
#import "CMRememberCell.h"
#import "Database.h"
#import "CMSoundCell.h"
#import "CMSound2Cell.h"
#import "CMImageCell.h"
#import "CMCustomCell.h"
#import "CMVideoCell.h"

@interface CMMainlistViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CMMainlistViewController

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    if(managedObjectContext) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Post"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"id" ascending:NO]];
        request.predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
        
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil]; // sectionNameKeyPath = KeyPath for the Section Names;
    }else {
        self.fetchedResultsController = nil;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorColor = [UIColor clearColor];
    [self hideTabBar:self.tabBarController];
    self.managedObjectContext = [[Database sharedInstance] managedObjectContext];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Post *post = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    CMRememberCell *cell = nil;
    
    if([post.type isEqualToString:@"sound"]){
        NSString *CellIdentifier = @"soundCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[CMSoundCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
    } else if([post.type isEqualToString:@"sound2"]){
        NSString *CellIdentifier = @"sound2Cell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[CMSound2Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
    } else if([post.type isEqualToString:@"image"]){
        NSString *CellIdentifier = @"imageCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[CMImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
    } else if([post.type isEqualToString:@"video"]){
        NSString *CellIdentifier = @"videoCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[CMVideoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
    } else if([post.type isEqualToString:@"custom"]){
        NSString *CellIdentifier = @"customCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[CMCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
    } else {
        NSString *CellIdentifier = @"imageCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[CMImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
    }
    
    cell.post = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 179;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */
- (IBAction)YouButtonPressed:(id)sender {
    NSLog(@"Pressed You Button");
    [self.tabBarController setSelectedIndex:0];
}

- (IBAction)FriendsButtonPressed:(id)sender {
    NSLog(@"Pressed Friends Button");
    [self.tabBarController setSelectedIndex:1];
}

- (IBAction)EveryoneButtonPressed:(id)sender {
    NSLog(@"Pressed Everyone Button");
    [self.tabBarController setSelectedIndex:2];
}

// Method implementations
- (void)hideTabBar:(UITabBarController *) tabbarcontroller
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, self.view.frame.size.height, view.frame.size.width, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, self.view.frame.size.height)];
        }
    }
    
    [UIView commitAnimations];
}

- (void)showTabBar:(UITabBarController *) tabbarcontroller
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, 431, view.frame.size.width, view.frame.size.height)];
            
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 431)];
        }
    }
    
    [UIView commitAnimations];
}

- (IBAction)searchButtonPressed:(id)sender {
    NSLog(@"Search Button Pressed");
    [[Database sharedInstance] initializeSampleData];
    [self.tableView reloadData];
    NSLog(@"%u", [[self.fetchedResultsController sections] count]);
}


@end
