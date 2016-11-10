module Editor.Updates exposing (..)

import Editor.Models exposing (EditModel)
import Messages exposing (EditMsg(..))

editUpdate : EditMsg -> EditModel -> EditModel
editUpdate msg model =
  case msg of
    Title title ->
      { model | title = title }

    Body body ->
      { model | body = body }

    Load storylet ->
      { model | title = storylet.title
              , body = storylet.body
              , currId = storylet.id }
