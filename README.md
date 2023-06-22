# SmallDEVS
This is experimental project to verify / proof the concept of SmallDEVS simulation library in Pharo. 
SmallDEVS originally implemented by Department of Intelligent Systems on FIT BUT (namely doc. Ing. Vladimír Janoušek, Ing. Elöd Kironský) - see [SmallDEVS - FIT VUT Brno](http://perchta.fit.vutbr.cz:8000/projekty/10)


## How to load the project
- Install [Pharo latest stable version](https://pharo.org/download) (Pharo 11) e.g. from command line `$ wget -O- https://get.pharo.org/64 | bash` 
- run in Playground:
```
Metacello new
 baseline: 'SmallDEVS';
 repository: 'github://bajger/SmallDEVS:main/src';
 load
```
