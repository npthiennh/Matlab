% ���ɴع��̷���
clear -global; clearvars; close all; clc;
% ������
lambda = 10;                       % �ܶ�
M = 0;
U = unifrnd(0,1);

while U >= exp(-lambda)           % �ж�����
    U = U*unifrnd(0,1);
    M = M + 1;
end

if M < 1
    M = 1;
end

L = 100;
a = 0;b = L;      % ȡ[0,100]*[0,100]*[0,100]�Ĳ�������
c = 0;d = L;
A = zeros(1,M);
B = zeros(1,M);
for i = 1:M
    U1 = unifrnd(0,1);
    A(i) = (b-a)*U1;
    U2 = unifrnd(0,1);
    B(i) = (d-c)*U2;
    plot(A(i),B(i),'r^');
    hold on;
end
grid on;

% �ӹ���
for j=1:M
    n = 5;
    r = 8;
    u1 = zeros(1,n);
    u2 = zeros(1,n);
    R = zeros(1,n);
    x = zeros(1,n);
    y = zeros(1,n);
    theta = zeros(1,n);
    
    for i = 1:n
        u1(i) = unifrnd(0,1);
    end
    
    R = r * sqrt(u1);
    R = sort(R);
    
    for i = 1:n
        u2(i) = unifrnd(0,1);
    end
    
    theta = 2*pi*u2;
    
    for i = 1:n
        x(i) = A(j) + R(i) * cos(theta(i));
        y(i) = B(j) + R(i) * sin(theta(i));
    end
    plot(x,y,'.b');
end

axis([-10,110,-10,110]);