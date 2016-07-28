Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:36009 "EHLO
	mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751450AbcG1VWF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2016 17:22:05 -0400
MIME-Version: 1.0
In-Reply-To: <CA+55aFznBSQC+_KFq39eT2yTOd_cidqQ5viBLG6mshb_U_Y2EA@mail.gmail.com>
References: <20140616132045.GE8170@pd.tnic> <20140616211405.GA7914@ravnborg.org>
 <20140624213835.GD15068@pd.tnic> <20140707105339.GA4776@pd.tnic>
 <20160728042011.GA25498@nazgul.tnic> <20160728082915.GA2349@gmail.com> <CA+55aFznBSQC+_KFq39eT2yTOd_cidqQ5viBLG6mshb_U_Y2EA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 28 Jul 2016 14:22:02 -0700
Message-ID: <CA+55aFxT4Wvg_yeKbiksoe5btDW59oW1SHK=JaBAJ-L3YGWxQQ@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: Move -Wmaybe-uninitialized to W=1
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.com>
Cc: Borislav Petkov <bp@alien8.de>, Sam Ravnborg <sam@ravnborg.org>, lkml <linux-kernel@vger.kernel.org>, Michael Matz <matz@suse.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, x86-ml <x86@kernel.org>

On Thu, Jul 28, 2016 at 12:03 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And the new warnings were actually not so much due to new code in 4.7,
> as the fact that in between I did a user-space upgrade, and gcc 6.1.1
> has regressed to the point of the warnings being an unusable mess.

Actually, thinking more about this, I'm not convinced it's a gcc
regression, because older gcc's have defainitely had the same problem
with that warning causing tons of spurious issues.

So it might actually mostly be due commit 877417e6ffb9 ("Kbuild:
change CC_OPTIMIZE_FOR_SIZE definition"). As a result of that, we now
end up not using CC_OPTIMIZE_FOR_SIZE for allmodconfig builds.

And since for us, -Os always disabled that warning anyway (because gcc
has always made a bad job of it), the bogus warnings didn't use to be
so annoying and hide the real things.

Of course, a big part of the reasoning for that commit was apparently
because Arnd liked the warning. It back-fired. Now that warning is
gone for everybody, because it's so broken.

                   Linus
