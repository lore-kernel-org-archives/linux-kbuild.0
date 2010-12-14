Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:30375 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755128Ab0LNXmC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Dec 2010 18:42:02 -0500
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: RFC: multi-sourced file, multiple choice 'instanciations'
Date: Wed, 15 Dec 2010 00:34:01 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201012150034.01356.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello All!

For a project I'm maintaining, crosstool-NG [0], I'm using Kconfig to setup
the configuration.

In this context, I have the need for options that are common to multiple,
exclusive components (each a boolean in a choice). Each component also
has its own set of options. What makes it complex is that, given three
components, only two have the common options, while the third will not.
See [1] for an example of such a (limited, yet representative) setup.

But currently, mconf refuses to include the same files more than once:
  component-2.in:12: file 'common.in' is already sourced from 'component-1.in'

This is trivial to 'fix', when the multi-sourced file does not have choices
in it, that is only bools, strings, ints... Just yank the 6-or-so lines that
are responsible for the check.

But now, if the multi-included file has a choice in it, as in [2], then
mconf whines again
  common.in:9:warning: choice value used outside its choice group
  common.in:13:warning: choice value used outside its choice group

Those are just warnings, easy to yank, but what are the real implications?
In my special case, the choice is only to be displayed _once_, as the three
components are mutually exclusive.

But, it refuses to show the choice from the second (and subsequent) sourcings.
Of course, only one component is selected at a time (manually guaranteed,
or even enforced by a more complex structure in config.in).

For the component-1, we get the expected display (common does not depend on
C1_A, here):
  --- comp-1
  [ ]   C1_A (NEW)
        *** common ***
        Get one free (All A)  --->

For component-2, the choice is missing (common depends on C2_A, here, but
it does not matter if it does not):
  --- comp-2
  [*]   C2_A
          *** common ***
          Get one free

I am sure there are, or at least there was at some point in the past, good
reasons for refusing to multi-source a file, and to refuse having the same
boolean in different choices. I can really understand that we could get in
a impossible configuration (eg. [3]). Is that still true?

Is it possible to find a solution to these kinds of setup?
Would a SAT solver [4] be of any help in this case?

Sorry for the long mail, and thank you for your attention.

Regards,
Yann E. MORIN.

[0] http://ymorin.is-a-geek.org/projects/crosstool

[1] Example of multi-sourced file:
    ---8<---
    $ cat config.in
    |comment "Select only one amongst those three:"
    |source component-1.in
    |source component-2.in
    |source component-3.in

    $ cat component-1.in
    |menuconfig COMP_1
    |    bool
    |    prompt "comp-1"
    |
    |if COMP_1
    |
    |config C1_A
    |    bool
    |    prompt "C1_A"
    |
    |source "common.in"
    |
    |endif # COMP_1

    $ cat component-2.in
    |menuconfig COMP_2
    |    bool
    |    prompt "comp-2"
    |
    |if COMP_2
    |
    |config C2_A
    |    bool
    |    prompt "C2_A"
    |
    |if C2_A
    |source "common.in"
    |endif # C2_A
    |
    |endif # COMP_2

    $ cat component-3.in
    |menuconfig COMP_3
    |    bool
    |    prompt "comp-3"
    |
    |if COMP_3
    |
    |config C3_A
    |    bool
    |    prompt "C3_A"
    |
    |endif # COMP_3

    $ cat common.in
    |comment "common"
    |
    |config ALL_A
    |    bool
    |    prompt "All A"
    ---8<---

[2] Multi-included with a choice:
    ---8<---
    $ cat common.in
    |comment "common"
    |
    |choice
    |    bool
    |    prompt "Get one free"
    |
    |config ALL_A
    |    bool
    |    prompt "All A"
    |
    |config ALL_B
    |    bool
    |    prompt "All B"
    |
    |endchoice
    ---8<---

[3] Conflicting choices:
    ---8<---
    $ cat conflict.in
    |choice
    |    bool
    |    prompt "Get one here"
    |
    |config C1_A
    |    bool
    |    prompt "C1_A"
    |
    |config C1_B
    |    bool
    |    prompt "C1_B"
    |
    |endchoice
    |
    |choice
    |    bool
    |    prompt "And another one here"
    |
    |config C1_A
    |    bool
    |    prompt "C1_A"
    |
    |config C1_B
    |    bool
    |    prompt "C1_B"
    |
    |endchoice
    ---8<--- 

[4] SAT solver as GSoC 2010:
    http://www.spinics.net/lists/linux-kbuild/msg02901.html
    http://userweb.kernel.org/~vegard/gsoc2010/proposal-short.html
By the way, what is the status of the SAT solver?

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
