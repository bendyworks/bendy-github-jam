module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model, Activity(..))
import Storylets.Models exposing (Storylet)
import Events.Models exposing (Event)
import SharedModels exposing (StateType)
import Editor.Updates exposing (editUpdate)

transitionToStorylet : Model -> Storylet -> Model
transitionToStorylet model storylet =
  let
    inventory = model.inventory
    newInventory = { inventory | rubies = inventory.rubies + 1 }
  in
    { model |
      inventory = newInventory
    , currentState = SharedModels.Storylet storylet.id
   }

transitionToEvent : Model -> Event -> Model
transitionToEvent model event =
  let
    inventory = model.inventory
    newInventory = { inventory | rubies = inventory.rubies - 1 }
  in
    { model |
      inventory = newInventory
    , currentState = SharedModels.Event event.id
   }

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    TransitionToStorylet storylet ->
        ((transitionToStorylet model storylet), Cmd.none)

    TransitionToEvent event ->
        ((transitionToEvent model event), Cmd.none)

    SetActivity act ->
      ({ model | activity = act }, Cmd.none)

    EditAction act ->
      ({model | editModel = editUpdate act model.editModel}, Cmd.none)

    Noop ->
       (model, Cmd.none)
