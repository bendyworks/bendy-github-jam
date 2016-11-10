module Editor.Updates exposing (..)

import String

import Editor.Models exposing (EditModel)
import Messages exposing (EditMsg(..))

editUpdate : EditMsg -> EditModel -> EditModel
editUpdate msg model =
  case msg of
    Title title ->
      { model | title = title }

    Body body ->
      { model | body = body }

    CurrId idStr ->
      let
        idVal =
          case String.toInt idStr of
            Ok val -> val
            Err msg -> 0
      in
        { model | currId = idVal }

    Load storylet ->
      { model | title = storylet.title
              , body = storylet.body
              , currId = storylet.id }
