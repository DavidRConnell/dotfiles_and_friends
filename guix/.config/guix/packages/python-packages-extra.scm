(define-module (python-packages-extra)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-sytem python)
  #:use-module (guix licenses))

(define-public python-spektral
  (package
   (name "python-spektral")
   (version "1.0.4")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "spektral" version))
     (sha256
      (base32
       "14bvk2l3vlqhcmwhj5z3pxba37b7kghb0b2f831qybwl7k2vf4rv"))))
   (build-system python-build-system)
   (propagated-inputs
    `(("python-joblib" ,python-joblib)
      ("python-lxml" ,python-lxml)
      ("python-networkx" ,python-networkx)
      ("python-numpy" ,python-numpy)
      ("python-pandas" ,python-pandas)
      ("python-requests" ,python-requests)
      ("python-scikit-learn" ,python-scikit-learn)
      ("python-scipy" ,python-scipy)
      ("python-tensorflow" ,python-tensorflow)
      ("python-tqdm" ,python-tqdm)))
   (home-page
    "https://github.com/danielegrattarola/spektral")
   (synopsis
    "Graph Neural Networks with Keras and Tensorflow 2.")
   (description
    "Graph Neural Networks with Keras and Tensorflow 2.")
   (license license:expat)))

(define-public python-keras
  (package
   (name "python-keras")
   (version "2.4.3")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "Keras" version))
     (sha256
      (base32
       "0wxrpq1myamb436068bxj79q22n1pbhrfgcfm44b2bspaadp5pgy"))))
   (build-system python-build-system)
   (propagated-inputs
    `(("python-h5py" ,python-h5py)
      ("python-numpy" ,python-numpy)
      ("python-pyyaml" ,python-pyyaml)
      ("python-scipy" ,python-scipy)))
   (native-inputs
    `(("python-flaky" ,python-flaky)
      ("python-markdown" ,python-markdown)
      ("python-pandas" ,python-pandas)
      ("python-pytest" ,python-pytest)
      ("python-pytest-cov" ,python-pytest-cov)
      ("python-pytest-pep8" ,python-pytest-pep8)
      ("python-pytest-xdist" ,python-pytest-xdist)
      ("python-requests" ,python-requests)))
   (home-page "https://github.com/keras-team/keras")
   (synopsis "Deep Learning for humans")
   (description "Deep Learning for humans")
   (license license:expat)))
