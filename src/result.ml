type ('a,'e) result =
  | Ok of 'a
  | Error of 'e

let unwrapUnsafely =
  function
  | Ok v -> v
  | Error _ -> raise (Invalid_argument "unwrapUnsafely called on Error")

let isOk = function | Ok _ -> true  | Error _ -> false
let isError = function | Ok _ -> false | Error _ -> true
let catch f =
  Ok (try f with | e -> Error e)

let may f =
  function | Ok v -> f v | Error _ -> ()
let or_ other = function | Ok _ as self -> self | Error _ -> other
let getOr other =
  function | Ok v -> v | Error _ -> other
let map f =
  function
  | Ok v -> Ok (f v)
  | e -> e
let mapOr f other =
  function | Ok v -> f v | Error _ -> other
let mapOrElse f g =
  function | Ok v -> f v | Error _ -> g ()
let andThen f = function | Ok v -> f v | e -> e
let fromOption =
  function
  | Some v -> Ok v
  | None  -> Error ()
