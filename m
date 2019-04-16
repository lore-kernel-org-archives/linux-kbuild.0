Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60402 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727136AbfDPTC7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Apr 2019 15:02:59 -0400
Date: Tue, 16 Apr 2019 21:02:56 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH v3 2/9] kbuild: Support for Symbols.list creation
In-Reply-To: <b2b5b57e-ae55-8e7b-f4f4-fa4f15194d77@redhat.com>
Message-ID: <alpine.LSU.2.21.1904162101150.9731@pobox.suse.cz>
References: <20190410155058.9437-1-joe.lawrence@redhat.com> <20190410155058.9437-3-joe.lawrence@redhat.com> <alpine.LSU.2.21.1904112100400.18787@pobox.suse.cz> <b2b5b57e-ae55-8e7b-f4f4-fa4f15194d77@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

On Tue, 16 Apr 2019, Joe Lawrence wrote:

> On 4/11/19 3:04 PM, Miroslav Benes wrote:
> > 
> >> diff --git a/samples/livepatch/Makefile b/samples/livepatch/Makefile
> >> index 2472ce39a18d..8b9b42a258ad 100644
> >> --- a/samples/livepatch/Makefile
> >> +++ b/samples/livepatch/Makefile
> >> @@ -1,3 +1,4 @@
> >> +LIVEPATCH_livepatch-sample := y
> >>   obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-sample.o
> >>   obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-shadow-mod.o
> >>   obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-shadow-fix1.o
> > 
> > We discussed this and I think there has been no conclusion yet. Shouldn't
> > we do the same (add LIVEPATCH_) for the other samples here as well?
> 
> In v2 review, I mentioned moving this hunk to ("modpost: Add modinfo flag to
> livepatch modules") along with the same change to the other sample modules.  I
> didn't apply that for v3, but can do so for the next spin if it makes the
> commits easier to review.

I think it belongs here, but I may be missing something. Anyway, it is not 
really important, so I'd leave it up to you.

Miroslav 
