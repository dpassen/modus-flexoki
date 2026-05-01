;;; modus-flexoki-dark.el --- Flexoki dark theme on modus-vivendi -*- lexical-binding: t -*-

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

(defconst modus-flexoki-dark-palette
  (modus-themes-generate-palette
   '(
     ;; ── Backgrounds ────────────────────────────────────────────────
     (bg-main      "#100F0F")   ; black
     (bg-dim       "#1C1B1A")   ; base-950
     (bg-active    "#343331")   ; base-850
     (bg-inactive  "#282726")   ; base-900

     ;; ── Foregrounds ────────────────────────────────────────────────
     (fg-main      "#CECDC3")   ; base-200
     (fg-dim       "#878580")   ; base-500
     (fg-alt       "#575653")   ; base-700

     ;; ── Border / fringe ────────────────────────────────────────────
     (border       "#282726")   ; base-900
     (fringe       "#1C1B1A")   ; base-950

     ;; ── Accents — 400-level primaries ──────────────────────────────
     (red          "#D14D41")   ; red-400
     (red-warmer   "#DA702C")   ; orange-400
     (red-cooler   "#D14D41")   ; red-400
     (red-faint    "#C03E35")   ; red-500
     (red-intense  "#E8705F")   ; red-300

     (green        "#879A39")   ; green-400
     (green-warmer "#879A39")   ; green-400
     (green-cooler "#3AA99F")   ; cyan-400
     (green-faint  "#768D21")   ; green-500
     (green-intense "#A0AF54")  ; green-300

     (yellow        "#D0A215")  ; yellow-400
     (yellow-warmer "#DA702C")  ; orange-400
     (yellow-cooler "#D0A215")  ; yellow-400
     (yellow-faint  "#BE9207")  ; yellow-500
     (yellow-intense "#DFB431") ; yellow-300

     (blue         "#4385BE")   ; blue-400
     (blue-warmer  "#8B7EC8")   ; purple-400
     (blue-cooler  "#4385BE")   ; blue-400
     (blue-faint   "#3171B2")   ; blue-500
     (blue-intense "#66A0C8")   ; blue-300

     (magenta         "#CE5D97") ; magenta-400
     (magenta-warmer  "#CE5D97") ; magenta-400
     (magenta-cooler  "#8B7EC8") ; purple-400
     (magenta-faint   "#B74583") ; magenta-500
     (magenta-intense "#E47DA8") ; magenta-300

     (cyan         "#3AA99F")   ; cyan-400
     (cyan-warmer  "#3AA99F")   ; cyan-400
     (cyan-cooler  "#4385BE")   ; blue-400
     (cyan-faint   "#2F968D")   ; cyan-500
     (cyan-intense "#5ABDAC")   ; cyan-300

     (rust   "#DA702C")         ; orange-400
     (gold   "#D0A215")         ; yellow-400
     (olive  "#879A39")         ; green-400
     (slate  "#4385BE")         ; blue-400
     (indigo "#8B7EC8")         ; purple-400
     (maroon "#D14D41")         ; red-400
     (pink   "#CE5D97")         ; magenta-400

     ;; ── Coloured backgrounds — 800–950 (darkest extended values) ───
     (bg-red-intense      "#3E1715")  ; red-900
     (bg-green-intense    "#252D09")  ; green-900
     (bg-yellow-intense   "#3A2D04")  ; yellow-900
     (bg-blue-intense     "#12253B")  ; blue-900
     (bg-magenta-intense  "#261C39")  ; purple-900
     (bg-cyan-intense     "#122F2C")  ; cyan-900

     (bg-red-subtle       "#551B18")  ; red-850
     (bg-green-subtle     "#313D07")  ; green-850
     (bg-yellow-subtle    "#503D02")  ; yellow-850
     (bg-blue-subtle      "#133051")  ; blue-850
     (bg-magenta-subtle   "#31234E")  ; purple-850
     (bg-cyan-subtle      "#143F3C")  ; cyan-850

     (bg-red-nuanced      "#6C201C")  ; red-800
     (bg-green-nuanced    "#3D4C07")  ; green-800
     (bg-yellow-nuanced   "#664D01")  ; yellow-800
     (bg-blue-nuanced     "#163B66")  ; blue-800
     (bg-magenta-nuanced  "#3C2A62")  ; purple-800
     (bg-cyan-nuanced     "#164F4A")  ; cyan-800

     ;; ── Mode line ──────────────────────────────────────────────────
     (bg-mode-line-active       "#343331")  ; base-850
     (fg-mode-line-active       "#CECDC3")  ; base-200
     (border-mode-line-active   "#575653")  ; base-700
     (bg-mode-line-inactive     "#282726")  ; base-900
     (fg-mode-line-inactive     "#878580")  ; base-500
     (border-mode-line-inactive "#403E3C")  ; base-800

     ;; ── Tab bar ────────────────────────────────────────────────────
     (bg-tab-bar     "#282726")  ; base-900
     (bg-tab-current "#100F0F")  ; black
     (bg-tab-other   "#343331")  ; base-850

     ;; ── Line numbers ───────────────────────────────────────────────
     (fg-line-number-inactive "#575653")  ; base-700
     (fg-line-number-active   "#878580")  ; base-500
     (bg-line-number-inactive "#1C1B1A")  ; base-950
     (bg-line-number-active   "#282726")  ; base-900

     ;; ── Region / hl-line ───────────────────────────────────────────
     (bg-region    "#343331")  ; base-850
     (fg-region    "#CECDC3")  ; base-200
     (bg-hl-line   "#1C1B1A")  ; base-950

     ;; ── Completion / hover ─────────────────────────────────────────
     (bg-completion      "#282726")  ; base-900
     (bg-hover           "#343331")  ; base-850
     (bg-hover-secondary "#1C1B1A")  ; base-950

     ;; ── Paren match ────────────────────────────────────────────────
     (bg-paren-match "#2F968D")  ; cyan-500
     (fg-paren-match "#CECDC3")  ; base-200

     ;; ── Diff / VC ──────────────────────────────────────────────────
     (bg-added         "#252D09")  ; green-900
     (bg-added-faint   "#1A1E0C")  ; green-950
     (bg-added-refine  "#313D07")  ; green-850
     (bg-added-fringe  "#879A39")  ; green-400
     (fg-added         "#879A39")  ; green-400
     (fg-added-intense "#A0AF54")  ; green-300

     (bg-removed         "#3E1715")  ; red-900
     (bg-removed-faint   "#261312")  ; red-950
     (bg-removed-refine  "#551B18")  ; red-850
     (bg-removed-fringe  "#D14D41")  ; red-400
     (fg-removed         "#D14D41")  ; red-400
     (fg-removed-intense "#E8705F")  ; red-300

     (bg-changed         "#3A2D04")  ; yellow-900
     (bg-changed-faint   "#241E08")  ; yellow-950
     (bg-changed-refine  "#503D02")  ; yellow-850
     (bg-changed-fringe  "#D0A215")  ; yellow-400
     (fg-changed         "#D0A215")  ; yellow-400
     (fg-changed-intense "#DFB431")  ; yellow-300

     (bg-diff-context "#1C1B1A")  ; base-950

     ;; ── Search ─────────────────────────────────────────────────────
     (bg-search-current    "#503D02")  ; yellow-850
     (bg-search-lazy       "#143F3C")  ; cyan-850
     (bg-search-replace    "#551B18")  ; red-850
     (bg-search-rx-group-0 "#133051")  ; blue-850
     (bg-search-rx-group-1 "#313D07")  ; green-850
     (bg-search-rx-group-2 "#3E1715")  ; red-900
     (bg-search-rx-group-3 "#31234E")  ; purple-850

     ;; ── Prose blocks ───────────────────────────────────────────────
     (bg-prose-block-delimiter "#1C1B1A")  ; base-950
     (fg-prose-block-delimiter "#575653")  ; base-700
     (bg-prose-block-contents  "#1C1B1A")  ; base-950

     ;; ── Cursor ─────────────────────────────────────────────────────
     (cursor "#CECDC3")  ; base-200
     )
   nil
   nil
   modus-flexoki-common-palette-mappings)
  "Full palette for `modus-flexoki-dark'.
Hex colour values are Flexoki's 400-level (dark theme primaries).
Semantic mappings come from `modus-flexoki-common-palette-mappings'.")

(defcustom modus-flexoki-dark-palette-overrides nil
  "Palette overrides for `modus-flexoki-dark'.
Entries here take precedence over both the theme palette and
`modus-flexoki-common-palette-overrides'.
See `modus-themes-common-palette-overrides' for the format."
  :group 'modus-flexoki
  :type '(repeat (list symbol (choice symbol string))))

;;;###theme-autoload
(modus-themes-theme
 'modus-flexoki-dark
 'modus-flexoki
 "Flexoki dark palette on modus-vivendi. "
 'dark
 'modus-vivendi-palette
 'modus-flexoki-dark-palette
 'modus-flexoki-dark-palette-overrides)

(provide-theme 'modus-flexoki-dark)
;;; modus-flexoki-dark.el ends here
