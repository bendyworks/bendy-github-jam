module Editor.Models exposing(..)

type alias EditModel =
  { title : String
  , body : String
  , currId : Int
  }

initialEditModel : EditModel
initialEditModel =
  EditModel "" "" 0
