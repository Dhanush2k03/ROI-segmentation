eyeim = imread("A05_2.jpg");
imshow(eyeim)
roi = drawpolygon;
BW = createMask(roi);

LAB = rgb2lab(eyeim);
a = LAB(:,:,2);
b = LAB(:,:,3);
aROI = a(BW);
bROI = b(BW);
meanROI = [mean(aROI) mean(bROI)];
distLab = sqrt((a - meanROI(1)).^2 + (b - meanROI(2)).^2);
imshow(distLab,[])
eyeimMask = distLab < 10;
LabEye  = imoverlay(eyeim,~eyeimMask,"k");
imshow(LabEye)