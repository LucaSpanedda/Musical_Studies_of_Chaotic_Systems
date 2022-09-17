// import Standard Faust library
// https://github.com/grame-cncm/faustlibraries/
import("stdfaust.lib");


/*
One of the fundamental concepts of cybernetics and dynamical systems is feedback. 
It is the self-regulation mechanism by which a system at a present moment 
learns information from its past to compensate for it in the immediate future. 
We therefore speak of the circularity of events. 
In faust there are various methods to build functions in Feedback, 
I will illustrate some of them by reporting here some of these functions
*/

// Standard Method
process = 1 : - ~ _ > 0;

// FB via loop ~
Feedback(x) = loop ~ _ 
        with{
            loop(x) = x + 0, 0;
        };
//process = Feedbackwith;

// FB via Parallels loop ~
MultipleFeedback(x,y,z,w) = loop ~ si.bus(4) 
        with{
            loop(x,y,z,w) = x + 0, y + 0, z + 0, w + 0;
        };
//process = FeedbackwithPAR;

// FB via letrec environment
LetrecFeedback = x
    letrec{
        'x = (1 - y); 
        'y = sqrt(x);
    };
//process = LetrecFeedback;

// FB via modulo environment
//process = \(FB).(1+FB)~_ : sin;

// FB via Parallels Modulo (x,y,z,w)
//process = \(x,y,z,w).(1+x,2+y,3+z,4+w)~ si.bus(4);