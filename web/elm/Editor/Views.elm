module Editor.Views exposing(..)

import Html exposing (div, text, button, input)
-- import Html.Attributes exposing (value, type')
import Html.Events exposing (onInput)
import Html.Events exposing (onClick)

import Models exposing (Model, Activity(..))
import Storylets.Models exposing (Storylet, storyletForId)
import Editor.Models exposing (EditModel)

import Messages exposing (Msg(..), EditMsg(..))



--
editStoryletForm : EditModel -> Html.Html Msg
editStoryletForm editModel =
  div []
  [ Html.textarea [onInput (\s -> EditAction (Title s))] [text editModel.title]
  , Html.br [] []
  , Html.textarea [onInput (\s -> EditAction (Body s))] [text editModel.body]
  ]
--

editView : Model -> Html.Html Msg
editView model =
  let
    sl1 = storyletForId model.storylets 0
  in
    div []
    [ Html.h2 [] [text "Edit"]
    , Html.p [] [text "Edit the stories"]
    , button [onClick (EditAction (Load sl1))] [text "Load"]
    , editStoryletForm model.editModel
    ]
