* installed haskell for windows from [here](https://www.haskell.org/platform/windows.html)
* using IntelliJ with plugin [haskforce](https://github.com/carymrobbins/intellij-haskforce)
* need to create a CabalRun config (described [here](https://github.com/carymrobbins/intellij-haskforce/issues/240))

* Got inspiration from [haskell-project-skeleton](http://taylor.fausak.me/2014/03/04/haskeleton-a-haskell-project-skeleton/)
* and from this [gist](https://gist.github.com/Risto-Stevcev/a9798abc898fba99235b) to setup tests

## Run with cabal

    cabal run

## Tests with cabal

    cabal install --enable-tests
    cabal configure --enable-tests
    cabal test

## Tests with ghci
    
    ghci
    :load tests/MarsRoverTests.hs src/Directions.hs src/Rover.hs
    runTestTT tests
