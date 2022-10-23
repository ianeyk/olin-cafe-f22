---
fontsize: 12pt
geometry: margin=1in
title: Homework 5
author: Ian Eykamp
date: 2022-10-26
---

Collaborators: None

## 1. The Magic Number Seven

a) In MATLAB, non-integer numbers are represented by a large number of decimal points, even when they could be succinctly represented by a simple mathematical expression, such as $\sqrt{2}$, which should reasonably take about 6 bits to convey (4 bits for the operator and 2 bits for the number).

b) On one discrete math homework problem, I needed to know whether I should explain a particular concept in more detail (I did not know if using an equation from the textbook was sufficient or not). This was a bit of information I did not have, so I omitted the explanation and lost points on the problem.

c) There are 56 words in the previous answer. Let us assume each word has an average of 8 binary phonetic elements. Therefore, I used $8 \cdot 56 = 448$ bits.

d) A bit is a binary distinction in one variable. A chunk is a set of (usually binary) distinctions in many variables, or a sequence of distinctions in one variable that can be conceptualized as a single unit.

e) The ability to differentiate between thousands of faces is based on the extremely high dimensionality of face data. This is imitated very well by covariance-based machine learning processes like we learned in QEA 1, in which the first 10-20 eigenvectors form the basis of a space in which most people's faces principally differ. Therefore, computers can be trained to distinguish between images of faces by discriminating between 10-20 variables. 10-20 bits of information corresponds to 1,000-1,000,000 possible combinations of features.

