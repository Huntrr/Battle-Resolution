# DEBATE

## Battle Resolution

Gotta beat 'em all. A Pokemon-esque battle game where the Pokemon are famous political figures and Barlow Debaters, and the goal is to save Evan Streams from certain demise at the hands of the communists. Alternatively a neat framework for making Javascript-based Pokemon-esque battles.

## Building

Battle-Resolution is written with Coffeescript, Jade, and Stylus. Grunt is required to transpile the code. This is what you need to get everything up and running.

### Requirements

1. Node (any version should do, we really just need npm)

### Build Process

Building is easy once you have node. First, open terminal and *cd* on over to whatever directory you've cloned the project into. Then run

    npm install

That'll install Grunt and all the other utilities you need to transpile the code. After that's all set, run

    grunt

Which will spawn an instance of Grunt, and build the code into HTML/CSS/JS over in the *./build* directory. Grunt automatically watches *./src* for changes, so you can also simply use *grunt build* to build the code once and ignore updates to *./src*. Afterwards, it's just a matter of heading into *./build* and opening *index.html* however you like to do that thing. Have fun.
