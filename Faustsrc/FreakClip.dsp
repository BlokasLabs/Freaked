import("filter.lib");

//Distortion Algorithm
Distort = _/Drive:((_*Delay:_@1:_)-_~_)
with {
Delay=hslider("Delay",0.996, 0, 0.999, 0.01):smooth(0.999);
Drive=hslider("Drive",1, 1, 9.9, 0.1):max(1):min(9.9):_-10:_*-1:smooth(0.999);
};

//Threshhold

Thresh=_:max(clip:_*-1):min(clip*1)
with
{
clip=hslider("Clip", 1, 0, 1, 0.001):smooth(0.999);
//sord=checkbox("edge or middle clip"):_*2:_-1;

};


process = (_<:(_,Distort):_+_):Thresh:dcblocker;
