f="F:\Pictures\W020140306329183319502.jpg";
% function pic=cut(f)
%用途：将图片车牌区域切割出来
%根据颜色来判断车牌区域，所以有很大局限性(应付作业），车不能和车牌一个颜色（只是不能完全相同，小差异可以通过调参区分
a=30;%判定为蓝色的标准。只有当蓝色分量，比红色和蓝色分量大那么多时认为该区域为蓝色,根据下面的输出结果进行调整
m=imread(f);
imshow(f);
imshow(m);
f=m;
% imshow(f);
% f=im2double(f);  
[y,x,z]=size(f);
%蓝色区域置白，其余区域置黑：
for i=1:y
    for j=1:x
        if((f(i, j, 3)-f(i,j,2)>a) && (f(i, j, 3)-f(i,j,1)>a))%满足条件为蓝色,既蓝色分量比
            for k=1:z
            f(i, j, k)=255;%蓝色区域置白色
            end
        else
            for k=1:z
            f(i, j, k)=0;%非蓝色区域置黑色
            end
        end
    end
end

%二值化
f1=rgb2gray(f);%转化为2维
f1=imbinarize(f1,0.5);  %f1=im2bw(f,0.5);%

%去除小的连通对象
f1=bwareaopen(f1,100);%去除比100小的蓝色区域，也就是说认为车牌大小至少为100

% 
% f1=edge(f1);
% figure,imshow(f1);
%寻找边界
%上下边界
x=[];
for i=1:size(f1,1)
        if( sum(f1(i,:))~=0)    %第一个不为0的行为边界
            x(1)=i;
            break;
        end
end

for i=0:size(f1,1)-1
        if(sum(f1(size(f1,1)-i,:))~=0)
            x(2)=size(f1,1)-i;
            break;
        end
end
%左右边界
for i=1:size(f1,2)
    if(sum(f1(:,i))~=0)%第一个不为0的行或列为边界
        x(3)=i;
        break;
    end
end
for i=0:size(f1,2)-1
    if(sum(f1(:,size(f1,2)-i))~=0)
        x(4)=size(f1,2)-i;
        break;
    end
end
size(f1)
 f1=m(x(1):x(2),x(3):x(4),:);
 figure,imshow(f1)



