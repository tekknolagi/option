let unwrapUnsafely =
  function
  | Some v -> v
  | None  -> raise (Invalid_argument "unwrapUnsafely called on None")

let isSome = function | Some _ -> true  | None -> false
let isNone = function | Some _ -> false | None -> true
let may f =
  function | Some v -> f v | None  -> ()
let or_ other = function | Some _ as self -> self | None  -> other
let getOr other =
  function | Some v -> v | None  -> other
let map f =
  function | Some v -> Some (f v) | None  -> None
let mapOr f other =
  function | Some v -> f v | None  -> other
let mapOrElse f g =
  function | Some v -> f v | None  -> g ()
let andThen f =
  function | Some v -> f v | None  -> None
let filter pred =
  function
  | Some v ->
      (match pred v with | true  -> Some v | false  -> None)
  | None  -> None
let exists predicate =
  function
  | Some v -> predicate v
  | None  -> false
let forAll predicate =
  function
  | Some v -> predicate v
  | None  -> true
let filter predicate =
  function
  | Some v as self when predicate v -> self
  | _ -> None
let fromResult =
  function | Result.Ok v -> Some v | Result.Error _ -> None
let (|?) opt v = getOr v opt
