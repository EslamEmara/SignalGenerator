prompt = {'Sampling Frequency','Start of time scale','End of time scale','number of breakpoints'}; %contents of dialouge
data = str2double(inputdlg (prompt,'ex',[1 30; 1 30; 1 30;1 30])); %holds frequency , start,end,no of bps
prompt = {};                                                       %the contents of dialouge 2
bp_length = zeros(data(4),2);                                      %initalize length of positions of bps
for i = 1:data(4)
    str = strcat(int2str(i),' breakpoint','at t= ');                
    prompt{end+1} = str;                                            %contents of dialouge 2 
    bp_length(i,[1,2]) = [1 30];                                    % max entery is 30 character 
end
positions = str2double(inputdlg(prompt,'breakpoints positions',bp_length)); 