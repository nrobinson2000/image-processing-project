clc,close all,clear all;
fid0=fopen('data0.txt');
fid1=fopen('data1.txt');
fid2=fopen('data2.txt');
fid3=fopen('data3.txt');
fid4=fopen('data4.txt');
fid5=fopen('data5.txt');
fid6=fopen('data6.txt');
fid7=fopen('data7.txt');
fid8=fopen('data8.txt');
fid9=fopen('data9.txt');

[t0_1,N]=fread(fid0,[28 28]);
[t0_2,N]=fread(fid0,[28 28]);
[t0_3,N]=fread(fid0,[28 28]);
[t0_4,N]=fread(fid0,[28 28]);
[t0_5,N]=fread(fid0,[28 28]);

[t1_1,N]=fread(fid1,[28 28]);
[t1_2,N]=fread(fid1,[28 28]);
[t1_3,N]=fread(fid1,[28 28]);
[t1_4,N]=fread(fid1,[28 28]);
[t1_5,N]=fread(fid1,[28 28]);

[t2_1,N]=fread(fid2,[28 28]);
[t2_2,N]=fread(fid2,[28 28]);
[t2_3,N]=fread(fid2,[28 28]);
[t2_4,N]=fread(fid2,[28 28]);
[t2_5,N]=fread(fid2,[28 28]);

[t3_1,N]=fread(fid3,[28 28]);
[t3_2,N]=fread(fid3,[28 28]);
[t3_3,N]=fread(fid3,[28 28]);
[t3_4,N]=fread(fid3,[28 28]);
[t3_5,N]=fread(fid3,[28 28]);

[t4_1,N]=fread(fid4,[28 28]);
[t4_2,N]=fread(fid4,[28 28]);
[t4_3,N]=fread(fid4,[28 28]);
[t4_4,N]=fread(fid4,[28 28]);
[t4_5,N]=fread(fid4,[28 28]);

[t5_1,N]=fread(fid5,[28 28]);
[t5_2,N]=fread(fid5,[28 28]);
[t5_3,N]=fread(fid5,[28 28]);
[t5_4,N]=fread(fid5,[28 28]);
[t5_5,N]=fread(fid5,[28 28]);

[t6_1,N]=fread(fid6,[28 28]);
[t6_2,N]=fread(fid6,[28 28]);
[t6_3,N]=fread(fid6,[28 28]);
[t6_4,N]=fread(fid6,[28 28]);
[t6_5,N]=fread(fid6,[28 28]);

[t7_1,N]=fread(fid7,[28 28]);
[t7_2,N]=fread(fid7,[28 28]);
[t7_3,N]=fread(fid7,[28 28]);
[t7_4,N]=fread(fid7,[28 28]);
[t7_5,N]=fread(fid7,[28 28]);

[t8_1,N]=fread(fid8,[28 28]);
[t8_2,N]=fread(fid8,[28 28]);
[t8_3,N]=fread(fid8,[28 28]);
[t8_4,N]=fread(fid8,[28 28]);
[t8_5,N]=fread(fid8,[28 28]);

[t9_1,N]=fread(fid9,[28 28]);
[t9_2,N]=fread(fid9,[28 28]);
[t9_3,N]=fread(fid9,[28 28]);
[t9_4,N]=fread(fid9,[28 28]);
[t9_5,N]=fread(fid9,[28 28]);

figure(1);
subplot(2,3,1),imshow(t0_1);
subplot(2,3,2),imshow(t0_2);
subplot(2,3,3),imshow(t0_3);
subplot(2,3,4),imshow(t0_4);
subplot(2,3,5),imshow(t0_5);

figure(2);
subplot(2,3,1),imshow(DigitAligner(t1_1));
subplot(2,3,2),imshow(DigitAligner(t1_2));
subplot(2,3,3),imshow(DigitAligner(t1_3));
subplot(2,3,4),imshow(DigitAligner(t1_4));
subplot(2,3,5),imshow(DigitAligner(t1_5));

figure(3);
subplot(2,3,1),imshow(DigitAligner(t2_1));
subplot(2,3,2),imshow(DigitAligner(t2_2));
subplot(2,3,3),imshow(DigitAligner(t2_3));
subplot(2,3,4),imshow(DigitAligner(t2_4));
subplot(2,3,5),imshow(DigitAligner(t2_5));

figure(4);
subplot(2,3,1),imshow(DigitAligner(t3_1));
subplot(2,3,2),imshow(DigitAligner(t3_2));
subplot(2,3,3),imshow(DigitAligner(t3_3));
subplot(2,3,4),imshow(DigitAligner(t3_4));
subplot(2,3,5),imshow(DigitAligner(t3_5));

figure(5);
subplot(2,3,1),imshow(DigitAligner(t4_1));
subplot(2,3,2),imshow(DigitAligner(t4_2));
subplot(2,3,3),imshow(DigitAligner(t4_3));
subplot(2,3,4),imshow(DigitAligner(t4_4));
subplot(2,3,5),imshow(DigitAligner(t4_5));

figure(6);
subplot(2,3,1),imshow(DigitAligner(t5_1));
subplot(2,3,2),imshow(DigitAligner(t5_2));
subplot(2,3,3),imshow(DigitAligner(t5_3));
subplot(2,3,4),imshow(DigitAligner(t5_4));
subplot(2,3,5),imshow(DigitAligner(t5_5));

figure(7);
subplot(2,3,1),imshow(DigitAligner(t6_1));
subplot(2,3,2),imshow(DigitAligner(t6_2));
subplot(2,3,3),imshow(DigitAligner(t6_3));
subplot(2,3,4),imshow(DigitAligner(t6_4));
subplot(2,3,5),imshow(DigitAligner(t6_5));

figure(8);
subplot(2,3,1),imshow(DigitAligner(t7_1));
subplot(2,3,2),imshow(DigitAligner(t7_2));
subplot(2,3,3),imshow(DigitAligner(t7_3));
subplot(2,3,4),imshow(DigitAligner(t7_4));
subplot(2,3,5),imshow(DigitAligner(t7_5));

figure(9);
subplot(2,3,1),imshow(DigitAligner(t8_1));
subplot(2,3,2),imshow(DigitAligner(t8_2));
subplot(2,3,3),imshow(DigitAligner(t8_3));
subplot(2,3,4),imshow(DigitAligner(t8_4));
subplot(2,3,5),imshow(DigitAligner(t8_5));

figure(10);
subplot(2,3,1),imshow(DigitAligner(t9_1));
subplot(2,3,2),imshow(DigitAligner(t9_2));
subplot(2,3,3),imshow(DigitAligner(t9_3));
subplot(2,3,4),imshow(DigitAligner(t9_4));
subplot(2,3,5),imshow(DigitAligner(t9_5));

pause;
clc,close all,clear all;