module Models exposing (..)

import Dict
import Storylets.Models exposing (Storylet, initialStorylets)

type Activity =
  Game
  | BendyRealm

type alias Inventory = {rubies: Int}


type alias Model = {activity: Activity
                    , inventory: Inventory
                    , currentStorylet: Int
                    , storylets: Dict.Dict Int Storylet
                  }

initModel : Model
initModel = { activity = BendyRealm
            , inventory = { rubies = 1}
            , currentStorylet = 0
            , storylets = initialStorylets
            }
