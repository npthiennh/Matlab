% Title: 复现 paper

% 仿真参数
% BS
W = 2;  % 带宽 GHz
fc = 28;  % 频点 GHz
eta = 2;  % LOS
Nf = 10;  % 噪声系数
sigma = -174 + 10*log10(W) + Nf;  % 噪声
M = 2;
Pt = 20;  % TxPower dBm
K = 2;  % number of clusetes
% pcp
Rp = 5;  % m
Rc = 1;  % m
% User
Gamma_Qos = 0.02;
U = 8;
d = 10;
global Users;

% droping users based on PCP

for u = 1:U
    % mmWave Channel
    theta = 2*rand() - 1;  % (-1, 1)
    alpha = sqrt(sigma/2) * (randn() + 1i*randn());
    Q = 1;
    a_vec = zeros(M, 1);
    for i = 1:M
       a_vec(i, 1) = exp(-1i * pi * (i - 1) * theta);
    end
    a_vec = a_vec / sqrt(M);
    h_vec = a_vec * alpha / (sqrt(Q) * (1 + d^eta));
    Users(u).h_vec = h_vec;
    
end

% k-means user clustering

% beamforming

% power allocation

% calculate rate

figure; hold on;
axis square;
plot(P.cell_radius*exp(1i*(pi/3*(0:6))),'-.k','linewidth',2);
plot(0,'h', 'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'k', 'MarkerSize', 12);
colors = colormap(hsv(length(users_noma)/2));
shift = -10-10*1i;

for p = 1:length(Pairs)
    u1 = Pairs(p).pair(1);
    u2 = Pairs(p).pair(2);
    if u2 == 0
        coor = Users(u1).coor;
        plot(coor+shift, 'x', 'MarkerEdgeColor', 'k',...
            'MarkerFaceColor', 'k', 'MarkerSize', 8)
        text(real(coor),imag(coor),num2str(u1));
    else
        coor1 = Users(u1).coor;
        coor2 = Users(u2).coor;
        plot(coor1+shift, 'o', 'MarkerEdgeColor', 'k',...
            'MarkerFaceColor', colors(p,:), 'MarkerSize', 8)
        text(real(coor1),imag(coor1),num2str(u1));
        plot(coor2+shift, 'o', 'MarkerEdgeColor', 'k',...
            'MarkerFaceColor', colors(p,:), 'MarkerSize', 8)
        text(real(coor2),imag(coor2),num2str(u2));
    end
end
axis off;