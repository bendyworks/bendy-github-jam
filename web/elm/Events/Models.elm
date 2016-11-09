module Events.Models exposing (..)

import Players.Models exposing (Inventory)

import Dict

type alias Event =
  { title: String
  , id: Int
  , body: String
  , from: Int
  , to: Int
  , onBefore: Inventory -> Inventory
  , onAfter: Inventory -> Inventory
  }

type alias EventDict = Dict.Dict Int Event

idFn : Inventory -> Inventory
idFn inv = inv

initialEventList : List Event
initialEventList =
  let
    inventoryFn inventory = { inventory | rubies = inventory.rubies + 1}
  in
    [
    { title = "A transition"
    , body = "You gained a rubies by transitioning through this event!"
    , id = 0
    , from = 0
    , to = 1
    , onBefore = inventoryFn
    , onAfter  = idFn
    },
    { title = "Another transition"
    , body = "Yay! it worked again!"
    , id = 1
    , from = 1
    , to = 2
    , onBefore = idFn
    , onAfter = idFn
    },
    { title = "The Last Event"
    , body = "OK now its gonna loop back to the start"
    , id = 2
    , from = 2
    , to = 0
    , onBefore = idFn
    , onAfter = idFn
    }
    ]

emptyEvent : Event
emptyEvent =
  { title = "Missing Event"
  , body = "Its missing!"
  , id = -1
  , from = 1
  , to = 0
  , onBefore = idFn
  , onAfter = idFn
  }

initialEvents : Dict.Dict Int Event
initialEvents =
  Dict.fromList
  <| List.map (\event -> (event.id, event)) initialEventList

eventForId : Dict.Dict Int Event -> Int -> Event
eventForId eventDict id =
  let
    fetched = Dict.get id eventDict
  in
    case fetched of
      Just event -> event
      Nothing -> emptyEvent
