function [ schedule_users ] = schedule_OMA(tti)

global P;


schedule_users = zeros(1, 2*P.Nt);  %....

index_start = mod((tti - 1) * 2*P.Nt + 1, P.nums);  %....
index_end = mod(tti *2* P.Nt, P.nums);  %....

if index_start < index_end
    range_users = index_start:1:index_end;
else
    range_users = [index_start:1:P.nums , 1:1:index_end];
end

for i = 1:1:length(schedule_users)
    schedule_users(i) = range_users(i);
end

end