import("stdfaust.lib");

// x = a number between 0 and 1. f = frequency of the motion
Bernoulli(x) = x : \(n,y).((y*2)+n)~_ : \(z).(z-int(z));
sine(ph) = sin(ph * 2 * ma.PI);
random(seed) = abs( (int(seed+1) * 1103515245)/2147483647.0 );
factor = .0099480;
voices = 16;
process =   par( i, voices, Bernoulli(random(i) * factor) ) :> (*,*) 
                : \(B1sum,B2sum).( sine(B1sum/voices), sine(B2sum/voices) );
