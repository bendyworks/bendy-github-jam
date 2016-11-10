module Editor.Views exposing(..)

import Html exposing (div, text, button)
-- import Html.Events exposing (onClick)

import Models exposing (Model, Activity(..))

import Messages exposing (Msg(..))

editView : Model -> Html.Html Msg
editView model =
  div []
  [ Html.h2 [] [text "Edit"]
  , Html.p [] [text "Edit the stories"]
  ]
