(lang dune 3.17)

(name pp-extended)

(generate_opam_files)

(license MIT)

(authors "Mathieu Barbin")

(maintainers "Mathieu Barbin <opensource@mbarbin.org>")

(source
 (github mbarbin/pp-extended))

(documentation "https://mbarbin.github.io/pp-extended/")

(implicit_transitive_deps false)

(package
 (name pp-extended)
 (synopsis "Adding a few functions to Pp")
 (depends
  (ocaml
   (>= 5.2))
  (base
   (>= v0.17))
  (pp
   (>= 2.0.0))))

(package
 (name pp-extended-tests)
 (synopsis "Tests for pp-extended")
 (depends
  (ocaml
   (>= 5.2))
  (pp
   (>= 2.0.0))
  (pp-extended
   (= :version))
  (ppx_expect
   (>= v0.17))
  (ppxlib
   (>= 0.33))))

(package
 (name pp-extended-dev)
 (synopsis "Package to regroup dev targets, documentation, and more")
 (allow_empty)
 (depends
  (ocaml
   (>= 5.2))
  (ocamlformat
   (= 0.28.1))
  (bisect_ppx
   (>= 2.8.3))
  (pp-extended
   (= :version))
  (pp-extended-tests
   (= :version))
  (ppx_expect
   (>= v0.17))
  (ppx_js_style
   (>= v0.17))
  (ppxlib
   (>= 0.35.0))
  (sherlodoc
   (>= 0.2))))
