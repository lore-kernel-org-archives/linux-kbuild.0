Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:33299 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753312AbcG2S0R (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Jul 2016 14:26:17 -0400
MIME-Version: 1.0
In-Reply-To: <20160729101932.GA27543@nazgul.tnic>
References: <20140616132045.GE8170@pd.tnic> <CA+55aFznBSQC+_KFq39eT2yTOd_cidqQ5viBLG6mshb_U_Y2EA@mail.gmail.com>
 <CA+55aFxT4Wvg_yeKbiksoe5btDW59oW1SHK=JaBAJ-L3YGWxQQ@mail.gmail.com>
 <19202646.LtBeEUK5Qq@wuerfel> <20160729101932.GA27543@nazgul.tnic>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 29 Jul 2016 11:26:16 -0700
Message-ID: <CA+55aFzuBLmHBz5zm4fWk_-1EnR9CkBKS-6h5ns1iBDEyVOp5Q@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: Move -Wmaybe-uninitialized to W=1
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Michal Marek <mmarek@suse.com>, Sam Ravnborg <sam@ravnborg.org>, lkml <linux-kernel@vger.kernel.org>, Michael Matz <matz@suse.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, x86-ml <x86@kernel.org>

On Fri, Jul 29, 2016 at 3:19 AM, Borislav Petkov <bp@alien8.de> wrote:
>
> So this is exactly the problem: we should not fix perfectly fine code
> just so that gcc remains quiet. So when you say "fixed false positives"
> you actually mean, "changed it so that gcc -Wmaybe-u... doesn't fire"
> right?
>
> And we should not do that.

It's perfectly fine to do that when it makes sense and doesn't make
the code worse. Adding a few unnecessary initializations to make the
compiler shut up is not a problem.

But in the cases I looked at, that *really* didn't make sense. The
pattern was along the lines of

  struct something var;

  if (initialize_var(&var) < 0)
     return error;

  .. use "var.xyz" .. - gcc complains that "var.xyz" may be uninitialized

and quite frankly,. the code made sense, and adding crazy
initializations for the fact that gcc has a shit-for-brains warning
didn't work well seemed to just make the code worse.

And there was no sane *pattern* to why some cases warned. We have
things like the above in many places. The issue seems to be that
"initialize_var()" needs to be inlined (automatically or explicitly
asked for), and then the error flow in the init function is just
complex enough.

At the point where it doesn't make sense when to initialize things
explicitly, and it changes randomly depending on compiler version and
compiler command line flags, there is *no* sane way to work around it.

We could do whack-a-mole with random code cases, but I really feel
that when the warning is that unreliable and the changes to the source
code to make the broken compiler warning shut up are completely
arbitrary and random, it's worse than useless.

                Linus
