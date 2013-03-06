//
//  ReportHomeScreen.m
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ReportHomeScreen.h"

#import"HomeDire.h"
#import "Client_Relation.h"

@implementation ReportHomeScreen

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationController.navigationBar.hidden=TRUE;
	
}
-(void)viewWillAppear:(BOOL)animated    {

    totalYearAmt=0;
    totalMonthAmt=0;
    totalDayAmt=0;
    totalWeakAmt=0;
    totalDayAmtPos=0;
    totalYearAmtPos=0;
    totalMonthAmtPos=0;
    totalWeakAmtPos=0;
    FinalDayAmtPos=0;
    FinalYearAmtPos=0;
    FinalMonthAmtPos=0;
    FinalWeakAmtPos=0;
    self.navigationController.navigationBarHidden=TRUE;
    
    objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
    [objappdel  createEditableCopyOfDatabaseIfNeeded];
    
    
    objdatabase=[[DataBase alloc] init];
    
    [self Showdata];
    
}
-(void)Showdata{
    arrList=[[NSMutableArray alloc]init];
    //for year
    
    NSDate *nowyear = [NSDate date];
	
	NSDate *earlierDateyear = [nowyear dateByAddingTimeInterval:(-365*24*60*60)];
	
	
	NSString *strDateyear = [NSString stringWithFormat:@"%@",earlierDateyear];
	NSArray *arryear = [strDateyear componentsSeparatedByString:@" "];
	NSString *stryear;
	stryear = [arryear objectAtIndex:0];
    
    NSArray *arrdateyear;
    arrdateyear=[stryear componentsSeparatedByString:@"-"];
    
    
    NSString *currentYear121;
    currentYear121=[arrdateyear objectAtIndex:0];
    
    
    //for month
    
    NSDate *nowmonth = [NSDate date];
	
	NSDate *earlierDatemonth = [nowmonth dateByAddingTimeInterval:(-30*24*60*60)];
	
	
	NSString *strDatemonth = [NSString stringWithFormat:@"%@",earlierDatemonth];
	NSArray *arrmonth = [strDatemonth componentsSeparatedByString:@" "];
	NSString *strmonth;
	strmonth = [arrmonth objectAtIndex:0];
    
    NSArray *arrdatemonth;
    arrdatemonth=[strmonth componentsSeparatedByString:@"-"];
    
    NSString *currentMonth121;
    currentMonth121=[arrdatemonth objectAtIndex:1];
    
    NSString *stryearforprevmonth;
    stryearforprevmonth=[arrdatemonth objectAtIndex:0];
    
    
    //for day possitive nagative
    
    NSDate *now121 = [NSDate date];
	
	NSDate *earlierDate121 = [now121 dateByAddingTimeInterval:(-1*24*60*60)];
	
	
	NSString *strDate121 = [NSString stringWithFormat:@"%@",earlierDate121];
	NSArray *arr1121 = [strDate121 componentsSeparatedByString:@" "];
	NSString *str121;
	str121 = [arr1121 objectAtIndex:0];
    
    NSArray *arrdate121;
    arrdate121=[str121 componentsSeparatedByString:@"-"];
    
    
    NSString *currentDay121;
    currentDay121=[arrdate121 objectAtIndex:2];
    
    
    
    NSString *currentDaymonth;
    currentDaymonth=[arrdate121 objectAtIndex:1];
    
    NSString *currentDayyear;
    currentDayyear=[arrdate121 objectAtIndex:0];
    
    
    
    
    //for tpday date
    NSDate *now = [NSDate date];
	
	NSDate *earlierDate = now;
	
	//nslog(@"%@",earlierDate);
	
	
	
	NSString *strDate = [[NSString alloc] initWithFormat:@"%@",earlierDate];
	NSArray *arr = [strDate componentsSeparatedByString:@" "];
    
    
    
	NSString *str;
	str = [arr objectAtIndex:0];
    NSArray *arrdate;
    arrdate=[str componentsSeparatedByString:@"-"];
    
    NSString *currentYear;
    currentYear=[arrdate objectAtIndex:0];
    
    NSString *currentMonth;
    currentMonth=[arrdate objectAtIndex:1];
    
    NSString *currentDay;
    currentDay=[arrdate objectAtIndex:2];
    
    
    
    
    
    [strDate release];
    
    [objdatabase ShowDataForServiceDetails:@""];
    [arrList addObjectsFromArray:objdatabase.catchArray];
    for(int i=0;i<[arrList count];i++)
    {
        
        NSString *strdatabasedate;
        strdatabasedate=[[arrList objectAtIndex:i] valueForKey:@"date"];
        
        
        
        NSArray *arrdate1;
        arrdate1=[strdatabasedate componentsSeparatedByString:@"-"];
        
        NSString *currentYear1;
        currentYear1=[arrdate1 objectAtIndex:0];
        
        NSString *currentMonth1;
        currentMonth1=[arrdate1 objectAtIndex:1];
        
        NSString *currentDay1;
        currentDay1=[arrdate1 objectAtIndex:2];
        
        
        if([currentYear isEqualToString:currentYear1])
        {
            
            
           
            totalYearAmt=totalYearAmt+[[[arrList objectAtIndex:i] valueForKey:@"price"] intValue];
            
        }
        
        if([currentYear1 isEqualToString:currentYear121])
        {
            
            totalYearAmtPos=totalYearAmtPos+[[[arrList objectAtIndex:i] valueForKey:@"price"] intValue];
            
        }
        
        
        
        
        
      
        if([currentMonth isEqualToString:currentMonth1])
        { 
            if([currentYear isEqualToString:currentYear1])
            {
                
           
            
            totalMonthAmt=totalMonthAmt+[[[arrList objectAtIndex:i] valueForKey:@"price"] intValue];
             
            } 
        }
        
        if([currentMonth1 isEqualToString:currentMonth121])
        {
            if([currentYear1 isEqualToString:stryearforprevmonth])
            {
            
            totalMonthAmtPos=totalMonthAmtPos+[[[arrList objectAtIndex:i] valueForKey:@"price"] intValue];
            }
        }
       
        
        if([currentDay isEqualToString:currentDay1])
        {  
            
            
            if([currentMonth isEqualToString:currentMonth1])
        { 
            if([currentYear isEqualToString:currentYear1])
            {
                totalDayAmt=totalDayAmt+[[[arrList objectAtIndex:i] valueForKey:@"price"] intValue];
                
                
            } 
        }

            
             
        }
        if([currentDay1 isEqualToString:currentDay121])
            
                 {
            if([currentMonth1 isEqualToString:currentDaymonth])
            {
                if([currentYear1 isEqualToString:currentDayyear])
                {
            
                    totalDayAmtPos=totalDayAmtPos+[[[arrList objectAtIndex:i] valueForKey:@"price"] intValue];
                    
                
                }
            }
            
        }
        
    }
    
    
  //  NSLog(@"Day%dMonth%dYear%d",totalDayAmt,totalMonthAmt,totalYearAmt);
    
    
    
    
    //for weak total 
    
    // preivious 7 date str
    
    NSDate *now12 = [NSDate date];
	
	NSDate *earlierDate12 = [now12 dateByAddingTimeInterval:(-6*24*60*60)];
	
	
	NSString *strDate12 = [NSString stringWithFormat:@"%@",earlierDate12];
	NSArray *arr112 = [strDate12 componentsSeparatedByString:@" "];
	NSString *str12;
	str12 = [arr112 objectAtIndex:0];
    
    NSString *condition;
    condition=[NSString stringWithFormat:@"where Date<='%@' And Date >'%@'",str,str12];
    
    [objdatabase ShowDataForServiceDetails:condition];
    [arrList removeAllObjects];
    
    
    [arrList addObjectsFromArray:objdatabase.catchArray];
    
    for(int i=0;i<[arrList count];i++)
    {
        
        totalWeakAmt=totalWeakAmt+[[[arrList objectAtIndex:i] valueForKey:@"price"] intValue];
        
        
    }      
    
    
    
    //for prev. weak total
    
  	NSDate *earlierDate3 = [earlierDate12 dateByAddingTimeInterval:(-6*24*60*60)];
	
	
	NSString *strDate3 = [NSString stringWithFormat:@"%@",earlierDate3];
	NSArray *arr3 = [strDate3 componentsSeparatedByString:@" "];
	NSString *str3;
	str3 = [arr3 objectAtIndex:0];
    
    NSString *condition3;
    condition3=[NSString stringWithFormat:@"where Date<='%@' And Date >'%@'",str12,str3];
    
    [objdatabase ShowDataForServiceDetails:condition3];
    [arrList removeAllObjects];
    
    
    [arrList addObjectsFromArray:objdatabase.catchArray];
    
    for(int i=0;i<[arrList count];i++)
    {
        
        totalWeakAmtPos=totalWeakAmtPos+[[[arrList objectAtIndex:i] valueForKey:@"price"] intValue];
        
        
    }      

    
    //  NSString *s = [NSString stringWithFormat:@"select * from AddClient where Date<'%@' And Date >'%@'",str1,str];
    
    
    
    
    FinalDayAmtPos=totalDayAmt-totalDayAmtPos;
    
    FinalMonthAmtPos=totalMonthAmt-totalMonthAmtPos;
    
    FinalYearAmtPos=totalYearAmt-totalYearAmtPos;
    
    
    
    FinalWeakAmtPos=totalWeakAmt-totalWeakAmtPos;
    
    
    if(FinalWeakAmtPos>0)
    {
        colorweak=[UIColor greenColor];
        strFinalWeakAmtPos=[NSString stringWithFormat:@"+$%d",FinalWeakAmtPos];
        
        
    }
    else{
        colorweak=[UIColor redColor];
        FinalWeakAmtPos=FinalWeakAmtPos * -1;
        
        strFinalWeakAmtPos=[NSString stringWithFormat:@"-$%d",FinalWeakAmtPos];
        
    }
    
    
    
if(FinalDayAmtPos>0)
{
    colorday=[UIColor greenColor];
    strFinalDayAmtPos=[NSString stringWithFormat:@"+$%d",FinalDayAmtPos];
    
    
}
else{
    colorday=[UIColor redColor];
    FinalDayAmtPos=FinalDayAmtPos * -1;
    
    strFinalDayAmtPos=[NSString stringWithFormat:@"-$%d",FinalDayAmtPos];
       
}
    
    if(FinalMonthAmtPos>0)
    {
        strFinalMonthAmtPos=[NSString stringWithFormat:@"+$%d",FinalMonthAmtPos];
        
        colormonth=[UIColor greenColor];
        
    }
    else{
        
        FinalMonthAmtPos=FinalMonthAmtPos * -1;
        
        strFinalMonthAmtPos=[NSString stringWithFormat:@"-$%d",FinalMonthAmtPos];
        
        colormonth=[UIColor redColor];
        
        
    }
    if(FinalYearAmtPos>0)
    {
        strFinalYearAmtPos=[NSString stringWithFormat:@"+$%d",FinalYearAmtPos];
        
        coloryear=[UIColor greenColor];
        
    }
    else{
        
        
        FinalYearAmtPos=FinalYearAmtPos * -1;
        
        strFinalYearAmtPos=[NSString stringWithFormat:@"-$%d",FinalYearAmtPos];
        
        coloryear=[UIColor redColor];
        
        
    }

    
    [strFinalDayAmtPos retain];
    
    [strFinalMonthAmtPos retain];
     [strFinalYearAmtPos retain];
    
    [tblReport reloadData];
    

}
-(IBAction)back{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

-(NSInteger) tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
	if (section==0) {
        
    
    return 4;
    }
    else{
    
    
        return 5;
        
    }

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section  {
    
 if(section==0)
 {
     return @"Sales by Period with details like";
     
 }
 else{
     return @"Sales in Graph for";
 
 
 }
    
    
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];		
	    
        
        
        
        CGRect nameLabelRect = CGRectMake(150,15,100,20);
		UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];		
		nameLabel.tag=kNameValueTag1;
		nameLabel.backgroundColor=[UIColor clearColor];
		
		nameLabel.textAlignment = UITextAlignmentLeft;
		nameLabel.font = [UIFont fontWithName:@"Arial" size:14];
        
		[cell.contentView addSubview: nameLabel];
		[nameLabel release];
        
        
        
	}
    UILabel *name = (UILabel *)[cell.contentView viewWithTag:kNameValueTag1];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14];
    name.font = [UIFont fontWithName:@"Arial" size:14];
    name.font=[UIFont boldSystemFontOfSize:14];
    cell.textLabel.font=[UIFont boldSystemFontOfSize:14];
    
    if(indexPath.section==0)
    {
   // cell.backgroundColor=[UIColor clearColor];
        
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text=@"Day";
          
            name.text=[NSString stringWithFormat:@"$%d",totalDayAmt];
            
            CustomBadge *customBadge1 = [CustomBadge customBadgeWithString:[NSString stringWithFormat:@"%@",strFinalDayAmtPos]withStringColor:[UIColor blackColor] 
                                                            withInsetColor:colorday 
                                                            withBadgeFrame:YES 
                                                       withBadgeFrameColor:[UIColor whiteColor] 
                                                                 withScale:1.2
                                                               withShining:YES];		
            
            [customBadge1 setFrame:CGRectMake(200, 10, customBadge1.frame.size.width, customBadge1.frame.size.height)];
            [cell.contentView addSubview:customBadge1];

            break;
        case 1:
             cell.textLabel.text=@"Week";
            name.text=[NSString stringWithFormat:@"$%d",totalWeakAmt];
           
            CustomBadge *customBadge5 = [CustomBadge customBadgeWithString:[NSString stringWithFormat:@"+$%d",FinalWeakAmtPos]withStringColor:[UIColor blackColor] 
                                                            withInsetColor:colorweak 
                                                            withBadgeFrame:YES 
                                                       withBadgeFrameColor:[UIColor whiteColor] 
                                                                 withScale:1.2
                                                               withShining:YES];		
            
            [customBadge5 setFrame:CGRectMake(200, 10, customBadge5.frame.size.width, customBadge5.frame.size.height)];
            [cell.contentView addSubview:customBadge5];

            break;
        case 2:
             cell.textLabel.text=@"Month";
           name.text=[NSString stringWithFormat:@"$%d",totalMonthAmt];
           
            CustomBadge *customBadge2 = [CustomBadge customBadgeWithString:[NSString stringWithFormat:@"%@",strFinalMonthAmtPos]withStringColor:[UIColor blackColor] 
                                                            withInsetColor:colormonth 
                                                            withBadgeFrame:YES 
                                                       withBadgeFrameColor:[UIColor whiteColor] 
                                                                 withScale:1.2
                                                               withShining:YES];		
            
            [customBadge2 setFrame:CGRectMake(200, 10, customBadge2.frame.size.width, customBadge2.frame.size.height)];
            [cell.contentView addSubview:customBadge2];

            break;
        case 3:
            cell.textLabel.text=@"Year";
          name.text=[NSString stringWithFormat:@"$%d",totalYearAmt];
            CustomBadge *customBadge3 = [CustomBadge customBadgeWithString:[NSString stringWithFormat:@"%@",strFinalYearAmtPos]withStringColor:[UIColor blackColor] 
                                                            withInsetColor:coloryear    
                                                            withBadgeFrame:YES 
                                                       withBadgeFrameColor:[UIColor whiteColor] 
                                                                 withScale:1.2
                                                               withShining:YES];		
            
            [customBadge3 setFrame:CGRectMake(200, 10, customBadge3.frame.size.width, customBadge3.frame.size.height)];
            [cell.contentView addSubview:customBadge3];

            break;
            
        default:
            break;
    }
    
    }
    else{
        switch (indexPath.row) {
            case 0:
                 cell.textLabel.text=@"1 Month";
                break;
            case 1:
                 cell.textLabel.text=@"3 Months";
                break;
            case 2:
                 cell.textLabel.text=@"6 Months";
                break;
            case 3:
                 cell.textLabel.text=@"1 Year";
                break;
            case 4:
                cell.textLabel.text=@"2 Years";
                break;
 
            default:
                break;
        }
   
        
    
    
    }
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {

    if(indexPath.section==1)
    {
    if(objbarchart)
    {
        
        [objbarchart release];
        
        
    }
        
        switch (indexPath.row) {
            case 0:
              objappdel.strSelectedreport=@"1 Month";
                break;
            case 1:
                              objappdel.strSelectedreport=@"3 Months";
                break;
            case 2:
                              objappdel.strSelectedreport=@"6 Months";
                break;
            case 3:
                              objappdel.strSelectedreport=@"1 Year";
                break;
            case 4:
                              objappdel.strSelectedreport=@"2 Years";
                break;
                
            default:
                break;
        }
        

	objbarchart =[[CPTTestAppBarChartController alloc]initWithNibName:@"BarChart" bundle:nil];
    [self.navigationController pushViewController:objbarchart animated:YES];
    }
    
}
-(IBAction)Settings{

    
    if(objSettingHome)
    {
        
        [objSettingHome release];
        
        
    }
    
    
    
    
	objSettingHome =[[SettingHome alloc]initWithNibName:@"SettingHome" bundle:nil];
    [self.navigationController pushViewController:objSettingHome animated:YES];
    
    


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
}


@end
