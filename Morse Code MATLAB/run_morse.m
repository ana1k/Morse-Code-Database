%% Load Data
load codebook.mat

%% Set up morse code sequence
num_iter = 10000;
target_code = data(:,1);
Xdata = zeros(num_iter,64);
Ydata = zeros(num_iter,1);
[pre_out,numchar] = size(data);
noise_level = 1;

for i = 1:num_iter
    n = randi(pre_out);
    Ydata(i) = n;
    temp = [];
    for k = 2:numchar
            num_space = randi([1,3]);
            switch data{n,k}
                case 'dot'
                    num_dig = randi([1,3]);
                    temp = [temp, normrnd(12,4/3,[1,num_dig]),zeros(1,num_space)];
                case 'dash'
                    num_dig = randi([4,9]);
                    temp = [temp, normrnd(12,4/3,[1,num_dig]),zeros(1,num_space)];
            end
    end
    Xdata(i,1:length(temp)) = temp;
    Xdata(i,:)=Xdata(i,:)+normrnd(0,noise_level,[1,64]);
end
