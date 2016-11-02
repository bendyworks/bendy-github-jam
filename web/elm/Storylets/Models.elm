module Storylets.Models exposing (..)

import Dict

type alias Storylet = { title: String
                      , body: String
                      , choices: List Int
                      }

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
"""
  , choices = [1]
  }

emptyStorylet : Storylet
emptyStorylet =
  { title = "Blank (this shouldn't happen)"
  , body = "Seriously this is probs a bugx"
  , choices = [0]
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
  Dict.insert 0 introStorylet Dict.empty

currentStorylet : Int -> Dict.Dict Int Storylet -> Maybe Storylet
currentStorylet id storyletDict =
  Dict.get id storyletDict
