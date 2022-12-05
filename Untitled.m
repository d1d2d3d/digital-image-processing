 f="F:\作业\数字图像处理\图像上机资料\图像上机图片\Fig0207(a).tif"
function Z= intxform(s,map);
%指定任意灰度变换,用行向量map对图像s进行灰度变换
a=im2uint8(s);
z=linspace(0,1,numel(map))';
Z=interp1(z,map',a);
%整数
end 