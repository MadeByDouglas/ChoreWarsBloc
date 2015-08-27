//
//  LoginViewController.m
//  ChoreWars
//
//  Created by Douglas Hewitt on 8/17/15.
//  Copyright © 2015 madebydouglas. All rights reserved.
//

#import "LoginViewController.h"
#import "CoreDataManager.h"
#import "Team.h"

@interface LoginViewController ()

@property NSFetchedResultsController *fetchedTeams;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Team" inManagedObjectContext:[CoreDataManager sharedInstance].managedObjectContext];

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nameTeam" ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setEntity:entity];
    
    self.fetchedTeams = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[CoreDataManager sharedInstance].managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        [self.fetchedTeams performFetch:NULL];
        if (self.fetchedTeams.fetchedObjects.count == 0) {
            
            Team *teamA = [[Team alloc] initWithEntity:entity insertIntoManagedObjectContext:[CoreDataManager sharedInstance].managedObjectContext];
            teamA.nameTeam = @"TeamA";
            teamA.didWin = 0;
            Team *teamB = [[Team alloc] initWithEntity:entity insertIntoManagedObjectContext:[CoreDataManager sharedInstance].managedObjectContext];
            teamB.nameTeam = @"TeamB";
            teamB.didWin = 0;
        }
    });
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return self.fetchedTeams.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"teamCell" forIndexPath:indexPath];
    Team *team = [self.fetchedTeams.fetchedObjects objectAtIndex:indexPath.row];
    cell.textLabel.text = team.nameTeam;

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
