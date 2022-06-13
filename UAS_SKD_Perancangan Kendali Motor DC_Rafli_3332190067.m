%%RAFLI 3332190067
%%PROJECT AKHIR MATA KULIAH SISTEM KENDALI DIGITAL
%%SISTEM KENDALI MOTOR DC

%{
=====================DESKRIPSI SINGKAT PROJEK AKHIR========================
Pada project akhir ini, disimulasikan sebuah sistem kendali pada sebuah
motor DC yang dimodelkan pada sebuah fungsi alih dengan parameter tertentu
sebagai sebuah plant yang dikendalikan. Motor DC disimulasikan berbeban.
Sistem kendali motor DC ini menggunakan sebuah kontroller PID, yang dimana 
berfungsi mengendalikan output dari motor DC terhadap efek pembebanan dengan
mengunakan sistem kendali feedback yang akan memperhitungkan seberapa besar 
daya yang harus diaksikan oleh motor DC.

Sistem kendali pada simulasi ini menggunakan optmisasi kestabilan dengan 
metode Root Locus untuk mencari pole dan zero sistem kendalinya.
===========================================================================
%}

%%MEMODELKAN MOTOR DC DENGAN FUNGSI ALIH
%Parameter motor DC
R = 0.2; %Hambatan Armature Motor
j = 5.4*10^-5; %Rapat arus medan 
f = 4*10^-4; %Gaya putar rotor
k = 6*10^-5; %Konstanta
kb = 5.5*10^-2; %Konstanta Medan Magnet
la = 0; %
km = k/(R*f)+(k*kb); %Konstanta Rotor
tm =(R*j)/(R*f)+(k*kb); %Konstanta Stator

%Dimodelkan dengan fungsi alih
num =[km];
den=[tm 1];
step(num,den);
title('Respon Sistem Motor DC Tanpa Kontroller [RAFLI 33321190067]');
grid on

%Mencari pole dan zero dengan root locus
num =[km];
den=[tm 1];
rlocus(num,den);
title('Pole dan Zero Motor DC [RAFLI 33321190067]');

%Memasukkan pole dan zero yang didapat pada kontrolloer PID
Kp = 350;
Ki = 300;
Kd = 5500;
num = [Kd Kp Ki];
den = [1 10+Kd 20+Kp Ki];
t = 0:0.01:2;
step(num,den,t);
title('Respon Sistem Menggunakan Kontroller [RAFLI 33321190067]');
