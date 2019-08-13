Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42097 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfHMGdc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 02:33:32 -0400
Date: Mon, 12 Aug 2019 23:33:27 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v2] kbuild: Change fallthrough comments to attributes
Message-ID: <20190813063327.GA46858@archlinux-threadripper>
References: <20190812214711.83710-1-nhuck@google.com>
 <20190812221416.139678-1-nhuck@google.com>
 <814c1b19141022946d3e0f7e24d69658d7a512e4.camel@perches.com>
 <CAKwvOdnpXqoQDmHVRCh0qX=Yh-8UpEWJ0C3S=syn1KN8rB3OGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnpXqoQDmHVRCh0qX=Yh-8UpEWJ0C3S=syn1KN8rB3OGQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Joe Perches <joe@perches.com>, Nathan Huckleberry <nhuck@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux Memory Management List <linux-mm@kvack.org>, clang-built-linux <clang-built-linux@googlegroups.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

On Mon, Aug 12, 2019 at 04:11:26PM -0700, Nick Desaulniers wrote:
> Correct, Nathan is currently implementing support for attribute
> fallthrough in Clang in:
> https://reviews.llvm.org/D64838
> 
> I asked him in person to evaluate how many warnings we'd see in an
> arm64 defconfig with his patch applied.  There were on the order of
> 50k warnings, mostly from these headers.  I asked him to send these
> patches, then land support in the compiler, that way should our CI
> catch fire overnight, we can carry out of tree fixes until they land.
> With the changes here to Makefile.extrawarn, we should not need to
> carry any out of tree patches.

I think that if we are modifying this callsite to be favorable to clang,
we should consider a straight revert of commit bfd77145f35c ("Makefile:
Convert -Wimplicit-fallthrough=3 to just -Wimplicit-fallthrough for
clang"). It would save us a change in scripts/Makefile.extrawarn and
tying testing of this warning to W=1 will make the build noisy from
all of the other warnings that we don't care about plus we will need to
revert that change once we have finished the conversion process anyways.
I think it is cleaner to just pass KCFLAGS=-Wimplicit-fallthrough to
make when testing so that just that additional warning appears but
that is obviously subjective.

> > You might consider trying out the scripted conversion tool
> > attached to this email:
> >
> > https://lore.kernel.org/lkml/61ddbb86d5e68a15e24ccb06d9b399bbf5ce2da7.camel@perches.com/

I gave the script a go earlier today and it does a reasonable job at
convering the comments to the fallthrough keyword. Here is a list of
the warnings I still see in an x86 allyesconfig build with D64838 on
next-20190812:

https://gist.github.com/ffbd71b48ba197837e1bdd9bb863b85f

I have gone through about 20-30 of them and while there are a few missed
conversion spots (which is obviously fine for a treewide conversion),
the majority of them come from a disagreement between GCC and Clang on
emitting a warning when falling through to a case statement that is
either the last one and empty or simply breaks..

Example: https://godbolt.org/z/xgkvIh

I have more information on our issue tracker if anyone else wants to
take a look: https://github.com/ClangBuiltLinux/linux/issues/636

I personally think that GCC is right and Clang should adapt but I don't
know enough about the Clang codebase to know how feasible this is. I
just know there will be even more churn than necessary if we have to
annotate all of those places, taking the conversion process from maybe a
release cycle to several.

Cheers,
Nathan
