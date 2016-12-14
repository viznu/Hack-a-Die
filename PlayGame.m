function PlayGame

%create a new figure
RGB  = imread('factory.jpg')
warning('off', 'Images:initSize:adjustingMag');

%take input value from user
x = inputdlg('Enter network configuration number:','haxx0r',[1 10]);
hack = str2double(x{:}); 
days = 0;
% nwlayer (Network Layer) is a 1D array with 6 elements each denoting the extent
% of exploitability of the layer which are as follows :
% Network Layer #1 - Server Firewall
% Network Layer #2 - Web Server Subnet
% Network Layer #3 - Internal Network Firewall
% Network Layer #4 - Internal Desktop Subnet
% Network Layer #5 - Internal Desktop Firewall Subnet
% Network Layer #6 - SCADA Firewall
% Network Layer #7 - SCADA Device Subnet
status = 'haxx0r Report\n\n'
ObjectivesCompleted = 0; 
AttemptsWindowPerDay = randi(2);
AttemptCount = 0;
BreachFlag = 0;
USBFlag = 0;

%Layer1Vulnerability(9) =  [ 'Missing patches',
 %                            'Weak or default passwords',
  %                           'Misconfigured firewall rulebases',
   %                          'Unvalidated Input'
    %                         'Broken Access Control',
     %                        'Broken Authentication and Session Management',
      %                       'Improper Error Handling',
       %                      'Malicious File Execution', 
        %                     'Insecure Direct Object Reference'
         %                    ];

while ObjectivesCompleted ~= 7
    AttemptCount = AttemptCount + 1;
    
    if(ObjectivesCompleted < 1)
            nwlayer(1) = randi(10);
            if(days ~= 0 )
                 hack  = randi(10);
            end 
            
    elseif(ObjectivesCompleted < 2)
            hack = randi(5);
            nwlayer(2)  = randi(5);
    
    elseif(ObjectivesCompleted < 3)
            hack = randi(7);
            nwlayer(3)  = randi(7);
    
    elseif(ObjectivesCompleted < 4)
            hack = randi(3);
            nwlayer(4)  = randi(3);
    
    elseif(ObjectivesCompleted < 5)
            hack = randi(3);
            nwlayer(5)  = randi(4);
    
    elseif(ObjectivesCompleted < 6)
            hack = randi(8)
            nwlayer(6)  = randi(8);
    
    else
            hack = randi(5)
            nwlayer(7)  = randi(5);
    end
    
    
    if(AttemptCount == AttemptsWindowPerDay)
        days = days +1;
        AttemptCount = 0;
        AttemptsWindowPerDay = randi(5);
    end

    DayString = strcat( 'Day- ',int2str(days));
    position = [22 22];  
    box_color = {'black'};
    RGB = insertText(RGB,position,DayString,'FontSize',20,'BoxColor',box_color,'BoxOpacity',0.5,'TextColor','white');
                    
    
    if hack == nwlayer(ObjectivesCompleted + 1)
            % draw graphics    
                ObjectivesCompleted =  ObjectivesCompleted + 1;    
                if( ObjectivesCompleted == 1)
                    risk = randi(100);
                    if(risk > 20)
                        RGB = insertShape(RGB,'line',[146 208 245 295],'LineWidth',5);
                        RGB = insertShape(RGB,'FilledCircle',[245 295 30],'Color', {'red'},'Opacity',0.8);
                        status = strcat(status,'Server Firewall Breached on Day-',' ',int2str(days),'\n');
                        RGB = insertText(RGB,[245 295],'Server Firewall Breached','FontSize',25,'BoxColor','black','BoxOpacity',0.5,'TextColor','white');
                    elseif(risk > 5)
                        RGB = insertShape(RGB,'FilledCircle',[185 138 60],'Color', {'yellow'},'Opacity',0.8);
                        RGB = insertShape(RGB,'line',[185 138 446 408],'LineWidth',5);
                        RGB = insertShape(RGB,'FilledCircle',[446 408 30],'Color', {'red'},'Opacity',0.8);
                        status = strcat(status,'Enterprise network exposed to the internet on Day-',' ',int2str(days),'\n');
                        ObjectivesCompleted =  5;
                        RGB = insertText(RGB,[446 408],'Enterprise network exposed to the internet','FontSize',25,'BoxColor','black','BoxOpacity',0.5,'TextColor','white');
                    else
                        RGB = insertShape(RGB,'FilledCircle',[1237 501 70],'Color', {'red'},'Opacity',0.8);
                        status = strcat(status,'Insider breach!! -> SCADA systems compromised by malicious USB introduced on Day-',' ',int2str(days),'\n');
                        RGB = insertText(RGB,[1237 501],'Insider breach!! -> SCADA systems compromised by malicious USB introduced','FontSize',25,'BoxColor','black','BoxOpacity',0.5,'TextColor','white');
                        USBFlag = 1;
                    end 
                    
                elseif(ObjectivesCompleted ==  2)
                    RGB = insertShape(RGB,'line',[245 295 398 316],'LineWidth',5);
                    RGB = insertShape(RGB,'FilledCircle',[398 316 30],'Color', {'red'},'Opacity',0.8);
                    status = strcat(status,'Internal Network Subnet Breached on Day-',' ',int2str(days),'\n');
                    RGB = insertText(RGB,[398 316],'Internal Network Subnet Breached','FontSize',25,'BoxColor','black','BoxOpacity',0.5,'TextColor','white');
                
                elseif(ObjectivesCompleted ==  3)
                    RGB = insertShape(RGB,'line',[398 316 400 315],'LineWidth',5);
                    RGB = insertShape(RGB,'FilledCircle',[400 315 30],'Color', {'red'},'Opacity',0.8);
                    status = strcat(status,'Internal Network Firewall Breached on Day-',' ',int2str(days),'\n');
                    RGB = insertText(RGB,[400 315],'Internal Network Firewall Breached','FontSize',25,'BoxColor','black','BoxOpacity',0.5,'TextColor','white');
               
                elseif(ObjectivesCompleted ==  4)
                    RGB = insertShape(RGB,'line',[400 315 446 408],'LineWidth',5);
                    status = strcat(status,'Internal Desktop Subnet Compromised on Day-',' ',int2str(days),'\n');
                    RGB = insertText(RGB,[423 463],'Internal Desktop Subnet Compromised','FontSize',25,'BoxColor','black','BoxOpacity',0.5,'TextColor','white');

                elseif(ObjectivesCompleted ==  5)
                
                    if( randi(50)  > 15)
                        RGB = insertShape(RGB,'FilledCircle',[446 408 30],'Color', {'red'}','Opacity',0.8);
                        status = strcat(status,'Internal Desktop Firewall Compromised on Day-',' ',int2str(days),'\n');
                        RGB = insertText(RGB,[446 408],'Internal Desktop Firewall Compromised','FontSize',25,'BoxColor','black','BoxOpacity',0.5,'TextColor','white');

                    else
                        RGB = insertShape(RGB,'FilledCircle',[437 457 40],'Color', {'red'}','Opacity',0.8);
                        status = strcat(status,'Social Engineered Insider Breach!!! -> IP 192.34.265.17 on Day-',' ',int2str(days),'\n');
                        RGB = insertText(RGB,[437 457],'Social Engineered Insider Breach!!!','FontSize',25,'BoxColor','black','BoxOpacity',0.5,'TextColor','white');
                        ObjectivesCompleted = 6;
                        BreachFlag = 1;
                    end
                    
                elseif(ObjectivesCompleted ==  6)
                    RGB = insertShape(RGB,'line',[446 408 861 471],'LineWidth',5);
                    RGB = insertShape(RGB,'FilledCircle',[861 471 30],'Color', {'red'},'Opacity',0.8);
                    RGB = insertText(RGB,[861 471],'SCADA Firewall Breached','FontSize',25,'BoxColor','black','BoxOpacity',0.5,'TextColor','white');
                    status = strcat(status,'SCADA Firewall Breached on Day-',' ',int2str(days),'\n');
                    if ( BreachFlag == 1)
                        ObjectivesCompleted = 7;
                    end
                    
                elseif(ObjectivesCompleted ==  7)
                    RGB = insertShape(RGB,'line',[903 471 1006 375],'LineWidth',5);
                    RGB = insertShape(RGB,'FilledCircle',[1006 375 30],'Color', {'red'},'Opacity',0.8);
                    status = strcat(status,'SCADA Device Subnet Breached on Day-',' ',int2str(days),'\n');
                    RGB = insertText(RGB,[1006 375],'SCADA Device Subnet Breached','FontSize',25,'BoxColor','black','BoxOpacity',0.5,'TextColor','white');
                    RGB = insertText(RGB,[423 463],'Hacked!','FontSize',70,'BoxColor','red','BoxOpacity',0.7,'TextColor','white');

                else
                %do nothing    
                end
    end
    
    figure,imshow(RGB)
    if(USBFlag == 1) 
        break;
    end
end

status = strcat(status,'Objective completed in ==',int2str(days),' ','days'); 
fid = fopen('Status.txt','wt');
fprintf(fid, status);
fclose(fid);