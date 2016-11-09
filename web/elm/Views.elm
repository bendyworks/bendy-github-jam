module Views exposing (..)

import Html exposing (div, text, button)
import Html.Events exposing (onClick)
import Models exposing (Model, Activity(..))
import Storylets.Views exposing (storyletDiv, eventDiv)
import Messages exposing (Msg(..))

import SharedModels exposing (StateType)

storyView : Model -> Html.Html Msg
storyView model =
  case model.currentState of
    SharedModels.Storylet id -> storyletDiv model id
    SharedModels.Event id -> eventDiv model id

gameView : Model -> Html.Html Msg
gameView model =
  div []
  [ Html.h2 [] [text "Game"]
  , Html.p [] [text "The game should go here. Maybe external to Elm w/ ports?"]
  ]

viewForActivity : Model -> Html.Html Msg
viewForActivity model =
  case model.activity of
    Game -> gameView model
    BendyRealm -> storyView model

activityControl : Model -> Html.Html Msg
activityControl model =
  div []
  [ button [onClick (SetActivity Game)] [ text "Game" ]
  , button [onClick (SetActivity BendyRealm)] [ text "Story" ]
  ]

view : Model -> Html.Html Msg
view model =
  Html.div [] [ text "Ohai there bendyperson!"
              , div [] [
                text ("You have " ++
                      (toString model.inventory.rubies) ++
                      " rubies!")
              , activityControl model
              , Html.hr [] []
              , viewForActivity model
              ]]
