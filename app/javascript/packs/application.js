import "bootstrap";

import "../components/checkboxes";
import "../components/selected";
import "../components/value";

import { sources } from "../components/sources";
import { assembly } from "../components/assembly";
import { autocomplete } from "../components/autocomplete";
// import { change } from "../components/change";

if (document.querySelector(".theme")) {
  sources();
}

if (document.getElementById("brand-names")) {
  autocomplete();
}
