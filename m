Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:62854 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750795AbeEGG7s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 May 2018 02:59:48 -0400
MIME-Version: 1.0
In-Reply-To: <1522413619.15770.88.camel@fedoraproject.org>
References: <20180329180112.11055-1-labbott@redhat.com> <1522413619.15770.88.camel@fedoraproject.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 7 May 2018 15:58:57 +0900
Message-ID: <CAK7LNAR5ZtwWH1SPMJeVpPkB38+9FyZOAG4AmS7NQ8NqCo_t9Q@mail.gmail.com>
Subject: Re: [RFCv2 PATCH 0/3] Salted build ids via linker sections
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Wielaard <mjw@fedoraproject.org>
Cc: Laura Abbott <labbott@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H . J . Lu" <hjl.tools@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-03-30 21:40 GMT+09:00 Mark Wielaard <mjw@fedoraproject.org>:
> On Thu, 2018-03-29 at 11:01 -0700, Laura Abbott wrote:
>> I'm still mostly looking for feedback whether
>> this would be acceptable for merging or if we should just persue a
>> --build-id-salt in binutils.
>
> Personally I would go with this approach. It seems simple and it might
> take years before a new linker option is available everywhere.


Indeed.  This series is easier than --build-id-salt.

If you do not see any better solution, I can accept this.


BTW, when I read
https://fedoraproject.org/wiki/Changes/ParallelInstallableDebuginfo
I thought "we could reverse the symlink direction from debug file to
build-id file)"
sensible (but I understand it is not easy to change this way).


If two packages share an identical image,
one package can borrow the image from the other,
then the storage space will be saved.

So, having identical ID should be advantage,
but we actually see only disadvantage...




> To simplify things I think you could just always add the extra vdso
> .comment initialized to something like KERNELRELEASE. Which distros
> seem to update anyway to include their build number, so they wouldn't
> need to do anything special to "update the build salt".
>






-- 
Best Regards
Masahiro Yamada
