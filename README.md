* installed haskell for windows from [here](https://www.haskell.org/platform/windows.html)
* using IntelliJ with plugin [haskforce](https://github.com/carymrobbins/intellij-haskforce)
* need to create a CabalRun config (described [here](https://github.com/carymrobbins/intellij-haskforce/issues/240))

* Got inspiration from [haskell-project-skeleton](http://taylor.fausak.me/2014/03/04/haskeleton-a-haskell-project-skeleton/)

## Usage with cabal

    cabal run

## Usage
    
    ghci
    :load test/TestMarsRover.hs src/Directions.hs src/Rover.hs
    runTestTT tests
