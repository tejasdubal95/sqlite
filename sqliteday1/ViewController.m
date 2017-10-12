//
//  ViewController.m
//  sqliteday1
//
//  Created by Felix-ITS 004 on 06/10/17.
//  Copyright © 2017 sonal. All rights reserved.
//

#import "ViewController.h"
#import "Directory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self createDatabase];
    NSString *selectQuery=@"select taskId,taskName from taskTable";
    
    
    [[Directory getSharedObject]getAllTasks:selectQuery];
    if([Directory getSharedObject].taskNameArray.count >0)
    {
        self.taskTableView.delegate=self;
        self.taskTableView.dataSource=self;
    }
    NSLog(@"task Name array contains %@",[Directory getSharedObject].taskNameArray);
    
    //Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Directory getSharedObject].taskNameArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:nil];
    cell.detailTextLabel.text= [[Directory getSharedObject].taskNameArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [[Directory getSharedObject].taskIdArray objectAtIndex:indexPath.row];
    
    NSLog(@"%@",[[Directory getSharedObject].taskNameArray objectAtIndex:indexPath.row]);
    //cell.detailTextLabel.text=@"honey";
    return cell;
}

- (IBAction)Search:(id)sender {

}
@end
