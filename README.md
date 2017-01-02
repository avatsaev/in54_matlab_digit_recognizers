Matlab Digits Recognizer 
===================


Trains itself on a sample (app.tif) using 2 different algorithms to recognise had written digits:

> app.tif
![enter image description here](http://i.imgur.com/LCpeH9e.png)


----------


Algorithm A, left/right profiles
-------------
Draws a numer of lines on left and right profiles of the digit, memorizes and averages the distances from margin to first black pixel:

![enter image description here](http://i.imgur.com/EhQagro.png)


Algorithm B, Batch Densities 
-------------

Divides the digit in a number of square batches and counts the number of black pixes inside each batch, then averages out the results and uses the data to recognize the input:

![enter image description here](http://i.imgur.com/6rCa1Ke.png)

