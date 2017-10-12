//
//  Directory.h
//  sqliteday1
//
//  Created by Student P_10 on 12/10/17.
//  Copyright © 2017 sonal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Directory : NSObject
{
    sqlite3 *taskDatabase;
}
+(instancetype)getSharedObject;
-(void)getAllTasks:(NSString *)query;
-(NSString *)getDatabasePath;
-(void)createDatabase;
-(BOOL)executeQuery:(NSString *)query;
@property NSMutableArray *taskNameArray;
@property NSMutableArray *taskIdArray;



@end
