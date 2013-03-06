//
//  Absentees_Reminder.m
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Absentees_Reminder.h"
#import "Email.h"
#import "Client_Relation.h"
#import "SendMail.h"
@implementation Absentees_Reminder
@synthesize catchArray;



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger) tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
	
	return [catchArray count];
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	
	static NSString *CellIdentifier = @"Cell";
   // UIImageView *cellImg = [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,300, 40)] autorelease];
    //[cellImg setImage:[UIImage imageNamed:@"DireCellImage.png"]];
    
     //CellIdentifier=@"";
    
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];		
       // [cell.contentView addSubview:cellImg];  
        
	}
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14];
    cell.textLabel.font=[UIFont boldSystemFontOfSize:14];
    
    
	cell.textLabel.text = [(NSDictionary *)[catchArray objectAtIndex:indexPath.row]valueForKey:@"name"];

    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.imageView.image=[UIImage imageNamed:@"unselected.png"];
    
    if(selectall==1)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.imageView.image=[UIImage imageNamed:@"selected.png"];
        
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        cell.imageView.image=[UIImage imageNamed:@"unselected.png"];
        
    }
	return cell;
	
}
-(void)viewWillAppear:(BOOL)animated{
    arrlistemail=[[NSMutableArray alloc]init];
    objdatabase=[[DataBase alloc]init];
    
	
	//arr1=[[NSArray alloc]initWithObjects:@"Kartik",@"Arora",nil];
	self.title=@"Birthday Reminder";
	//self.navigationController.navigationBarHidden = YES;
	
	//tblnamelist.editing=TRUE;
	lbldscr.text=@"Select those who you wish to send a Reminder. Once completed, Select, ''Done''. ";
	
	objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
	[objappdel createEditableCopyOfDatabaseIfNeeded];
	
	
	[self showdata];
	

}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
	self.navigationController.navigationBar.hidden=TRUE;
		
	
}


-(void)showdata{
	
    
       
    
    self.catchArray=[[NSMutableArray alloc]init];
		
	NSDate *now1 = [NSDate date];
	
    NSString *strBdayrem;
    strBdayrem=[[NSUserDefaults standardUserDefaults]valueForKey:@"EmailReminder"];
    
    NSDate *earlierDate1;
    
    
    
    
    if ([strBdayrem isEqualToString:@"Off"]) {
       earlierDate1=[now1 dateByAddingTimeInterval:(-30*24*60*60)];
    }
    
 
    else if ([strBdayrem isEqualToString:@"After 30 days"]) {
        earlierDate1= [now1 dateByAddingTimeInterval:(-30*24*60*60)];
    }
    else if ([strBdayrem isEqualToString:@"After 60 days"]) {
        earlierDate1= [now1 dateByAddingTimeInterval:(-60*24*60*60)];
    }
    else if ([strBdayrem isEqualToString:@"After 90 days"]) {
        earlierDate1= [now1 dateByAddingTimeInterval:(-90*24*60*60)];
    }
    else if ([strBdayrem isEqualToString:@"After 120 days"]) {
        earlierDate1= [now1 dateByAddingTimeInterval:(-120*24*60*60)];
    }
   
    else{
        earlierDate1= [now1 dateByAddingTimeInterval:(-30*24*60*60)]; 
    }
	

    
    
    
	
	//nslog(@"%@",earlierDate);
	
	
	
	NSString *strDate = [[NSString alloc] initWithFormat:@"%@",earlierDate1];
	NSArray *arr = [strDate componentsSeparatedByString:@" "];
	NSString *str;
	str = [arr objectAtIndex:0];
    
    [strDate release];
 
    NSString *condition=[NSString stringWithFormat:@"where LastServiceList <'%@'",str];
    
    [objdatabase ShowDataForClientname:condition];
    [self.catchArray addObjectsFromArray:objdatabase.catchArray];
    

    
	//nslog(@"strdate: %@",str); // strdate: 2011-02-28
	
		
}

-(IBAction)buttonClicked1:(id)sender{
		
	
		
		
	if(seg.selectedSegmentIndex==0){
        if([self.catchArray count]>0)
        {
        for (int  i=0; i<[catchArray count]; i++) {
            
            [arrlistemail addObject:[(NSDictionary *)[self.catchArray objectAtIndex:i]valueForKey:@"email"]];
            
            
            
            
            
        }        
            selectall=1;
            [tblnamelist reloadData];
            
    }
        else{
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Error" message:@"No Data Are available" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert1 show];
            [alert1 release];
            
            
        }
    }
        
      	
	else {
        selectall=0;
        [arrlistemail   removeAllObjects];
        
        [tblnamelist reloadData];
        
	}
	
}
-(IBAction)buttonClicked2:(id)sender{

    [self.navigationController popViewControllerAnimated:YES];
    
}
-(IBAction)selectAll:(id)sender{
	
//	MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
//	controller.mailComposeDelegate = self;
//	[controller setSubject:@"My Subject"];
//	[controller setMessageBody:@"Hello there." isHTML:NO]; 
//	if (controller) [self presentModalViewController:controller animated:YES];
//	[controller release];
    
    
    
    if([arrlistemail count]>0)
    {
        NSString *stremails;
        stremails=@"";
        NSString *strname;
        strname=@"";
        
        for (int  i=0; i<[arrlistemail count]; i++) {
            stremails    =[stremails stringByAppendingFormat:@"%@,",[arrlistemail objectAtIndex:i]];
            
            strname=[strname stringByAppendingFormat:@"%@,",[[catchArray objectAtIndex:i]valueForKey:@"name"]];
            
                     
            
            
        }
        
        if ( [ stremails length] > 0 )
        {
            stremails = [ stremails substringToIndex:[ stremails length] - 1];
        }
        
        
        if ( [ strname length] > 0 )
        {
            strname = [ strname substringToIndex:[ strname length] - 1];
        }
        objappdel.ClientNameForEmail=strname;
        
    objappdel.strselect=@"Absentees";
        objappdel.strMessage=stremails;
        
        if(objSendMail)
        {
            [objSendMail release];
            
        
        }
        
        objSendMail=[[SendMail alloc]initWithNibName:@"SendMail" bundle:nil];
    [self.navigationController pushViewController:objSendMail animated:YES];
            
        
        
        
        
        
    }
    else{
        
        
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Error" message:@"No Data Are available" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert1 show];
        [alert1 release];
        
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.imageView.image==[UIImage imageNamed:@"selected.png"])
    {
        cell.imageView.image=[UIImage imageNamed:@"unselected.png"];

        if ([arrlistemail containsObject:[(NSDictionary *)[self.catchArray objectAtIndex:indexPath.row]valueForKey:@"email"]]) {
            [arrlistemail removeObject:[(NSDictionary *)[self.catchArray objectAtIndex:indexPath.row]valueForKey:@"email"]];
          
        }
        
    }
    else {
        cell.imageView.image=[UIImage imageNamed:@"selected.png"];

        if ([arrlistemail containsObject:[(NSDictionary *)[self.catchArray objectAtIndex:indexPath.row]valueForKey:@"email"]]) 
        {
            
        }else{
            [arrlistemail addObject:[(NSDictionary *)[self.catchArray objectAtIndex:indexPath.row]valueForKey:@"email"]];
            
        }
        
    }
	
}

- (void)mailComposeController:(MFMailComposeViewController*)controller  
          didFinishWithResult:(MFMailComposeResult)result 
                        error:(NSError*)error;
{
	if (result == MFMailComposeResultSent) {
		//nslog(@"It's away!");
	}
	[self dismissModalViewControllerAnimated:YES];
}



/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];

	[arrclient release];
	
	[temp release];
	[catchArray release];

}


@end
