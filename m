Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:59158 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751957Ab1EUQzI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 May 2011 12:55:08 -0400
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: Inconsistency in dependency calculations
Date: Sat, 21 May 2011 18:55:03 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201105211855.03702.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello All!

Here I am again, with an inconstistency in the way forward dependencies are
computed. ;-)

Take this simple test-case for example:

    ---8<--- Config.in ---8<--
    config F
        bool "F"

    choice AB
        bool "AB"
    config A
        bool "A"
    config B
        bool "B"
    config C
        bool "C"
    endchoice

    if A
    config D
        bool
        default y if F
        select E
    config E
        bool "E"
    endif # A

    if B
    config D
        bool
        default y if F
        select E
    config E
        bool "E"
    endif # B
    ---8<--- END ---8<---

Then run:
  rm -f .config .config.old
  mconf Config.in

    [ ] F (NEW)
        AB (A)  --->
    [ ] E (NEW)

Then select F:

    [*] F      D) selects E which has unmet direct dependencies (B)
        AB (A)  --->
    -*- E

Notice the text following F. It is *not* a copy-paste error, I do really see
this text.

Now exit and save. Run mconf again, and exit staright away. Notice this
error mesage on the console:
    warning: (D) selects E which has unmet direct dependencies (B)

Now, run mconf again, select B in the choice (keep F selected). You get the
same warning on the console (expected, as it is printed before bringing up
the dialog menu, and we get to see it only when exiting, not when loading).

Now re-run mconf yet again and exit straight away. There is no warning this
time.

What I would expect for consistency: the warning is printed both when A or
B is selected, warning about direct dep B when A is selected, and conversely
when A is selected:
A selected:
    warning: (D) selects E which has unmet direct dependencies (B)
B selected:
    warning: (D) selects E which has unmet direct dependencies (A)

What I would expect in an ideal world: no warning is printed at all.

Behaves the same with kconfig in 2.6.39 and linux-next 20110520.

Of course, this example is only here to pin-point the mis-behavior. Fact is,
the real life example happens with a generated Config.in, so it is not possible
to turn the conditional into "if A || B".

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
