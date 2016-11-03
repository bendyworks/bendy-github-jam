module Storylets.Models exposing (..)

import Dict

type alias Storylet = { title: String
                      , body: String
                      , choices: List Int
                      , rubies: Int
                      , id: Int
                      }

type alias StoryDict = Dict.Dict Int Storylet

introStorylet : Storylet
introStorylet =
  { title = "Hello"
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
  , choices = [1]
  , rubies = 0
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
  , choices = []
  , rubies = 1
  , id = 1
  }

emptyStorylet : Storylet
emptyStorylet =
  { title = "Blank (this shouldn't happen)"
  , body = "Seriously this is probs a bugx"
  , choices = []
  , rubies = 0
  , id = -1
  }

storyletForId : Dict.Dict Int Storylet -> Int -> Storylet
storyletForId storyletDict id =
  let
    fetched = Dict.get id storyletDict
  in
    case fetched of
      Just storylet -> storylet
      Nothing -> emptyStorylet

initialStorylets : Dict.Dict Int Storylet
initialStorylets =
  Dict.insert 1 demoNextStorylet
  <| Dict.insert 0 introStorylet Dict.empty

currentStorylet : Int -> Dict.Dict Int Storylet -> Maybe Storylet
currentStorylet id storyletDict =
  Dict.get id storyletDict
