clear all
tic
for n1=1 : 120
    u1 = 1;
    fi1 = 0/180*pi;
    f1 = 50 *2 * pi;
    u2 = 0.9;
    fi2 = rand * 2 * pi;
    T = 3;
    dt = 0.001;
    N1 = 400 + n1 * 10;
    N2 = 1000;
    NN1(n1) = N1*dt;
    N3 = round(T/dt);
    N = 400;
    t = 0 : 0.001 : T;
    Z1 = u1 * exp(i*(f1*t(1:N) + fi1));
    Z2 = u2 * exp(i*(f1*t(1:N) + fi2));
    Y = zeros(1,N3);
    Y(N1:N1+N-1)= Z1;
    Y(N2:N2+N-1)= Y(N2:N2+N-1) + Z2;
    C1 = (randn(1,N3)-0.5)*0.2;
    Y = Y + C1;
    subplot(2, 2, 1)
    plot(t(1:N3), real(Y))
    title('������')
    xlabel('����� � �')
    ylabel('��������')
    grid
    ZN = exp(i*f1*t(1:N));
    for n = 1 : N3 - N
        K(n) = n * dt;
        Y1(n) = Y(n:n+N-1)*ZN'/N;
    end
    subplot(2, 2, 2)
    plot(K, abs(Y1), K,real(Y1)) 
    title('�������������� �������')
    xlabel('����� � �')
    ylabel('��������')
    axis([0, 3, -1.5, 1.5])
    grid
    [S1, T1] = max(abs(Y1));
    TT1(n1) = (T1) * dt;
    S11(n1) = S1;
    Y1(T1-N/5:T1 + N/5) = 0;
    [S2, T2] = max(abs(Y1));
    TT2(n1) = (T2)*dt;
    S21(n1) = S2;
    subplot(2, 2, 3)
    plot(NN1, abs(S11), '.', NN1, abs(S21), '.')
    title('������ ��������� ��������')
    xlabel('����� ������� ������� � �')
    ylabel('��������')
    grid
    subplot(2, 2, 4)
    plot(NN1, TT1, '.', NN1, TT2, '.')
    title('������ ����� ����� �������')
    xlabel('����� � ���')
    ylabel('��������')
    grid
    pause(0.5)
end
toc
    
    