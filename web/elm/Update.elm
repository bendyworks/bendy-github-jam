module Update exposing (..)

import Dict
import Messages exposing (Msg(..))
import Models exposing (Model, Activity(..))
import Storylets.Models exposing (Storylet, StoryDict, storyletForId)
import Events.Models exposing (Event)
import SharedModels exposing (StateType)
import Editor.Updates exposing (editUpdate)
import Editor.Models exposing (EditModel)


transitionToStorylet : Model -> Storylet -> Model
transitionToStorylet model storylet =
    let
        inventory =
            model.inventory

        newInventory =
            { inventory | rubies = inventory.rubies + 1 }
    in
        { model
            | inventory = newInventory
            , currentState = SharedModels.Storylet storylet.id
        }


transitionToEvent : Model -> Event -> Model
transitionToEvent model event =
    let
        inventory =
            model.inventory

        newInventory =
            { inventory | rubies = inventory.rubies - 1 }
    in
        { model
            | inventory = newInventory
            , currentState = SharedModels.Event event.id
        }


updateStorylet : EditModel -> StoryDict -> StoryDict
updateStorylet editModel storyletDict =
    let
        currentStorylet =
            storyletForId storyletDict editModel.currId

        newStorylet =
            { currentStorylet
                | title = editModel.title
                , body = editModel.body
            }
    in
        Dict.insert newStorylet.id newStorylet storyletDict


updateFromEditModel : Model -> Model
updateFromEditModel model =
    { model | storylets = updateStorylet model.editModel model.storylets }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TransitionToStorylet storylet ->
            ( (transitionToStorylet model storylet), Cmd.none )

        TransitionToEvent event ->
            ( (transitionToEvent model event), Cmd.none )

        SetActivity act ->
            ( { model | activity = act }, Cmd.none )

        EditAction act ->
            ( { model | editModel = editUpdate act model.editModel }, Cmd.none )

        UpdateFromEditModel ->
            ( (updateFromEditModel model), Cmd.none )

        Noop ->
            ( model, Cmd.none )
