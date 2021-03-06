//
//  Team+CoreDataProperties.h
//  ChoreWars
//
//  Created by Douglas Hewitt on 9/11/15.
//  Copyright © 2015 madebydouglas. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Team.h"

NS_ASSUME_NONNULL_BEGIN

@interface Team (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *didWin;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Chore *> *choresToWin;
@property (nullable, nonatomic, retain) NSSet<Competition *> *competitions;
@property (nullable, nonatomic, retain) NSSet<Chore *> *opposingChoresToConfirm;
@property (nullable, nonatomic, retain) NSSet<Roommate *> *participants;

@end

@interface Team (CoreDataGeneratedAccessors)

- (void)addChoresToWinObject:(Chore *)value;
- (void)removeChoresToWinObject:(Chore *)value;
- (void)addChoresToWin:(NSSet<Chore *> *)values;
- (void)removeChoresToWin:(NSSet<Chore *> *)values;

- (void)addCompetitionsObject:(Competition *)value;
- (void)removeCompetitionsObject:(Competition *)value;
- (void)addCompetitions:(NSSet<Competition *> *)values;
- (void)removeCompetitions:(NSSet<Competition *> *)values;

- (void)addOpposingChoresToConfirmObject:(Chore *)value;
- (void)removeOpposingChoresToConfirmObject:(Chore *)value;
- (void)addOpposingChoresToConfirm:(NSSet<Chore *> *)values;
- (void)removeOpposingChoresToConfirm:(NSSet<Chore *> *)values;

- (void)addParticipantsObject:(Roommate *)value;
- (void)removeParticipantsObject:(Roommate *)value;
- (void)addParticipants:(NSSet<Roommate *> *)values;
- (void)removeParticipants:(NSSet<Roommate *> *)values;

@end

NS_ASSUME_NONNULL_END
