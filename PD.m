
function [w1,w2]= PD(w1,w2,S,e_plot)

%Ganancias proporcional y derivativa
eta1=0.1;
eta2=0.2;
e_old=0;

t=0.01;
N=S/t;

xi_plot=zeros(1,N);
xd_plot=zeros(1,N);
u_plot=zeros(1,N);
t_plot=t:t:S;
w_plot=zeros(2,N);


    
    xd
    
    e=xd-p;
    %parte proporcional
    x1=e;
    %parte derivativa
    x2=(e-e_old)/T;
    e_old=e;
    
    u=w1*x1+w2*x2;
    
    vi=vi+u*t;
    xi=xi+vi*t+0.5*u*t^2;
    
    %actualizacion de pesos
    w1=w1+eta1*u*x1;
    w2=w2*eta2*u*x2;
    
    %se aseguranq ue las ganacias sean positivas
    if w1<0
        w1=0;
    end
    
    if w2<0
        w2=0;
    end
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    xi_plot(i)=xi;
    xd_plot(i)=xd;
    u_plot(i)=u;
    w_plot(:,i)=[w1;w2];


figure
hold on
grid on
plot(t_plot,xd_plot,'r-','Linewidth',2)
plot(t_plot,xi_plot,'b-','Linewidth',2)
title('Seguimiento de trayectoria')
xlabel('t')
ylabel('x(t)')




