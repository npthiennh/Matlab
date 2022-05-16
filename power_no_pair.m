function [] = power_no_pair(nums)

    global Users;
    
    % Phan bo cong suat
%     a = [0.0025, 0.005, 0.01, 0.015, 0.02, 0.025, 0.03, 0.035, 0.04, 0.0475, 0.0525, 0.0575, 0.065, 0.07, 0.075, 0.08, 0.085, 0.09, 0.095, 0.1];
    a = zeros(nums,1);
        for m = 1:nums
            if m == nums
                    a(m) = 1 - sum(a(1:m-1));
            else
                    a(m) = (1 - sum(a(1:m-1)))*3/4;
            end
        end 
        
    pathloss = [Users.pathloss];
    
    for u = 1: length(a)
        [m,i] = max(pathloss);
        Users(i).a0pair = a(length(a)+1-u);
        pathloss(i) = 0;
    end
    
end