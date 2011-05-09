Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:49029 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753308Ab1EIXBg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 May 2011 19:01:36 -0400
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: Choice visibility issue
Date: Tue, 10 May 2011 00:53:36 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201105100053.37010.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello All!

In case a choice appears in two places, and each instance depends on
different conditions, the visibility of the choice item is not coherent.

Take this simple example:

---8<--- BEGIN ---8<---
# cat toto.in
source toto-A.in
source toto-B.in

# cat toto-A.in
config A
    bool "A"
if A
choice C
    bool "C"
config C1
    bool "C1"
config C2
    bool "C2"
endchoice
endif # A

# cat toto-B.in
config B
    bool "B"
    depends on ! A
if B
choice C
    bool "C"
config C1
    bool "C1"
config C2
    bool "C2"
endchoice
endif # A
---8<---  END  ---8<---

If neither A not B is selected, the choice is not visible (expected):
  [ ] A
  [ ]   B
==> OK

If A is selected, then B is not visible (expected), and the choice is
visible directly below A (expected):
  [*] A
        C (C1)  --->
==> OK

If A is not selected but B is, the choice is visible twice, once just
below B (expected), and once just below A (unexpected):
  [ ] A
        C (C1)  --->
  [*]   B
          C (C1)  --->
==> KO

This last case is wrong IMHO. The choice should not be displayed just
below A, but only just below B.

The problem happens with all the frontends I was able to test with,
using linux-2.6.38.5 and linux-next dated yesterday:
- conf
- mconf
- nconf
- gconf

For the conf frontend, the issue happens only on the second run, not
on the first run, which somewhat makes sense. I was not able to run
xconfig, as I lack proper qt devel here.

So:
- is this a limitation that can not be overcome?
- if it can be overcome, where should I start to look at?
  (I'm not really fluent in flex/bison, and I got lost while
  trying to see in mconf where the visibility was computed...)

Some context:
I am using kconfig in crosstool-NG. In this context, A and B are two
different packages (glibc and eglibc) that share a common set of options,
of which the choice C (the kernel version to support). So the common
options are in a single file that is sourced twice, once from the glibc
config.in, and once from the eglibc.in (although the multiple sourcing
has not impact, as the example above demonstrates, and the two choices
can even be in a single file).

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
