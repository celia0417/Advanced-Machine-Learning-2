% Creates a plot comparing two eigenvalue spectrums
function plotCompareEigSpectrums(oEigs, mveEigs, figureNum);
    figure(figureNum);
    clf;
    subplot(2,1,1);
    bar(oEigs);
    title('Original Eigenvalues');
    subplot(2,1,2);
    bar(mveEigs);
    title('Eigenvalues after MVE');
