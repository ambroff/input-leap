;; What follows is a "manifest" equivalent to the command line you gave.
;; You can store it in a file that you may then pass to any 'guix' command
;; that accepts a '--manifest' (or '-m') option.

(use-modules (gnu packages avahi)
             (gnu packages check)
             (gnu packages cmake)
             (gnu packages commencement)
             (gnu packages cpp)
             (gnu packages curl)
             (gnu packages freedesktop)
             (gnu packages gcc)
             (gnu packages ninja)
             (gnu packages pkg-config)
             (gnu packages popt)
             (gnu packages protobuf)
             (gnu packages python)
             (gnu packages python-xyz)
             (gnu packages qt)
             (gnu packages tls)
             (gnu packages version-control)
             (gnu packages xdisorg)
             (gnu packages xorg)
             (guix build-system cmake)
             (guix build-system meson)
             (guix download)
             (guix gexp)
             (guix git-download)
             ((guix licenses) #:prefix license:)
             (guix packages)
             (guix utils))

(define-public libei
  (package
    (name "libei")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.freedesktop.org/libinput/libei")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1dbgc2my0r7bzb8ilbcv0d4k1j8fmm7w2r5c94y1djk5n39c4zzj"))))
    (build-system meson-build-system)
    (arguments
     `(#:tests? #f
       #:configure-flags (list "-Dtests=disabled")))
    (home-page "https://gitlab.freedesktop.org/libinput/libei")
    (synopsis "libei is a library for Emulated Input.")
    (native-inputs (list cmake
                         git
                         python
                         python-attrs
                         python-jinja2
                         pkg-config))
    (inputs (list basu libevdev))
    (description
     "libei is a library for Emulated Input, primarily aimed at the Wayland stack.")
    (license license:expat)))

(packages->manifest
 (list avahi
       cmake
       curl
       gcc-toolchain
       gflags
       git
       googletest
       gulrak-filesystem
       libei
       libportal
       libxkbcommon
       ninja
       openssl
       pkg-config
       qt5compat
       qtbase
       qttools

       ;; Stuff required when building with X11 support
       libice
       libsm
       libxi
       libxinerama
       libxrandr
       libxtst))
