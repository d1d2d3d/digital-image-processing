
clear
x="F:\Pictures\1670158302181.jpg";
%一个简单的由图片生成扫描件的函数
%功能：图片增强，白底黑字
%实现思路：先将背景置为1 然后增强文字
r=100;              % 滤波器半径,根据字的粗细进行调整，字越大越大
f=(imread(x));
f=rgb2gray(f); 
f=im2single(f);
w1=fspecial('average',[r,r]);              % 均值滤波器
%w1=fspecial('gaussian',[r,r],10);           % 高斯滤波器尝试
avg=imfilter(f,w1);
%均值滤波时因为背景一大片连接在一起，除去均值滤波的结果可以让背景颜色接近1
f=f./avg; 
figure,imshow(f);
%简单模板有了，下面都是对该图片的降噪，增强等操作
%锐化
w2=fspecial('gaussian',[r,r],3);    % 高斯滤波器
f1=imfilter(f,w2);
f2=f-f1;
f2=f2*20;
a= abs(f-f1)<0.04;    % 按阈值筛选低对比度区域
dst =(f.*lowContrastMask+f2.*(~lowContrastMask)); % 原代码中copyTo函数的实现
res = im2uint8(dst);
figure,imshow(f2);
