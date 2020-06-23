Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728447AbgFWC1R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jun 2020 22:27:17 -0400
Received: from omr2.cc.vt.edu (omr2.cc.ipv6.vt.edu [IPv6:2607:b400:92:8400:0:33:fb76:806e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24EE4C061573
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jun 2020 19:27:17 -0700 (PDT)
Received: from mr3.cc.vt.edu (mr3.cc.vt.edu [IPv6:2607:b400:92:8500:0:7f:b804:6b0a])
        by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id 05N2RE6G016598
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jun 2020 22:27:14 -0400
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
        by mr3.cc.vt.edu (8.14.7/8.14.7) with ESMTP id 05N2R9T3015649
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jun 2020 22:27:14 -0400
Received: by mail-qt1-f198.google.com with SMTP id l26so14709820qtr.14
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jun 2020 19:27:14 -0700 (PDT)
From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
Subject: Re: kbuild: separate kerneldoc warnings from compiler warnings
In-Reply-To: <CAK7LNARevD4o1WCRatKqZcf9-arxsvBcyLKHcNSM1ih+TDS5Mw@mail.gmail.com>
References: <591473.1592679153@turing-police>
 <CAK7LNARevD4o1WCRatKqZcf9-arxsvBcyLKHcNSM1ih+TDS5Mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1592879225_62491P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Mon, 22 Jun 2020 22:27:06 -0400
Message-ID: <771628.1592879226@turing-police>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

--==_Exmh_1592879225_62491P
Content-Type: text/plain; charset=us-ascii

On Mon, 22 Jun 2020 14:10:13 +0900, Masahiro Yamada said:

> > This patch introduces a new build flag 'K=1' which controls whether kerneldoc
> > warnings should be issued, separating them from the compiler warnings that W=
> > controls.

> I do not understand why this change is needed.

> IIRC, our goal was to enable this check by default.
> https://patchwork.kernel.org/patch/10030521/
> but there are so many warnings.

So are we getting any closer to actually achieving that goal?
I've done a fair number of cleanup patches to make the kernel
safe(r) to build with W=1, but there's still quite the pile.

And actually, if you want people to actually fix up the kerneldoc
issues, making it easier helps the chances of getting patches. If
somebody is in the mood to do kerneldoc clean-ups, having an easy
way to get just the kerneldoc messages rather than having to find
them mixed in with all the rest helps...

So I ran some numbers...

A plain "make" for an arm allmodconfig weighs in at 40,184 lines.

Building with K=1 produces 10,358 additional lines of output - that's what
needs patching if you want the kerneldocs cleaned up.

Building with W=1 (w/ this patch) adds 155,773 lines. Not A Typo. Of those, a
whole whopping 116,699 are complaints from DTS issues, and 39,074 for all other
gcc warnings. (Though I have 2 patches that I'll send later that will knock
about 3,000 off the "all other gcc warnings" numbers).

(And for completeness, building with C=1 for sparse adds 18,936 lines that say
'CHECK', and 56,915 lines of sparse warnings)

> Meanwhile, this is checked only when W= is given
> because 0-day bot tests with W=1 to
> block new kerneldoc warnings.

Looking at the numbers, I really need to say "So how is that working out for
us, anyhow?"

In particular, is it just flagging them, or do we have an actual procedure that
stops patches from being accepted if they add new kerneldoc warnings?

Another issue that needs to be considered is how high-quality a fix for a
kerneldoc warning is.  Getting rid of a warning by adding a comment line that
says the 3rd parameter is a pointer to a 'struct wombat' does nobody any good
if looking at the formal parameter list clearly states that the third parameter
is a 'struct wombat *foo'. Heck, I could probably create a Perl script that
automates that level of fixing.

But making an *informative* comment requires doing a bunch of research so that
you understand why *this* struct wombat is the one we care about (and whether
we care *so* much that somebody better be holding a lock....)

> K=1 ?   Do people need to learn this new switch?

--==_Exmh_1592879225_62491P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXvFoeQdmEQWDXROgAQL45g//RXlI5mcm9sTrsYpGogD7fPTZmf8rV5Ev
kwvwylKgIZwB0K1kBrK4tK8hgq9BErcMpEjKsCdJcpXNzbGiyfKSIYylxOQtdspA
nsENDIw4kh0HXOrbOJDpYyql58OKXKl5PPWLoQm8ZXWiLsMgo5mE7YAaLLoWxi3f
t6Q04i4rCL/PjtgF9IcZgoGRS49G+9HwuPHRlmPgzwYuKtn2Jx3nAGdA3sjEzIFr
J2G79OeRX88qwOxeehDcCM4AKbvjnsVichPrBJdcQh+n9kHdHJ+vrxvYtB644WFd
qAva/xY7gkptMX97yO9eAQiZF/xg2qF/lIkRcM9ETdMM42HNLc+jkjkxIUKrTwFA
Y4uqXWAzXi0vdZK+jAEWjgTnrrh1zIROY+6Uob11Zcp/vs9cCgtLFIdKMTndeh+/
D23ZcjHyc3WbYKkFVj3gAc30VG5/pIB8lQ7Fm75orP0agqf3jJUclYOLb2VC4GiM
HtplgK3ewJNkW4x3VDaNiOG0obFY6WnQgUxMsfLzGRmVEXEedshQ+3EapZPS0t0n
fHDbGbU8wZLHsCKkosyy8iin/lwGQzan/rW3R98PQSYz6uGLD0p/rZKAmbHGThee
Lqhn4oCZ+rBtgepfQhWACXwAmXBx6MthxJPMoveD2CVXh1IVc7c1cfaRq1O2vOn1
S0ApTLmmm9Q=
=5z/x
-----END PGP SIGNATURE-----

--==_Exmh_1592879225_62491P--
