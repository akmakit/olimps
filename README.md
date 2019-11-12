
Task description
---

Available at:

    http://olimps.lio.lv/uzdevumi.php?show=106

How it works
---

Clone repozitory

    git clone git@github.com:akmakit/olimps.git

Go to project directory

    cd sienazis

Take latest changes

    git pull
    git checkout sienazis

Open irb

    irb

Load sienazis.rb file

    load './sienazis.rb'

Initialize Sienazis class and call perform method

    Sienazis.new.perform

Results
---

- In case input file is correct, results will be available in output file sienaz.out
- Otherwise runtime exception will be raised


Example
---
Given input: sienaz.in

    3 2
    1 2

Expected output: sienaz.out

    3
