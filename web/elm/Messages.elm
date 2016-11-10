module Messages exposing (..)

import Models exposing (Activity)
import Storylets.Models exposing (Storylet)
import Events.Models exposing (Event)

type Msg =
  TransitionToStorylet Storylet
  | TransitionToEvent Event
  | SetActivity Activity
  | EditAction EditMsg
  | UpdateFromEditModel
  | Noop


type EditMsg
  = Title String
  | Body String
  | Load Storylet
  | CurrId String
