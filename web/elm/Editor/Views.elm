module Editor.Views exposing(..)

import Html exposing (div, text, button, input)
import Html.Attributes exposing (rows, cols)
import Html.Events exposing (onInput)
import Html.Events exposing (onClick)

import Markdown

import Models exposing (Model, Activity(..))
import Storylets.Models exposing (Storylet, storyletForId)
import Editor.Models exposing (EditModel)

import Messages exposing (Msg(..), EditMsg(..))

editStoryletForm : EditModel -> Html.Html Msg
editStoryletForm editModel =
  div []
  [ Html.textarea [rows 1, cols 60, onInput (\s -> EditAction (Title s))] [text editModel.title]
  , Html.br [] []
  , Html.textarea [rows 20, cols 100, onInput (\s -> EditAction (Body s))] [text editModel.body]
  ]

storyLoadDiv : Model -> Html.Html Msg
storyLoadDiv model =
  let
    sl = storyletForId model.storylets model.editModel.currId
  in
    div []
    [ button [onClick (EditAction (Load sl))] [text "Load"]
    , Html.input [onInput (\s -> EditAction (CurrId s))] [text model.editModel.body]
    ]

storyDisplay : Model -> Html.Html Msg
storyDisplay model =
  Markdown.toHtml [] model.editModel.body

editView : Model -> Html.Html Msg
editView model =
    div []
    [ Html.h2 [] [text "Edit"]
    , Html.p [] [text "Edit the stories"]
    , storyLoadDiv model
    , editStoryletForm model.editModel
    , button [onClick UpdateFromEditModel] [text "Save"]
    , storyDisplay model
    ]
