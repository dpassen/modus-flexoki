;;; modus-flexoki-light.el --- Flexoki light theme on modus-operandi -*- lexical-binding: t -*-

;; Copyright (C) 2026 Free Software Foundation, Inc.
;; Author: Derek Passen <dpassen1@gmail.com>
;; Maintainer: Derek Passen <dpassen1@gmail.com>
;; URL: https://github.com/dpassen/modus-flexoki
;; Keywords: faces, theme, accessibility

;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; The `modus-flexoki' are a collection of themes for GNU Emacs.

;;; Code:

(require 'modus-flexoki)

(defconst modus-flexoki-light-palette
  (modus-themes-generate-palette
   '(
     ;; ── Backgrounds ────────────────────────────────────────────────
     (bg-main      "#FFFCF0")   ; paper
     (bg-dim       "#F2F0E5")   ; base-50
     (bg-active    "#DAD8CE")   ; base-150
     (bg-inactive  "#E6E4D9")   ; base-100

     ;; ── Foregrounds ────────────────────────────────────────────────
     (fg-main      "#100F0F")   ; black
     (fg-dim       "#6F6E69")   ; base-600
     (fg-alt       "#B7B5AC")   ; base-300

     ;; ── Border / fringe ────────────────────────────────────────────
     (border       "#E6E4D9")   ; base-100
     (fringe       "#F2F0E5")   ; base-50

     ;; ── Accents — 600-level primaries ──────────────────────────────
     (red          "#AF3029")   ; red-600
     (red-warmer   "#BC5215")   ; orange-600
     (red-cooler   "#AF3029")   ; red-600
     (red-faint    "#D14D41")   ; red-400
     (red-intense  "#942822")   ; red-700

     (green        "#66800B")   ; green-600
     (green-warmer "#66800B")   ; green-600
     (green-cooler "#24837B")   ; cyan-600
     (green-faint  "#879A39")   ; green-400
     (green-intense "#536907")  ; green-700

     (yellow        "#AD8301")  ; yellow-600
     (yellow-warmer "#BC5215")  ; orange-600
     (yellow-cooler "#AD8301")  ; yellow-600
     (yellow-faint  "#D0A215")  ; yellow-400
     (yellow-intense "#8E6B01") ; yellow-700

     (blue         "#205EA6")   ; blue-600
     (blue-warmer  "#5E409D")   ; purple-600
     (blue-cooler  "#205EA6")   ; blue-600
     (blue-faint   "#4385BE")   ; blue-400
     (blue-intense "#1A4F8C")   ; blue-700

     (magenta         "#A02F6F") ; magenta-600
     (magenta-warmer  "#A02F6F") ; magenta-600
     (magenta-cooler  "#5E409D") ; purple-600
     (magenta-faint   "#CE5D97") ; magenta-400
     (magenta-intense "#87285E") ; magenta-700

     (cyan         "#24837B")   ; cyan-600
     (cyan-warmer  "#24837B")   ; cyan-600
     (cyan-cooler  "#205EA6")   ; blue-600
     (cyan-faint   "#3AA99F")   ; cyan-400
     (cyan-intense "#1C6C66")   ; cyan-700

     (rust   "#BC5215")         ; orange-600
     (gold   "#AD8301")         ; yellow-600
     (olive  "#66800B")         ; green-600
     (slate  "#205EA6")         ; blue-600
     (indigo "#5E409D")         ; purple-600
     (maroon "#AF3029")         ; red-600
     (pink   "#A02F6F")         ; magenta-600

     ;; ── Coloured backgrounds — 50–150 (lightest extended values) ───
     (bg-red-intense      "#FDB2A2")  ; red-150
     (bg-green-intense    "#CDD597")  ; green-150
     (bg-yellow-intense   "#F1D67E")  ; yellow-150
     (bg-blue-intense     "#ABCFE2")  ; blue-150
     (bg-magenta-intense  "#D3CAE6")  ; purple-150
     (bg-cyan-intense     "#A2DECE")  ; cyan-150

     (bg-red-subtle       "#FFE1D5")  ; red-50
     (bg-green-subtle     "#EDEECF")  ; green-50
     (bg-yellow-subtle    "#FAEEC6")  ; yellow-50
     (bg-blue-subtle      "#E1ECEB")  ; blue-50
     (bg-magenta-subtle   "#FEE4E5")  ; magenta-50
     (bg-cyan-subtle      "#DDF1E4")  ; cyan-50

     (bg-red-nuanced      "#FFCABB")  ; red-100
     (bg-green-nuanced    "#DDE2B2")  ; green-100
     (bg-yellow-nuanced   "#F6E2A0")  ; yellow-100
     (bg-blue-nuanced     "#C6DDE8")  ; blue-100
     (bg-magenta-nuanced  "#FCCFDA")  ; magenta-100
     (bg-cyan-nuanced     "#BFE8D9")  ; cyan-100

     ;; ── Mode line ──────────────────────────────────────────────────
     (bg-mode-line-active       "#DAD8CE")  ; base-150
     (fg-mode-line-active       "#100F0F")  ; black
     (border-mode-line-active   "#B7B5AC")  ; base-300
     (bg-mode-line-inactive     "#E6E4D9")  ; base-100
     (fg-mode-line-inactive     "#6F6E69")  ; base-600
     (border-mode-line-inactive "#DAD8CE")  ; base-150

     ;; ── Tab bar ────────────────────────────────────────────────────
     (bg-tab-bar     "#E6E4D9")  ; base-100
     (bg-tab-current "#FFFCF0")  ; paper
     (bg-tab-other   "#DAD8CE")  ; base-150

     ;; ── Line numbers ───────────────────────────────────────────────
     (fg-line-number-inactive "#B7B5AC")  ; base-300
     (fg-line-number-active   "#6F6E69")  ; base-600
     (bg-line-number-inactive "#F2F0E5")  ; base-50
     (bg-line-number-active   "#E6E4D9")  ; base-100

     ;; ── Region / hl-line ───────────────────────────────────────────
     (bg-region    "#DAD8CE")  ; base-150
     (fg-region    "#100F0F")  ; black
     (bg-hl-line   "#F2F0E5")  ; base-50

     ;; ── Completion / hover ─────────────────────────────────────────
     (bg-completion      "#E6E4D9")  ; base-100
     (bg-hover           "#DAD8CE")  ; base-150
     (bg-hover-secondary "#F2F0E5")  ; base-50

     ;; ── Paren match ────────────────────────────────────────────────
     (bg-paren-match "#5ABDAC")  ; cyan-300
     (fg-paren-match "#100F0F")  ; black

     ;; ── Diff / VC ──────────────────────────────────────────────────
     (bg-added         "#DDE2B2")  ; green-100
     (bg-added-faint   "#EDEECF")  ; green-50
     (bg-added-refine  "#CDD597")  ; green-150
     (bg-added-fringe  "#879A39")  ; green-400
     (fg-added         "#66800B")  ; green-600
     (fg-added-intense "#536907")  ; green-700

     (bg-removed         "#FFCABB")  ; red-100
     (bg-removed-faint   "#FFE1D5")  ; red-50
     (bg-removed-refine  "#FDB2A2")  ; red-150
     (bg-removed-fringe  "#D14D41")  ; red-400
     (fg-removed         "#AF3029")  ; red-600
     (fg-removed-intense "#942822")  ; red-700

     (bg-changed         "#F6E2A0")  ; yellow-100
     (bg-changed-faint   "#FAEEC6")  ; yellow-50
     (bg-changed-refine  "#F1D67E")  ; yellow-150
     (bg-changed-fringe  "#D0A215")  ; yellow-400
     (fg-changed         "#AD8301")  ; yellow-600
     (fg-changed-intense "#8E6B01")  ; yellow-700

     (bg-diff-context "#F2F0E5")  ; base-50

     ;; ── Search ─────────────────────────────────────────────────────
     (bg-search-current   "#F1D67E")  ; yellow-150
     (bg-search-lazy      "#A2DECE")  ; cyan-150
     (bg-search-replace   "#FDB2A2")  ; red-150
     (bg-search-rx-group-0 "#ABCFE2") ; blue-150
     (bg-search-rx-group-1 "#CDD597") ; green-150
     (bg-search-rx-group-2 "#FFE1D5") ; red-50
     (bg-search-rx-group-3 "#FEE4E5") ; magenta-50

     ;; ── Prose blocks ───────────────────────────────────────────────
     (bg-prose-block-delimiter "#F2F0E5")  ; base-50
     (fg-prose-block-delimiter "#B7B5AC")  ; base-300
     (bg-prose-block-contents  "#F2F0E5")  ; base-50

     ;; ── Cursor ─────────────────────────────────────────────────────
     (cursor "#100F0F")  ; black
     )
   nil
   nil
   modus-flexoki-common-palette-mappings)
  "Full palette for `modus-flexoki-light'.
Hex colour values are Flexoki's 600-level (light theme primaries).
Semantic mappings come from `modus-flexoki-common-palette-mappings'.")

(defcustom modus-flexoki-light-palette-overrides nil
  "Palette overrides for `modus-flexoki-light'.
Entries here take precedence over both the theme palette and
`modus-flexoki-common-palette-overrides'.
See `modus-themes-common-palette-overrides' for the format."
  :group 'modus-flexoki
  :type '(repeat (list symbol (choice symbol string))))

;;;###theme-autoload
(modus-themes-theme
 'modus-flexoki-light
 'modus-flexoki
 "Flexoki light palette on modus-operandi."
 'light
 'modus-operandi-palette
 'modus-flexoki-light-palette
 'modus-flexoki-light-palette-overrides)

(provide-theme 'modus-flexoki-light)
;;; modus-flexoki-light.el ends here
