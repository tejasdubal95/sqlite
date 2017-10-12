//
//  Directory.m
//  sqliteday1
//
//  Created by Student P_10 on 12/10/17.
//  Copyright © 2017 sonal. All rights reserved.
//

#import "Directory.h"
#import <sqlite3.h>

@implementation Directory


+(instancetype)getSharedObject
{
    Directory static *sharedObject;
    if(sharedObject == nil)
    {
        sharedObject = [[Directory alloc]init];
    }
    return sharedObject;
}




-(void)createDatabase
{
    NSString *createQuery=@"create table if not exists taskTable(taskId text,taskName text)";
    BOOL success=[self executeQuery:createQuery];
    if(success)
    {
        NSLog(@"Table created");
    }
}

-(NSString *)getDatabasePath
{
    NSArray *docArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath=[[docArray firstObject]stringByAppendingString:@"/myTaskDatabase.db"];
    //NSString *docPath=[NSString stringWithFormat:@"%@/myTaskDatabase.db",[docArray lastObject]];
    NSLog(@"%@",docPath);
    return docPath;
}

-(void)getAllTasks:(NSString *)query;

{
    self.taskNameArray=[[NSMutableArray alloc]init];
    self.taskIdArray=[[NSMutableArray alloc]init];
    sqlite3_stmt *statement;
    const char *cQuery=[query UTF8String];
    const char *databasePath=[[self getDatabasePath] UTF8String];
    if(sqlite3_open(databasePath,&taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&statement,NULL)==SQLITE_OK)
        {
            while(sqlite3_step(statement)==SQLITE_ROW)
            {
                unsigned const char *tName=sqlite3_column_text(statement,1);
                NSString *tasknm=[NSString stringWithFormat:@"%s",tName];
                [self.taskNameArray addObject:tasknm];
                
                unsigned const char *tId=sqlite3_column_text(statement,0);
                NSString *taskId=[NSString stringWithFormat:@"%s",tId];
                [self.taskIdArray addObject:taskId];
                
            }
            
        }
        else
        {
            NSLog(@"%s in sqlite prepare v2",sqlite3_errmsg(taskDatabase));
            
        }
    }
    else
    {
        NSLog(@"%s in sqlite opening database",sqlite3_errmsg(taskDatabase));
    }
    sqlite3_finalize(statement);
    sqlite3_close(taskDatabase);
    
}

-(BOOL)executeQuery:(NSString *)query
{
    BOOL success=0;
    sqlite3_stmt *statement;
    const char *cQuery=[query UTF8String];
    const char *databasePath=[[self getDatabasePath] UTF8String];
    if(sqlite3_open(databasePath,&taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&statement,NULL)==SQLITE_OK)
        {
            if(sqlite3_step(statement)==SQLITE_DONE)
            {
                success=1;
            }
            else
            {
                NSLog(@"%s in sqlite step",sqlite3_errmsg(taskDatabase));
            }
        }
        else
        {
            NSLog(@"%s in sqlite prepare v2",sqlite3_errmsg(taskDatabase));
            
        }
    }
    else
    {
        NSLog(@"%s in sqlite opening database",sqlite3_errmsg(taskDatabase));
        
    }
    sqlite3_finalize(statement);
    sqlite3_close(taskDatabase);
    return success;
}



@end
