;;; modus-flexoki.el --- Flexoki colours on top of Modus themes -*- lexical-binding: t -*-

;; Copyright (C) 2026 Free Software Foundation, Inc.
;; Author: Derek Passen <dpassen1@gmail.com>
;; Maintainer: Derek Passen <dpassen1@gmail.com>
;; URL: https://github.com/dpassen/modus-flexoki
;; Version: 0.0.1
;; Based on: https://stephango.com/flexoki
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))
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

(require 'modus-themes)
(eval-when-compile (require 'subr-x))

;;;; Basics for building on top of Modus

(defgroup modus-flexoki ()
  "Flexoki colour palette on top of the Modus themes infrastructure."
  :group 'faces
  :group 'modus-themes
  :link '(info-link "(modus-flexoki) Top")
  :link '(info-link "(modus-themes) Top")
  :prefix "modus-flexoki"
  :tag "Modus Flexoki Themes")

(defconst modus-flexoki-light-themes
  '(modus-flexoki-light)
  "List of symbols with the light Modus Flexoki themes.")

(defconst modus-flexoki-dark-themes
  '(modus-flexoki-dark)
  "List of symbols with the dark Modus Flexoki themes.")

(defvaralias 'modus-flexoki-collection 'modus-flexoki-items
  "Alias of `modus-flexoki-items'.")

(defconst modus-flexoki-items
  (append modus-flexoki-light-themes modus-flexoki-dark-themes))

(defconst modus-flexoki-common-palette-mappings
  '(
    ;; ── Syntax ───────────────────────────────────────────────────────
    (keyword          green)
    (builtin          magenta)
    (constant         yellow)
    (string           cyan)
    (docstring        cyan-faint)
    (docmarkup        magenta-faint)
    (comment          fg-alt)         ; tx-3 / faint text
    (fnname           red-warmer)     ; orange slot
    (type             cyan)
    (variable         blue)
    (preprocessor     red)
    (property         blue)
    (rx-backslash     magenta)
    (rx-construct     cyan)

    ;; ── Links ─────────────────────────────────────────────────────────
    (fg-link          blue)
    (underline-link   blue)
    (fg-link-symbolic cyan)
    (underline-link-symbolic cyan)
    (fg-link-visited  blue-warmer)    ; purple slot
    (underline-link-visited blue-warmer)

    ;; ── Prose ─────────────────────────────────────────────────────────
    (fg-prose-code      cyan)
    (fg-prose-macro     blue-warmer)  ; purple slot
    (fg-prose-verbatim  red-warmer)   ; orange slot
    (prose-done         green)
    (prose-todo         red)
    (prose-tag          magenta)
    (prose-metadata     fg-alt)
    (prose-metadata-value fg-dim)

    ;; ── Headings ──────────────────────────────────────────────────────
    (fg-heading-0   cyan)
    (fg-heading-1   fg-main)
    (fg-heading-2   yellow)
    (fg-heading-3   blue)
    (fg-heading-4   magenta)
    (fg-heading-5   green)
    (fg-heading-6   red)
    (fg-heading-7   cyan)
    (fg-heading-8   fg-dim)

    ;; ── Completion matches ────────────────────────────────────────────
    (accent-0              blue)
    (accent-1              red-warmer)  ; orange
    (accent-2              cyan)
    (accent-3              red)
    (fg-completion-match-0 blue)
    (fg-completion-match-1 red-warmer)
    (fg-completion-match-2 cyan)
    (fg-completion-match-3 red)

    ;; ── Prompt / modeline indicators ──────────────────────────────────
    (fg-prompt        cyan)
    (modeline-err     red)
    (modeline-warning yellow)
    (modeline-info    blue)

    ;; ── Err / warning / info ──────────────────────────────────────────
    (err              red)
    (warning          yellow)
    (info             cyan)
    (underline-err    red-intense)
    (underline-warning yellow-intense)
    (underline-note   cyan-intense)

    ;; ── Keybind / name / identifier ───────────────────────────────────
    (keybind    blue)
    (name       magenta)
    (identifier yellow)

    ;; ── Dates ─────────────────────────────────────────────────────────
    (date-common           cyan)
    (date-deadline         red)
    (date-deadline-subtle  red-faint)
    (date-scheduled        yellow)
    (date-scheduled-subtle yellow-faint)
    (date-holiday          red)
    (date-holiday-other    blue)
    (date-weekday          cyan)
    (date-weekend          magenta)

    ;; ── Marks ─────────────────────────────────────────────────────────
    (bg-mark-delete    bg-red-subtle)
    (fg-mark-delete    red)
    (bg-mark-select    bg-cyan-subtle)
    (fg-mark-select    cyan)
    (bg-mark-other     bg-yellow-subtle)
    (fg-mark-other     yellow)

    ;; ── Mail ──────────────────────────────────────────────────────────
    (mail-cite-0    blue)
    (mail-cite-1    yellow)
    (mail-cite-2    cyan)
    (mail-cite-3    red)
    (mail-part      cyan)
    (mail-recipient blue-warmer)   ; purple
    (mail-subject   magenta)
    (mail-other     green)
    )
  "Common palette mappings for the Flexoki Modus themes.")

(defcustom modus-flexoki-common-palette-overrides nil
  "Palette overrides shared by all Modus Flexoki themes.
Use this for semantic mappings that should apply to both light and
dark variants.  Per-theme overrides are preferred for colour values,
as those will differ between light and dark.

See `modus-themes-common-palette-overrides' for the format."
  :group 'modus-flexoki
  :type '(repeat (list symbol (choice symbol string))))

(defconst modus-flexoki-with-properties
  '((modus-flexoki-light modus-flexoki "Flexoki light palette on modus-operandi." light modus-operandi-palette modus-flexoki-light-palette modus-flexoki-light-palette-overrides)
    (modus-flexoki-dark modus-flexoki "Flexoki dark palette on modus-vivendi." dark modus-vivendi-palette modus-flexoki-dark-palette modus-flexoki-dark-palette-overrides))
  "Properties for each Modus Flexoki theme.
Each entry is a list of arguments passed to `modus-themes-declare'
and `modus-themes-register'.")

(defvar modus-flexoki--declared-p nil
  "Non-nil if Modus Flexoki themes have been declared.")

(defun modus-flexoki-declare-themes ()
  "Declare and register the Modus Flexoki themes with modus-themes."
  (unless modus-flexoki--declared-p
    (dolist (theme modus-flexoki-with-properties)
      (apply #'modus-themes-declare theme)
      (modus-themes-register (car theme)))
    (setq modus-flexoki--declared-p t)))

(modus-flexoki-declare-themes)

;;;; Limit the Modus themes to only Modus Flexoki themes

;;;###autoload
(define-minor-mode modus-flexoki-take-over-modus-themes-mode
  "When enabled, all Modus theme commands consider only Modus Flexoki themes.
Alternatively, use the dedicated commands `modus-flexoki-rotate',
`modus-flexoki-select', `modus-flexoki-load-random',
`modus-flexoki-load-random-dark',
`modus-flexoki-load-random-light',
`modus-flexoki-list-colors',
`modus-flexoki-list-colors-current'.
They are all designed to only consider Modus Flexoki themes."
  :global t
  :init-value nil)

(cl-defmethod modus-themes-get-themes (&context (modus-flexoki-take-over-modus-themes-mode (eql t)))
  "Return Modus Flexoki themes, per `MODUS-FLEXOKI-TAKE-OVER-MODUS-THEMES-MODE'."
  (if-let* ((themes (modus-themes-get-all-known-themes 'modus-flexoki))
            (sorted-a-z (sort themes #'string-lessp))
            (sorted-light-dark (modus-themes-sort sorted-a-z 'light)))
      sorted-light-dark
    modus-flexoki-items))

;;;; Convenience commands

;;;###autoload (autoload 'modus-flexoki-rotate "modus-flexoki")
(modus-themes-define-derivative-command modus-flexoki rotate)

;;;###autoload (autoload 'modus-flexoki-select "modus-flexoki")
(modus-themes-define-derivative-command modus-flexoki select)

;;;###autoload (autoload 'modus-flexoki-load-random "modus-flexoki")
(modus-themes-define-derivative-command modus-flexoki load-random)

;;;###autoload (autoload 'modus-flexoki-load-random-dark "modus-flexoki")
(modus-themes-define-derivative-command modus-flexoki load-random-dark)

;;;###autoload (autoload 'modus-flexoki-load-random-light "modus-flexoki")
(modus-themes-define-derivative-command modus-flexoki load-random-light)

;;;###autoload (autoload 'modus-flexoki-list-colors "modus-flexoki")
(modus-themes-define-derivative-command modus-flexoki list-colors)

;;;###autoload (autoload 'modus-flexoki-list-colors-current "modus-flexoki")
(modus-themes-define-derivative-command modus-flexoki list-colors-current)

;;;; Add themes from the package to the load path

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (file-equal-p dir (expand-file-name "themes/" data-directory))
      (add-to-list 'custom-theme-load-path dir))))

(provide 'modus-flexoki)
;;; modus-flexoki.el ends here
