prompt = {'Sampling Frequency','Start of time scale','End of time scale','number of breakpoints'}; %contents of dialouge
data = str2double(inputdlg (prompt,'ex',[1 30; 1 30; 1 30;1 30])); %holds frequency , start,end,no of bps

fs = data(1);
st = data(2);
et = data (3);
ts = 1/fs;
n = data (4);
sig = st:ts:et;
index = 1;
for i = 1:n+1
    t1 = input('enter the start of the signal: ');
    t2 = input('enter the end of the signal: ');
    type = input('enter the type of the signal: ','s');
    
    x = t1:ts:t2;
    ns = length(x);
    switch type
        % DC Signal
        case 'a'
            amp = input('enter the amplitude of the signal: ');
            y = amp * ones(1,length(x));
        
        % Ramp Signal
        case 'b'
            slope = input('enter the slope of the signal: ');
            inter = input('enter the intercept of the signal: ');
            y = slope * x + inter;
            
        
        % General Order Polynomial    
        case 'c'
            amp = input('enter the amplitude of the signal: ');
            pow = input('enter the power of the signal: ');
            inter = input('enter the intercept of the signal: ');
            y = amp * (x.^pow) + inter;
        
        % Exponential Signal
        case 'd'
            amp = input('enter the amplitude of the signal: ');
            exponential = input('enter the exponent of the signal: ');
            y = amp * exp(x*exponential);
            
        % Sinusoidal Signal
        case 'e'
            amp = input('enter the amplitude of the signal: ');
            f = input('enter the frequency of the signal: ');
            p = input('enter the phase of the signal: ');
            y = amp * sin(2*pi*f*x + p);
            
    end
    sig(index:index + ns - 1) = y;
    index = ns;
    plot(x,y);
    grid on
    hold on        
end
xlim([st et]);
while true
    operation_inq = input('do you want to do operation?','s');
    switch operation_inq
        %if Yes
        case 'y'
            operation_t = input('enter the type of operation','s');
            switch operation_t
                %Amplitude Scaling
                case 'a'
                    scale = input ('enter scale value: ');
                    y = y*scale;
                %Time Reverse
                case 'b'
                    x = x*-1;
                %Time shift
                case 'c'
                    shift_value = input('enter shift value: ');
                    x = t1-shift_value:ts:t2-shift_value;
                %Time Expantion
                case 'd'
                    expanding_value = input('enter expanding value: ');
                    x = x * expanding_value;
                %Time Compression
                case 'e'
                    compression_value = input('enter compression value: ');
                    x= x/compression_value;
            end
            figure; plot (x,y);
        %NO OPERATIONS WANTED 
        case 'n'
            break;
    end
end
