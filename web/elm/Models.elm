module Models exposing (..)

import Dict
import Storylets.Models exposing (Storylet, initialStorylets)
import Players.Models exposing (Inventory)
import Events.Models as Events
import SharedModels exposing (StateType)

type Activity =
  Game
  | BendyRealm
  | Edit

type alias Model = {activity: Activity
                    , inventory: Inventory
                    , currentState: StateType
                    , storylets: Dict.Dict Int Storylet
                    , events: Dict.Dict Int Events.Event
                  }

initModel : Model
initModel = { activity = BendyRealm
            , inventory = { rubies = 1}
            , currentState = (SharedModels.Storylet 0)
            , storylets = initialStorylets
            , events = Events.initialEvents
            }
