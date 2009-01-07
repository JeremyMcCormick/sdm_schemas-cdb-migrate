
-- Created: 24 October 2008, R. Laher (laher@ipac.caltech.edu)


-- initialize sdqa_Metric table --

INSERT INTO sdqa_Metric (metricName, physicalUnits, dataType, definition)
VALUES ('nGoodPix', 'counts', 'f',    'Number of good pixels.')
      ,('nDeadPix', 'counts', 'f',    'Number of dead pixels.')
      ,('nHotPix' , 'counts', 'f',    'Number of hot pixels.')
      ,('nSpurPix', 'counts', 'f',    'Number of spurious pixels.')
      ,('nSatPix' , 'counts', 'f',    'Number of saturated pixels.')
      ,('nObjPix' , 'counts', 'f',    'Number of object-coverage pixels.')
      ,('nNanPix' , 'counts', 'f',    'Number of NaNed pixels.')
      ,('nDirtPix', 'counts', 'f',    'Number of pixels with filter dirt.')
      ,('nStarPix', 'counts', 'f',    'Number of star-coverage pixels.')
      ,('nGalxPix', 'counts', 'f',    'Number of galaxy-coverage pixels.')
      ,('nObjSex' , 'counts', 'f',    'Number of objects found by SExtractor.')
      ,('fwhmSex' , 'Arcsec', 't',    'SExtractor FWHM of PSF.')
      ,('gMean'   , 'D.N.'  , 't',    'Image global mean.')
      ,('gMedian' , 'D.N.'  , 't',    'Image global median.')
      ,('cMedian1', 'D.N.'  , 't',    'Image upper-left corner median.')
      ,('cMedian2', 'D.N.'  , 't',    'Image upper-right corner median.')
      ,('cMedian3', 'D.N.'  , 't',    'Image lower-right corner median.')
      ,('cMedian4', 'D.N.'  , 't',    'Image lower-left corner median.')
      ,('gMode'   , 'D.N.'  , 't',    'Image global mode.')
      ,('MmFlag'  , 'counts', 'i',    'Image global mode.')
      ,('gStdDev' , 'D.N.'  , 't',    'Image global standard deviation.')
      ,('gMAbsDev', 'D.N.'  , 't',    'Image mean absolute deviation.')
      ,('gSkewns' , 'D.N.'  , 't',    'Image skewness.')
      ,('gKurtos' , 'D.N.'  , 't',    'Image kurtosis.')
      ,('gMinVal' , 'D.N.'  , 't',    'Image minimum value.')
      ,('gMaxVal' , 'D.N.'  , 't',    'Image maximum value.')
      ,('pTile1'  , 'D.N.'  , 't',    'Image 1-percentile.')
      ,('pTile16' , 'D.N.'  , 't',    'Image 16-percentile.')
      ,('pTile84' , 'D.N.'  , 't',    'Image 84-percentile.')
      ,('pTile99' , 'D.N.'  , 't',    'Image 99-percentile.')
;



-- initialize sdqa_Threshold table --

SELECT addSdqaThresholdRecord('nGoodPix', \N   , 7500000) INTO @x;
SELECT addSdqaThresholdRecord('nDeadPix', 1000 , \N) INTO @x;
SELECT addSdqaThresholdRecord('nHotPix' , 1000 , \N) INTO @x;
SELECT addSdqaThresholdRecord('nSpurPix', 14000, \N) INTO @x;
SELECT addSdqaThresholdRecord('nSatPix' , 2500 , \N) INTO @x;
SELECT addSdqaThresholdRecord('nObjPix' , 70000, \N) INTO @x;
SELECT addSdqaThresholdRecord('nNanPix' , 1000 , \N) INTO @x;
SELECT addSdqaThresholdRecord('nDirtPix', 1000 , \N) INTO @x;
SELECT addSdqaThresholdRecord('nStarPix', \N   , 10) INTO @x;
SELECT addSdqaThresholdRecord('nGalxPix', \N   , 10) INTO @x;
SELECT addSdqaThresholdRecord('nObjSex' , \N   , 200) INTO @x;
SELECT addSdqaThresholdRecord('fwhmSex' , 6.2  , 4.4) INTO @x;
SELECT addSdqaThresholdRecord('gMean'   , 50000, 10) INTO @x;
SELECT addSdqaThresholdRecord('gMedian' , 50000, 0) INTO @x;
SELECT addSdqaThresholdRecord('cMedian1', 50000, 0) INTO @x;
SELECT addSdqaThresholdRecord('cMedian2', 50000, 0) INTO @x;
SELECT addSdqaThresholdRecord('cMedian3', 50000, 0) INTO @x;
SELECT addSdqaThresholdRecord('cMedian4', 50000, 0) INTO @x;
SELECT addSdqaThresholdRecord('gMode'   , 50000, -40) INTO @x;
SELECT addSdqaThresholdRecord('MmFlag'  , 2    , \N) INTO @x;
SELECT addSdqaThresholdRecord('gStdDev' , 1000 , 100) INTO @x;
SELECT addSdqaThresholdRecord('gMAbsDev', 50000, 10) INTO @x;
SELECT addSdqaThresholdRecord('gSkewns' , 200  , 10) INTO @x;
SELECT addSdqaThresholdRecord('gKurtos' , 50000, 10) INTO @x;
SELECT addSdqaThresholdRecord('gMinVal' , 50000, -32000) INTO @x;
SELECT addSdqaThresholdRecord('gMaxVal' , 74000, 10000) INTO @x;
SELECT addSdqaThresholdRecord('pTile1'  , 1000 , -1000) INTO @x;
SELECT addSdqaThresholdRecord('pTile16' , 20000, -100) INTO @x;
SELECT addSdqaThresholdRecord('pTile84' , 50000, 5) INTO @x;
SELECT addSdqaThresholdRecord('pTile99' , 70000, 20) INTO @x;



-- initialize sdqa_ImageStatus table --

INSERT INTO sdqa_ImageStatus (statusName, definition)
VALUES
   ('passedAuto'            , 'Image passed by automated SDQA.')
  ,('marginallyPassedAuto'  , 'Image marginally passed by automated SDQA.')
  ,('marginallyFailedAuto'  , 'Image marginally failed by automated SDQA.')
  ,('failedAuto'            , 'Image failed by automated SDQA.')
  ,('indeterminateAuto'     , 'Image is indeterminate by automated SDQA.')
  ,('passedManual'          , 'Image passed by manual SDQA.')
  ,('marginallyPassedManual', 'Image marginally passed by manual SDQA.')
  ,('marginallyFailedManual', 'Image marginally failed by manual SDQA.')
  ,('failedManual'          , 'Image failed by manual SDQA.')
  ,('indeterminateManual'   , 'Image is indeterminate by manual SDQA.')
;

