%% Polynomial Operations
%syms x 
%f(x) = 1-x^2; 
%g(x) = 1+x ; 
%h(x) = f(x)/g(x) ;
f = @(x) 1+x^2 ; 
g = @(x) 1-x ; 
h = @(x) f(x)*g(x) ; 
solve(h(x))
simplify(h(x))

a = [9,-5,3,7];
b = [6,-1,2];
mul = conv(a,b);
[q,r] = deconv(a,b);

disp(mul);
disp(q);
disp(r);

%% Compass , Stem , and Stairs Plots 
th = linspace(0, 2*pi, 8 );
r  = linspace(0,5,8);
[u,v] = pol2cart(th,r);
disp(u)
disp(v)
%compass(u,v)
%stem(u,v)
%stairs(u,v)
bar(u,v)
%title("Compass Plot")

%% Mesh , Surface, and Contour Plots 
    
    x = linspace(-1, 1, 10);
    y = linspace(-2*pi, 2*pi, 10);
    [X, Y] = meshgrid(x, y);
    %disp(X)
    %disp(z(X,Y))
    z=@(x,y) exp(x+1i*y);
    
    mesh(X, Y, real(z(X,Y)));
    %surf(X, Y, real(z(X,Y)))
    %contour(X, Y, real(z(X,Y)));


    %% Ellipsoid 
    x = linspace(-1,1,50);
    y = linspace(-2,2,50);
    [X,Y] = meshgrid(x,y);
    figure;
    z = @(X,Y) sqrt(1 - X.^2 - Y.^2/4);
    surf(X,Y,real(z(X,Y)));
    hold on;
    surf(X,Y,-1*real(z(X,Y)));
    axis equal;


    %% Mesh Grid 
    x = linspace(1,10,10) ;
    y = linspace(1,10,10) ;
    [X,Y] = meshgrid(x,y) ; 
    z = @(x,y) (x.*y).*(x^2 - y^2)./(x^2 + y^2) ;
    mesh(X,Y,real(z(X,Y)));
    xlabel('x-axis')

    %% Pie Chart 
   X = [5 10 7 15] ; 
   labels= {'George', 'Sam', 'Betty' , 'Charlie'} ;
   pie(X, explode,'%.3f%%') ; 
   
    %% Polar Plot 
    x = linspace(0,10,30) ; 
    v = @(t) 10*exp((-0.2+1i*pi).*t);
    polarplot(angle(v(x)), abs(v(x)))

    
    %% Taylor Exponentiation 
    prompt = "Enter the value of n :" ;
n = input(prompt) ; 
prm = "Enter the value of x : " ;
x = input(prm);

sum = ones(n,1);
for i = 1:n 
    for j = 1:i 
        sum(i) = sum(i) + x^j/factorial(j) ;
    end
end

y = zeros(n) ;
for k = 1:n
    y(k) = exp(x) - sum(k);
end

t = 1:n ; 
plot(t,y, "r-", LineWidth = 2)


%% Divided Differences 
x = [3.2 2.7 1.0 4.8 5.6];
y = [22.0 17.8 14.2 38.3 51.7];

difference = y ; 
n = length(x)  ; 
for i =2:n 
    temp = difference ; 
    for j = i:n 
        difference(j) = (temp(j) - temp(j-1))/(x(j)- x(j-(i-1))) ; 
    end
end
disp(difference)


%% Interpolated Surface 
x = linspace(-1,1,20); 

y = linspace(-1,1,20);
[X,Y] = meshgrid(x,y) ; 
z = @(x,y) 3./(1+x.^2 +y.^2) ;
surf(X,Y,real(z(X,Y)));

%% Lagrangian Polynomial 
sum = 0 ; 
prompt1 = "Take the domain vector: " ;
prompt2 = "Take the range  vector: " ;
domain = input(prompt1) ;
range  = input(prompt2) ;
n = length(domain) ; 
for i = 1:n 
    p = 1 ; 
    for j = 1:n 
        if i~=j
            c = poly(domain(j))/(domain(i)-domain(j)) ; 
            p = conv(p,c);
        end
    end
    term = p*range(i);
    sum = sum + term ; 
end
disp(sum) 
%% Lagrangian Measure of Error
sum = 0 ; 
prompt1 = "Take the domain vector: " ;
prompt2 = "Take the range  vector: " ;
domain = input(prompt1) ;
range  = input(prompt2) ;
n = length(domain) ; 
for i = 1:n 
    p = 1 ; 
    for j = 1:n 
        if i~=j
            c = poly(domain(j))/(domain(i)-domain(j)) ; 
            p = conv(p,c);
        end
    end
    term = p*range(i);
    sum = sum + term ; 
end
disp(sum) 

t=linspace(0,0.2,21);
plot(t,polyval(sum,t))
error=1;
for i=1:n
error=error*(abs(0.15-x(i)));
end
error=error/factorial(n+1);
disp(error)


    %% Ribbons 
    t = linspace(0, 5*pi, 100); 
    y1 = sin(t);
    y2 = exp(-0.15*t) .* sin(t);
    y3 = exp(-0.8*t) .* sin(t);
    figure(1)
    ribbon(t,y1);
    hold on
    ribbon(t,y2);
    ribbon(t,y3);
    hold off

    %% Parametric Plot 
    t = linspace(0,1,100) ; 
    x =  t ;
    y =  t.^2 ; 
    z =  t.^3 ;
    plot3(x,y,z,LineWidth = 2)

    %% Filled Circle in 3D 
    theta = linspace(0,2*pi,100);
    x = cos(theta) ;
    y = sin(theta) ;
    z = 0.*theta ; 
    fill3(x,y,z, "cyan");
    %% System of Linear Equations 
    syms x1 x2 x3 

eqn1 = 7*x1 + x2 + 5*x3 == 27 ; 
eqn2 = 4*x1 + 3*x2 + 5*x3 == 21 ; 
eqn3 = 6*x1 + x2 + 2*x3 == 9 ; 

[A,B] = equationsToMatrix([eqn1, eqn2, eqn3], [x1,x2,x3])  ;
X = linsolve(A,B ) ;
disp(X)

%% Filled Circle 

theta = linspace(0,2*pi, 100);
x = cos(theta);
y = sin(theta) ;
fill(x,y,"cyan");

%% Using the fplot function 
f = @(x) 1/sqrt(x);
fplot(f,[10,100]);

%% Stems for 3D 
t = linspace(0,6*pi, 100);
x = t ; 
y = t.*sin(t);
z = exp(t/10) - 1 ;
stem3(x,y,z);

%% Different surf types 
x = linspace(-5,5,100) ; 
y = linspace(-5,5,100) ;
[X,Y] = meshgrid(x,y);
z = @(x,y) -cos(x).*cos(y).*exp((-sqrt((x^2 + y^2)/4))) ;
%surf(X,Y,real(z(X,Y)));
%surfc(X,Y,real(z(X,Y))); % has contour plots beneath the surface 
surfl(X,Y,real(z(X,Y)));  % has lines connecting the points 

%% Sphere 
x = linspace(-1,1,100);
y = linspace(-1,1,100);
[X,Y] = meshgrid(x,y) ;
figure(1)
z = @(x,y) sqrt(1-x.^2 - y.^2);

surf(X,Y,real(z(X,Y)));
hold on 
surf(X,Y,-real(z(X,Y)));
hold off 
axis equal 

%% Filled Triangles 
    vertices = [0, 0; 1, 0; 0.5, 1; 0.5, 0.5; 1.5, 0.5; 1, 1];
    x = vertices(:, 1);
    y = vertices(:, 2);
    figure;
    fill(x(1:3), y(1:3), 'blue');
    hold on;
    fill(x(4:6), y(4:6), 'red');
    axis equal;
    view(2)

%% Plot Complex
prompt = "Take the Complex Number Input: " ;
c = input(prompt);
real_part = real(c);
imag_part = imag(c);
plot(real_part, imag_part, 'o');
xlim([0,real_part+1]);
ylim([0,imag_part+1]);
hold on 
quiver(0, 0,real_part, imag_part, 'off');
hold off

%% Polynomial Expressions 
c = [0 1 3];
P = poly2sym(c);
disp(P);
syms x
f = x+3 ; 
p = sym2poly(f);
disp(p)

%% Compare Plots 
t = linspace(5,20,1000);
f = 100.*t.*t ; 
g = 10.*t.*t.*t ; 
plot(t,f, "r-");
hold on 
plot(t,g,"b-");
hold off 

%% Some Practice on Matrices 
A = [3 2 ; 2 3 ];
S = 1/sqrt(2) * A ; 
disp(S);
T = inv(A) ;
disp(T)
disp(det(A));

%% Plot Complex Functions 
v = @(t) 10*exp((-0.2+1i*pi).*t);
    x = linspace(0,10,20);
    plot(x, real(v(x)), 'o-', x, imag(v(x)), 's-');
    xlabel('x');
    ylabel('y');
    legend('Real Part', 'Imaginary Part');

%% Practice 
x = linspace(-1,1,20);
y = linspace(-2*pi, 2*pi, 20);
[X,Y] = meshgrid(x,y);
z = @(x,y) exp(x+1j*y);
figure(1)
surf(X,Y,real(z(X,Y)));

%% Using plot3 

v = @(t) 10*exp((-0.2 + 1j*pi).*t) ; 
x = linspace(0,10,20);
plot3(real(v(x)), imag(v(x)), x) ;


%% Kaneesha doing the same thing 
    v = @(t) 10*exp((-0.2+1i*pi).*t);
    x = linspace(0,10,100);
    plot3(real(v(x)), imag(v(x)), x);
    xlabel('Real Part');
    ylabel('Imaginary Part');
    zlabel('x');

    %ok got it my exponential function was improperly written 

    %% Plotting e^itheta in 2D 
    theta = linspace(0,2*pi, 100);
    x = cos(theta);
    y = sin(theta); 
    z = @(x,y) exp(x+1j*y) ;
    plot(theta, x, "r-", theta, y, "b-")

    %% Same in 3D 
    theta = linspace(0,2*pi, 100);
    x = cos(theta) ; 
    y = sin(theta) ;
    plot3(x,y,theta)

    %% Polar Plot 
    v = @(t) 10*exp((-0.2 + 1j*pi).*t) ; 
    x = linspace(0,10,100);
    polarplot(angle(v(x)), abs(v(x)));

    %% Difficult Mesh Grid 
    x = linspace(-10,10,100) ; 
    y = linspace(-10,10,100);
    [X,Y] = meshgrid(x,y);
    figure(1)
    z = @(x,y) (x.*y).*(x.^2 + y.^2)./(x.^2 + y.^2) ; 
    mesh(X,Y,real(z(X,Y)));


    %% Plot a cylinder of given formula 

    z = linspace(0,1,100) ; 
    theta = linspace(0,2*pi, 100);
    [Z,THETA] = meshgrid(z,theta);

    r = sin(3*pi.*Z) + 2 ; 

    X = r.*cos(THETA); 
    Y = r.*sin(THETA);
    Z = Z; 
    surf(X,Y,Z)
    %%
    function pendulum
    L = 1; 
    g = 9.81; 
    theta0 = pi/4; 
    dt = 0.01;
    t = 0:dt:10;

    theta = zeros(size(t));
    x = zeros(size(t));
    y = zeros(size(t));

    theta(1) = theta0;
    x(1) = L * sin(theta0);
    y(1) = -L * cos(theta0);

    figure;
    axis([-1.5*L 1.5*L -1.5*L 0.5*L]);
    axis equal;
    hold on;

% Plot initial position of pendulum
pendulum = plot(x(1), y(1), 'ro', 'MarkerSize', 10);

% Plot pendulum arm
arm = plot([0 x(1)], [0 y(1)], 'k', 'LineWidth', 2);

% Iterate over time steps and update pendulum position
for i = 2:length(t)
    % Update angular velocity using simple pendulum equation
    omega = sqrt(g / L);
    
    % Update angle using small angle approximation
    theta(i) = theta0 * cos(omega * t(i));
    
    % Update position of pendulum mass
    x(i) = L * sin(theta(i));
    y(i) = -L * cos(theta(i));
    
    % Update plot
    set(pendulum, 'XData', x(i), 'YData', y(i));
    set(arm, 'XData', [0 x(i)], 'YData', [0 y(i)]);
    
    % Pause to control animation speed
    pause(0.01);
end














    








    