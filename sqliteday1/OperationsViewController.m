//
//  OperationsViewController.m
//  sqliteday1
//
//  Created by Student P_10 on 12/10/17.
//  Copyright © 2017 sonal. All rights reserved.
//

#import "OperationsViewController.h"
#import "Directory.h"

@interface OperationsViewController ()

@end

@implementation OperationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)delete:(id)sender {
}

- (IBAction)update:(id)sender {
    //NSInteger a =[ _tf3.text  intValue];
    //    int id = [strid intValue];
    NSString *str = _tf2.text;
    NSString *updateQuery=[NSString stringWithFormat:@"update table1 set taskName = '%@' WHERE taskId=2",str];
    
    
    BOOL isSucess= [[Directory getSharedObject]executeQuery:updateQuery];
    if(isSucess && [Directory getSharedObject].taskNameArray.count >0)
    {
        NSString *selectQuery=@"select taskId,taskName from taskTable";
        
        
        [[Directory getSharedObject]getAllTasks:selectQuery];
        
        [self.taskTableView reloadData];
    }
    
    NSLog(@"%@",updateQuery);
}

- (IBAction)insert:(id)sender {
    
    NSString *insertQuery=[NSString stringWithFormat:@"insert into table1(taskId,taskName) values('%@','%@')",_tf1.text,_tf2.text];
    BOOL isSucess= [[Directory getSharedObject]executeQuery:insertQuery];
    if(isSucess && [Directory getSharedObject].taskNameArray.count >0)
    {
        NSString *selectQuery=@"select taskId,taskName from taskTable";
        
        
        [[Directory getSharedObject]getAllTasks:selectQuery];
        
        [self.taskTableView reloadData];
    }
    
    NSLog(@"%@",insertQuery);
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
