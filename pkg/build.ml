open Topkg

let () =
  let cmd c os files =
    let ocamlbuild = Conf.tool "ocamlbuild" os in
    OS.Cmd.run @@ Cmd.(ocamlbuild % "-use-ocamlfind"
                                  %% (v "-I" % "src")
                                  %% of_list files)
  in
  let build = Pkg.build ~cmd () in
  Pkg.describe "option" ~build ~change_logs:[] ~licenses:[] ~readmes:[] @@ fun c ->
    Ok [
      Pkg.lib "pkg/META";
      Pkg.lib ~exts:(Exts.library) ~dst:"result_mod" "src/result_mod";
      Pkg.lib ~exts:(Exts.library) ~dst:"option_mod" "src/option_mod";
    ]
