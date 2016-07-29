Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:55999 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095AbcG2KKz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Jul 2016 06:10:55 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Kbuild: Move -Wmaybe-uninitialized to W=1
Date: Fri, 29 Jul 2016 12:08:51 +0200
Message-ID: <19202646.LtBeEUK5Qq@wuerfel>
In-Reply-To: <CA+55aFxT4Wvg_yeKbiksoe5btDW59oW1SHK=JaBAJ-L3YGWxQQ@mail.gmail.com>
References: <20140616132045.GE8170@pd.tnic> <CA+55aFznBSQC+_KFq39eT2yTOd_cidqQ5viBLG6mshb_U_Y2EA@mail.gmail.com> <CA+55aFxT4Wvg_yeKbiksoe5btDW59oW1SHK=JaBAJ-L3YGWxQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, Michal Marek <mmarek@suse.com>, Borislav Petkov <bp@alien8.de>, Sam Ravnborg <sam@ravnborg.org>, lkml <linux-kernel@vger.kernel.org>, Michael Matz <matz@suse.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, x86-ml <x86@kernel.org>

On Thursday, July 28, 2016 2:22:02 PM CEST Linus Torvalds wrote:
> On Thu, Jul 28, 2016 at 12:03 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > And the new warnings were actually not so much due to new code in 4.7,
> > as the fact that in between I did a user-space upgrade, and gcc 6.1.1
> > has regressed to the point of the warnings being an unusable mess.
> 
> Actually, thinking more about this, I'm not convinced it's a gcc
> regression, because older gcc's have defainitely had the same problem
> with that warning causing tons of spurious issues.

Let me try to get to the bottom of this, maybe we can get the warning
back in the future. It has found a number of actual bugs. The majority
of -Wmaybe-uninitialized warnings that I fixed in linux-next were
false positives (maybe four out of five) but I would think the reason
for this is that most developers that get the warning for an actual
bug fix it right away, but some may have seen it and ignored it
as an obvious false positive.

> So it might actually mostly be due commit 877417e6ffb9 ("Kbuild:
> change CC_OPTIMIZE_FOR_SIZE definition"). As a result of that, we now
> end up not using CC_OPTIMIZE_FOR_SIZE for allmodconfig builds.

Correct, that was the intention. I tried my best to ensure that
all existing 'randconfig' warnings on ARM as well as 'defconfig' and
'allmodconfig' on x86 and powerpc got fixed before that patch
was merged, but evidently something went wrong there.

I'm normally testing with gcc-6.1 on ARM and did not find it to
be any worse than 4.9 or 5.3 for this warning here. I also did
some tests with gcc-6 on x86, but that showed a lot of /other/
warnings so I didn't look too closely at that. I'm installing
the latest gcc-6-branch version now to do some more tests on x86,
to see if gcc itself regressed, or something else caused the warnings
you see.

> And since for us, -Os always disabled that warning anyway (because gcc
> has always made a bad job of it), the bogus warnings didn't use to be
> so annoying and hide the real things.
> 
> Of course, a big part of the reasoning for that commit was apparently
> because Arnd liked the warning. It back-fired. Now that warning is
> gone for everybody, because it's so broken.

Makes sense. Some more background on this, as I've spent some significant
time on figuring out individual false-positive warnings:

The warning has always been enabled traditionally, and it was only
/disabled/ on allmodconfig by accident after my patch to turn it
off for -Os got merged after gcc-4.9 came out.

With gcc-4.8 and earlier, we had a number of false positives. This got
a lot better with "gcc-4.9 -O2" but worse with "gcc-4.9 -Os". On ARM,
I've managed to address all those warnings for randconfig builds,
in most cases by making the code more readable at the same time
(which helps both humans and the compiler to figure out when things
are initialized or not).

I am aware of two issues that made things worse again:

- The new jump-label-for-dynamic-debug patch caused one new warning
  on ARM (in media/dvb)
- x86 uses CONFIG_OPTIMIZE_INLINING on both defconfig and allmodconfig,
  whereas ARM does not. As this changes the inlining decisions, the
  compiler sees different initializations and reports a slightly differnet
  set of -Wmaybe-uninitialized warnings, both correct and incorrect.

Testing with today's linux tree and today's gcc-6.1 snapshot, I see
exactly these gcc warnings on x86 allmodconfig:x

arch/x86/crypto/aesni-intel_glue.c: In function 'helper_rfc4106_decrypt':
include/linux/scatterlist.h:124:36: error: 'dst_sg_walk.sg' may be used uninitialized in this function [-Werror=maybe-uninitialized]
drivers/media/dvb-frontends/cxd2841er.c: In function 'cxd2841er_tune_tc':
drivers/media/dvb-frontends/cxd2841er.c:3408:40: error: 'carrier_offset' may be used uninitialized in this function [-Werror=maybe-uninitialized]
drivers/sfi/sfi_core.c:175:53: error: self-comparison always evaluates to true [-Werror=tautological-compare]
drivers/sfi/sfi_core.c:195:71: error: self-comparison always evaluates to true [-Werror=tautological-compare]

The cxd2841er.c warning was introduced by the jump-label change
I mentioned, and I submitted a patch for that on the day it appeared.

I can certainly do another patch for the aesni-intel_glue.c warning
(I think avoiding the warning will also make the code more efficient),
but I don't see the pile of other warnings you mentioned, so I wonder
what else differs between our configurations.

	Arnd
