;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.5)

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Package initialize occurs automatically, before `user-init-file' is
;; loaded, but after `early-init-file'. We handle package
;; initialization, so we must prevent Emacs from doing it early!
(setq package-enable-at-startup         nil)
(setq inhibit-startup-screen            t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message           t)
(setq initial-scratch-message           nil)

;; Faster to disable these here (before they've been initialized)
(push '(menu-bar-lines . 0)                  default-frame-alist)
(push '(tool-bar-lines . 0)                  default-frame-alist)
(push '(vertical-scroll-bars)                default-frame-alist)
(push '(width  . 121)                        default-frame-alist)
(push '(height . 64)                         default-frame-alist)
(push '(internal-border-width . 24)          default-frame-alist)
(push '(font . "Roboto Mono Light 14")       default-frame-alist)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; early-init.el ends here
