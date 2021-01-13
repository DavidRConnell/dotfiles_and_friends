(in-package :nyxt)

;; (load-system :slynk)
;; (when (load-system :slynk)
;;   (define-command start-slynk (&optional (slynk-port *swank-port*))
;;     "Start a Slynk server that can be connected to, for instance, in
;; Emacs via SLY.

;; Warning: This allows Nyxt to be controlled remotely, that is, to
;; execute arbitrary code with the privileges of the user running Nyxt.
;; Make sure you understand the security risks associated with this
;; before running this command."
;;       (slynk:create-server :port slynk-port :dont-close t)
;;       (echo "Slynk server started at port ~a" slynk-port)))

(defvar *my-normal-keymap* (make-keymap "*my-normal-keymap*"))
(define-key *my-normal-keymap*
  "C-o" 'nyxt/web-mode:history-backwards
  "C-u C-o" 'nyxt/web-mode:history-all-query
  "C-i" 'nyxt/web-mode:history-forwards
  "C-u C-i" 'nyxt/web-mode:history-forwards-all-query
  "C-u o" 'set-url-from-current-url
  "y y" 'copy-url
  "y p" 'copy-password
  ;; Hinting
  "; y" 'nyxt/web-mode:copy-hint-url
  "; d" 'nyxt/web-mode:download-hint-url)

(defvar *my-insert-keymap* (make-keymap "*my-insert-keymap*"))
(define-key *my-insert-keymap*
  "C-[" 'nyxt/vi-mode:vi-normal-mode)
  ;; "C-w" 'delete-backwards-word
  ;; "C-l" 'cursor-forwards
  ;; "C-h" 'cursor-backwards)

;; ;; ;;  Don't know where this needs to be added.
;; ;; (defvar *my-minibuffer-keymap* (make-keymap "*my-minibuffer-keymap*"))
;; ;; (define-key *my-minibuffer-keymap*
;; ;;   "C-space" 'minibuffer-toggle-mark
;; ;;   "C-w" 'delete-backwards-word)

(define-mode my-states-mode ()
  "Mode to add custom keybindings"
  ((keymap-scheme :initform (keymap:make-scheme
                             scheme:vi-normal *my-normal-keymap*
                             scheme:emacs *my-insert-keymap*
                             scheme:vi-insert *my-insert-keymap*))))

(defvar *my-global-keymap* (make-keymap "*my-global-keymap*"))
(define-key *my-global-keymap*
  "C-d" 'quit)

(define-mode my-global-mode ()
  "Mode to add custom keybindings"
  ((keymap-scheme :initform (keymap:make-scheme
                             scheme:emacs *my-global-keymap*
                             scheme:vi-normal *my-global-keymap*
                             scheme:vi-insert *my-global-keymap*))))

(define-configuration buffer
  ((default-modes
    (append '(my-global-mode my-states-mode vi-normal-mode)
            %slot-default))))
