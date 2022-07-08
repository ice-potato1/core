open! Import
include Time_ns_intf.Span

module Stable : sig
  module V1 : sig end [@@deprecated "[since 2021-02] Use [Time_ns_unix.Stable]"]
  module Option : sig end [@@deprecated "[since 2021-02] Use [Time_ns_unix.Stable]"]

  module V2 : sig
    type nonrec t = t [@@deriving hash, equal, sexp_grammar, stable_witness]
    type nonrec comparator_witness = comparator_witness

    include
      Stable_int63able.With_stable_witness.S
      with type t := t
      with type comparator_witness := comparator_witness

    include
      Comparable.Stable.V1.With_stable_witness.S
      with type comparable := t
      with type comparator_witness := comparator_witness

    include Stringable.S with type t := t
  end
end
