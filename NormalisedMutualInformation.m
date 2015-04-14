 function nmi = NormalisedMutualInformation(im1, im2)

assert(numel(im1) == numel(im2));
[C1,~,indrow] = unique(im1(:));
[C2,~,indcol] = unique(im2(:));
%maps indices such that C(indrow(i))=im1(i)
%where C in im1 without repetitions (its unique elements)
%i.e. every indrow value corresponds to an intensity value (0-255)

jointHistogram = accumarray([indrow indcol], 1);
%adds one for every indrow=indcol
%one bin for every value in C1 and C2 per axis.
%not the same as actual intensity!

jointProb = jointHistogram / numel(indrow); %normalise

%Get rid of zeroes on jointProb
indNoZero = jointHistogram ~= 0;
jointProb1DNoZero = jointProb(indNoZero);

jointEntropy = -sum(jointProb1DNoZero.*log2(jointProb1DNoZero));

%find entropy of individual images
histogramImage1 = sum(jointHistogram, 1);
histogramImage2 = sum(jointHistogram, 2);

propImage1 = histogramImage1 / numel(indrow); %normalise
propImage2 = histogramImage2 / numel(indrow); %normalise

%Get rid of zeroes
indNoZeroIm1 = histogramImage1 ~= 0;
jointProb1DNoZeroIm1 = propImage1(indNoZeroIm1);
indNoZeroIm2 = histogramImage2 ~= 0;
jointProb1DNoZeroIm2 = propImage2(indNoZeroIm2);

entropyIm1 = -sum(jointProb1DNoZeroIm1.*log2(jointProb1DNoZeroIm1));
entropyIm2 = -sum(jointProb1DNoZeroIm2.*log2(jointProb1DNoZeroIm2));

nmi=(entropyIm1+entropyIm2)/jointEntropy;

