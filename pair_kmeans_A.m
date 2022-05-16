function [ strong_users, users_noma, users_oma ] = pair_kmeans_A()

global P;
global Users;
global Pairs;
global Cluster;

% ���ѡ�� 1 ���û���Ϊ��ʼ���������
seed = randperm(P.nums, 1);
Cluster(1).centroid = Users(seed).h.';

% ����ÿ���û����������ĵ����ƶ�
for u = 1:P.nums
    hu = Users(u).h.';
    cos_vec = zeros(1, length(Cluster));
    selected_rate = zeros(1, P.nums);
    for c = 1:1:length(Cluster)
        hc = Cluster(c).centroid;
        cos_vec(c) = norm(hu*hc') / norm(hu) / norm(hc);
    end
    [~, index] = max(cos_vec(u,:));
    selected_rate(u) = cos_vec(index)^2;
    
    % ����û������ƶ���ߵ�����
    Cluster(index).fans = [Cluster(index).fans, u];
end

[~, next] = max(selected_rate);



% ���� Cluster ���� pair


end

