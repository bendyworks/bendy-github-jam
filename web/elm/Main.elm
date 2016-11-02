module Main exposing (..)
import Html exposing (text, Html, div)
import Html.App as App

type Activity =
  Game
  | Story

type alias Inventory = {rubies: Int}
type alias Model = {activity: Activity, inventory: Inventory}

type Msg = Noop

initModel : Model
initModel = { activity = Game
            , inventory = { rubies = 1}
            }

init : ( Model, Cmd Msg )
init =
  ( initModel , Cmd.none )

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = (model, Cmd.none)

view : Model -> Html.Html Msg
view model =
  Html.div [] [ text "Hello there"
              , div [] [
                text ("you have " ++
                      (toString model.inventory.rubies) ++
                      " rubies!")
              ]]

main : Program Never
main =
  App.program
  { init = init
  , view = view
  , update = update
  , subscriptions = \_ -> Sub.none
  }
