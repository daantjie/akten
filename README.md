Akten
=====

On the 10th of February, 2016, I realised the system I have of storing my
school documents is aweful. So I'm going to try to change that.

How it should work
------------------

`akten` should somehow know which directory is its root. In my case, this will
be `~/school/`.

```
.
└── work
    └── en
        ├── 0211#exposure.pdf
        ├── 0211#exposure.tex
        └── img
            └── 0211#owen.jpg
```
			
[Note how the user manually gives the date in the format `mmdd#` when saving the
file; I may wish to change this later.]

One should then be able to type `akten archive`, and have the following happen:

```
.
├── archive
│   └── en
│       └── 16-02
│           ├── exposure.tex
│           └── img
│               └── owen.jpg
└── work
    └── en
        ├── 0211#exposure.pdf
        ├── 0211#exposure.tex
        └── img
            └── 0211#owen.jpg
```

A child of `en/` has been created with the year (`16` for 2016) and the month
(`02` for February). All the files that began with `02` and had the `dddd#`
prefix (the `d` is for digit) have been moved into this new directory, and
their prefixes removed.

**This is the initial idea; it may change. Please leave suggestions if you think
it should work a different way.**
