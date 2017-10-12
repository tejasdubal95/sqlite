//
//  OperationsViewController.h
//  sqliteday1
//
//  Created by Student P_10 on 12/10/17.
//  Copyright © 2017 sonal. All rights reserved.
//

#import "ViewController.h"
#import "Directory.h"

@interface OperationsViewController : ViewController

{
    sqlite3 *taskDatabase;
}

@property (strong, nonatomic) IBOutlet UITextField *tf1;
@property (strong, nonatomic) IBOutlet UITextField *tf2;

- (IBAction)insert:(id)sender;
- (IBAction)update:(id)sender;
- (IBAction)delete:(id)sender;






@end
