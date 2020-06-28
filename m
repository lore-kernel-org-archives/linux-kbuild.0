Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:36936 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgF1HkC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 03:40:02 -0400
MIME-Version: 1.0
References: <591473.1592679153@turing-police> <CAK7LNARevD4o1WCRatKqZcf9-arxsvBcyLKHcNSM1ih+TDS5Mw@mail.gmail.com>
 <771628.1592879226@turing-police>
In-Reply-To: <771628.1592879226@turing-police>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jun 2020 16:38:57 +0900
Message-ID: <CAK7LNAQe+U_yJcJz+GKrLUL24xUo9sgk0uqy12PoVakMmKSuwg@mail.gmail.com>
Subject: Re: kbuild: separate kerneldoc warnings from compiler warnings
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jun 23, 2020 at 11:27 AM Valdis Kl=C4=93tnieks
<valdis.kletnieks@vt.edu> wrote:
>
> On Mon, 22 Jun 2020 14:10:13 +0900, Masahiro Yamada said:
>
> > > This patch introduces a new build flag 'K=3D1' which controls whether=
 kerneldoc
> > > warnings should be issued, separating them from the compiler warnings=
 that W=3D
> > > controls.
>
> > I do not understand why this change is needed.
>
> > IIRC, our goal was to enable this check by default.
> > https://patchwork.kernel.org/patch/10030521/
> > but there are so many warnings.
>
> So are we getting any closer to actually achieving that goal?
> I've done a fair number of cleanup patches to make the kernel
> safe(r) to build with W=3D1, but there's still quite the pile.
>
> And actually, if you want people to actually fix up the kerneldoc
> issues, making it easier helps the chances of getting patches. If
> somebody is in the mood to do kerneldoc clean-ups, having an easy
> way to get just the kerneldoc messages rather than having to find
> them mixed in with all the rest helps...
>
> So I ran some numbers...
>
> A plain "make" for an arm allmodconfig weighs in at 40,184 lines.
>
> Building with K=3D1 produces 10,358 additional lines of output - that's w=
hat
> needs patching if you want the kerneldocs cleaned up.
>
> Building with W=3D1 (w/ this patch) adds 155,773 lines. Not A Typo. Of th=
ose, a
> whole whopping 116,699 are complaints from DTS issues, and 39,074 for all=
 other
> gcc warnings. (Though I have 2 patches that I'll send later that will kno=
ck
> about 3,000 off the "all other gcc warnings" numbers).
>
> (And for completeness, building with C=3D1 for sparse adds 18,936 lines t=
hat say
> 'CHECK', and 56,915 lines of sparse warnings)
>
> > Meanwhile, this is checked only when W=3D is given
> > because 0-day bot tests with W=3D1 to
> > block new kerneldoc warnings.
>
> Looking at the numbers, I really need to say "So how is that working out =
for
> us, anyhow?"
>
> In particular, is it just flagging them, or do we have an actual procedur=
e that
> stops patches from being accepted if they add new kerneldoc warnings?
>
> Another issue that needs to be considered is how high-quality a fix for a
> kerneldoc warning is.  Getting rid of a warning by adding a comment line =
that
> says the 3rd parameter is a pointer to a 'struct wombat' does nobody any =
good
> if looking at the formal parameter list clearly states that the third par=
ameter
> is a 'struct wombat *foo'. Heck, I could probably create a Perl script th=
at
> automates that level of fixing.
>
> But making an *informative* comment requires doing a bunch of research so=
 that
> you understand why *this* struct wombat is the one we care about (and whe=
ther
> we care *so* much that somebody better be holding a lock....)
>
> > K=3D1 ?   Do people need to learn this new switch?



In my understanding, the intel 0-day bot tests
with W=3D1, and sends an alert for new warnings.

For example,
https://lkml.org/lkml/2020/6/27/328
This is a warning with W=3D1 builds.


So, new W=3D1 warnings will be blocked
(unless people ignore the 0-day bot).

Actually, the number of kernel-doc warnings are decreasing,
but we still have so many.
The progress depends on how much effort people will make.

It does not make much difference
if you separate out particular warnings
into a different switch.


One more thing, there is no need to add a new syntax
to separate out kernel-doc warnings.


W=3D1, W=3D2, W=3D3 can be combined.
Adding a new warning group, W=3Dd, is enough.
The following should work.



diff --git a/Makefile b/Makefile
index ac2c61c37a73..1e8428ca8f10 100644
--- a/Makefile
+++ b/Makefile
@@ -1597,11 +1597,12 @@ help:
        @echo  '                       (sparse by default)'
        @echo  '  make C=3D2   [targets] Force check of all c source with $=
$CHECK'
        @echo  '  make RECORDMCOUNT_WARN=3D1 [targets] Warn about
ignored mcount sections'
-       @echo  '  make W=3Dn   [targets] Enable extra build checks, n=3D1,2=
,3 where'
+       @echo  '  make W=3Dn   [targets] Enable extra build checks,
n=3D1,2,3,d where'
        @echo  '                1: warnings which may be relevant and
do not occur too often'
        @echo  '                2: warnings which occur quite often
but may still be relevant'
        @echo  '                3: more obscure warnings, can most
likely be ignored'
-       @echo  '                Multiple levels can be combined with
W=3D12 or W=3D123'
+       @echo  '                d: warnings from kernel-doc'
+       @echo  '                Multiple levels can be combined with
W=3D12 or W=3D123d'
        @echo  ''
        @echo  'Execute "make" or "make all" to build all targets
marked with [*] '
        @echo  'For further info see the ./README file'
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2e8810b7e5ed..1781b6ff16f0 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -100,7 +100,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
         cmd_force_checksrc =3D $(CHECK) $(CHECKFLAGS) $(c_flags) $<
 endif

-ifneq ($(KBUILD_EXTRA_WARN),)
+ifeq ($(KBUILD_EXTRA_WARN),d)
   cmd_checkdoc =3D $(srctree)/scripts/kernel-doc -none $<
 endif





But, you need to ask the 0-day maintainers to
change the flag W=3D1 into W=3D1d to keep the
current test coverage.


--
Best Regards
Masahiro Yamada
