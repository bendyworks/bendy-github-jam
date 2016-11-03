module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model, Activity(..))
import Storylets.Models exposing (Storylet)

transition : Model -> Storylet -> Model
transition model storylet =
  let
    inventory = model.inventory
    newInventory = { inventory | rubies = inventory.rubies + storylet.rubies }
  in
    { model |
      inventory = newInventory
    , currentStorylet = storylet.id
   }

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    TransitionTo storylet ->
       ((transition model storylet), Cmd.none)

    SetActivity act ->
      ({ model | activity = act }, Cmd.none)

    Noop ->
       (model, Cmd.none)
