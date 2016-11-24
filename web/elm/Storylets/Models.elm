module Storylets.Models exposing (..)

import Dict


type alias Storylet =
    { title : String
    , body : String
    , events : List Int
    , id : Int
    }


type alias StoryDict =
    Dict.Dict Int Storylet


introStorylet : Storylet
introStorylet =
    { title = "The Start"
    , body =
        """
### This is some intro text.

#### It should explain:
- You are a **BENDYWORKER**. Last of a dying breed of
console cowboys and netrunners, who eke out an existence cyberdiving
into the computational wilderness of 20XX
- With your **PAIR PROGRAMMING PARTNER** at your side, you must brave the
netscapes of the interway at **GREAT PERIL**.
- And then come back to the story mode framing interface and upgrade
your stats and such. **FOR GREAT JUSTICE**
- You shall **HACK** and/or **MOD** and/or **AUGMENT** and/or **:kanye:**
your bendyself to achieve **MAXIMUM FUNTIMES**
"""
    , events = [ 0 ]
    , id = 0
    }


demoNextStorylet : Storylet
demoNextStorylet =
    { title = "The Next Storylet"
    , body =
        """
### Yay! It works

#### Your `rubies` count has been incremented

Now to implement the actual game part...

I'm thinking
- Maybe a twin stick shooter or stealth-em-up?
- Or, somewhat easier and less fancy, something deterministic like [Desktop Dungeons](http://www.desktopdungeons.net/media/)

I'm also thinking about
- Loading storylets from the server rather than hardcoding them in elm
- How to actually structure the game choices / decision points
- The interaction between the embedded game and this surrounding "Choose your own adventure" layer
- Names. Names are hard.

"""
    , events = [ 1 ]
    , id = 1
    }


moreRubies : Storylet
moreRubies =
    { title = "Gain More Rubies"
    , body =
        """
### OK, here are some **MORE RUBIES**

What should they be for??

"""
    , events = [ 2 ]
    , id = 2
    }


fewerRubies : Storylet
fewerRubies =
    { title = "Lose Some Rubies"
    , body =
        """
### Oh No! A Bad Thing Has Happened

#### You have lost 1 Rubies!

And I didn't implement a 0 bound check! :o

"""
    , events = [ 0 ]
    , id = 3
    }


emptyStorylet : Storylet
emptyStorylet =
    { title = "Blank (this shouldn't happen)"
    , body = "Seriously this is probs a bugx"
    , events = []
    , id = -1
    }


storyletForId : Dict.Dict Int Storylet -> Int -> Storylet
storyletForId storyletDict id =
    let
        fetched =
            Dict.get id storyletDict
    in
        case fetched of
            Just storylet ->
                storylet

            Nothing ->
                emptyStorylet


initialStoryletList : List Storylet
initialStoryletList =
    [ introStorylet, demoNextStorylet, moreRubies, fewerRubies, emptyStorylet ]


initialStorylets : Dict.Dict Int Storylet
initialStorylets =
    Dict.fromList <|
        List.map (\storylet -> ( storylet.id, storylet )) initialStoryletList


currentStorylet : Int -> Dict.Dict Int Storylet -> Maybe Storylet
currentStorylet id storyletDict =
    Dict.get id storyletDict
