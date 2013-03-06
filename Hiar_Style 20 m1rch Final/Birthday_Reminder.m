//
//  Birthday_Reminder.m
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Birthday_Reminder.h"
#import "Email.h"
#import "SettingHome.h"
#import "Client_Relation.h"
#import "SendMail.h"

@implementation Birthday_Reminder
@synthesize catchArray;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger) tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
	
		return [self.catchArray count];
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	
	static NSString *CellIdentifier = @"Cell";
    //UIImageView *cellImg = [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,290, 40)] autorelease];
   // [cellImg setImage:[UIImage imageNamed:@"DireCellImage.png"]];
    

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];		
	 //   [cell.contentView addSubview:cellImg];  
        
         
	}
    cell.imageView.image=[UIImage imageNamed:@"unselected.png"];
    
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14];
    cell.textLabel.font=[UIFont boldSystemFontOfSize:14];
    
	cell.textLabel.text =[[self.catchArray objectAtIndex:indexPath.row]valueForKey:@"name"];
    
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
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
-(void)viewWillAppear:(BOOL)animated    {

    arr1=[[NSArray alloc]initWithObjects:@"Kartik",@"Arora",nil];
	self.title=@"Birthday Reminder";
	//self.navigationController.navigationBarHidden = YES;
    arrlistemail=[[NSMutableArray alloc]init];
  	//tblnamelist.editing=TRUE;
	self.navigationController.navigationBar.hidden=TRUE;
	
	objdatabase=[[DataBase alloc]init];
    
	lbldscr.text=@"Select those who you wish to send a Birthday greeting. Once completed, Select, ''Done''.";
	objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
	[objappdel createEditableCopyOfDatabaseIfNeeded];
	selectall=0;
    
	 
	[self showdata];
	

}
- (void)showReminder:(NSString *)text {
	
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Reminder" 
                                                        message:text delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
	
		
	
}


-(void)showdata{
	self.catchArray=[[NSMutableArray alloc]init];
    NSDate *earlierDate1;
    
    
	
	NSDate *now1 = [NSDate date];
	
    NSDate *now2 = [NSDate date];
    NSString *strBdayrem;
    strBdayrem=[[NSUserDefaults standardUserDefaults]valueForKey:@"BirthdayReminder"];
    if ([strBdayrem isEqualToString:@"Off"]) {
        earlierDate1= now1 ;
    }
    
    else if ([strBdayrem isEqualToString:@"At time of event"]) {
        earlierDate1= now1 ;
        
    }
    else if ([strBdayrem isEqualToString:@"1 day prior"]) {
        earlierDate1= [now1 dateByAddingTimeInterval:(+1*24*60*60)];
    }
    else if ([strBdayrem isEqualToString:@"2 days prior"]) {
        earlierDate1= [now1 dateByAddingTimeInterval:(+2*24*60*60)];
    }
    else if ([strBdayrem isEqualToString:@"1 week prior"]) {
        earlierDate1= [now1 dateByAddingTimeInterval:(+7*24*60*60)];
    }
    else if ([strBdayrem isEqualToString:@"2 weeks prior"]) {
        earlierDate1= [now1 dateByAddingTimeInterval:(+14*24*60*60)];
    }
    else if ([strBdayrem isEqualToString:@"3 weeks prior"]) {
        earlierDate1= [now1 dateByAddingTimeInterval:(+21*24*60*60)];
    }
    else if ([strBdayrem isEqualToString:@"4 weeks prior"]) {
        earlierDate1= [now1 dateByAddingTimeInterval:(+28*24*60*60)];
    }
    
    else{
    earlierDate1= now1 ;
    
    }
	
	//nslog(@"%@",earlierDate1);
	
	
	
	NSString *strDate1 = [NSString stringWithFormat:@"%@",earlierDate1];
	NSArray *arr11 = [strDate1 componentsSeparatedByString:@" "];
	NSString *str1;
	str1 = [arr11 objectAtIndex:0];
   
    NSString *strDate = [NSString stringWithFormat:@"%@",now2];
	NSArray *arr = [strDate componentsSeparatedByString:@" "];
	NSString *str;
	str = [arr objectAtIndex:0];

    NSString *condition=[NSString stringWithFormat:@"where Date<='%@' AND Date >= '%@'",str1,str];
    
    
    [objdatabase    ShowDataForClientname:condition];
    [self.catchArray addObjectsFromArray:objdatabase.catchArray];
    
  	[tblnamelist reloadData];
    
}

-(IBAction)buttonClicked1:(id)sender{
//
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
        [arrlistemail removeAllObjects];
        
        [tblnamelist reloadData];
        
        
        
	}

}
-(IBAction)selectAll:(id)sender{
   
    if([arrlistemail count]>0)
    {
        NSString *stremails;
        NSString *strname;
        strname=@"";
        
        stremails=@"";
        
        for (int  i=0; i<[arrlistemail count]; i++) {
           stremails    =[stremails stringByAppendingFormat:@"%@,",[arrlistemail objectAtIndex:i]];
            
            strname=[strname stringByAppendingFormat:@"%@,",[[self.catchArray objectAtIndex:i]valueForKey:@"name"]];
            

        }
        
        if ( [ stremails length] > 0 )
        {
           stremails = [ stremails substringToIndex:[ stremails length] - 1];
        }
        if ( [ strname length] > 0 )
        {
            strname = [ strname substringToIndex:[ strname length] - 1];
        }
    
    objappdel.strselect=@"Birthday";
        objappdel.strMessage=stremails;
        objappdel.ClientNameForEmail=strname;
        
    
        if(objsendmail)
        {
            [objsendmail release];
            
        
        }
        
        objsendmail=[[SendMail alloc]initWithNibName:@"SendMail" bundle:nil];
    		[self.navigationController pushViewController:objsendmail animated:YES];
    
    
    }
    else{
    
    
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Error" message:@"No Data Are available" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert1 show];
        [alert1 release];
        
    
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



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    
    
    
    
                  
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.imageView.image==[UIImage imageNamed:@"selected.png"])
    {
                              
        if ([arrlistemail containsObject:[(NSDictionary *)[self.catchArray objectAtIndex:indexPath.row]valueForKey:@"email"]]) {
            [arrlistemail removeObject:[(NSDictionary *)[self.catchArray objectAtIndex:indexPath.row]valueForKey:@"email"]];
            
            cell.imageView.image=[UIImage imageNamed:@"unselected.png"];
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


-(IBAction)back{

    [self.navigationController popViewControllerAnimated:YES];
 	

}
-(IBAction)settings{
	
	
	if(objSetting)
    {
        [objSetting release];
        
    
    }
	objSetting=[[SettingHome alloc]initWithNibName:@"SettingHome" bundle:nil];
    [self.navigationController pushViewController:objSetting animated:YES];
   	
}

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


	[arr1 release];
	
	[arrclient release];
	[temp release];
	[catchArray release];
}


@end
