Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:21514 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbfAOJC1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Jan 2019 04:02:27 -0500
MIME-Version: 1.0
References: <1547436479-10491-1-git-send-email-yamada.masahiro@socionext.com> <1547536378.afs6amsrzj.astroid@bobo.none>
In-Reply-To: <1547536378.afs6amsrzj.astroid@bobo.none>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 15 Jan 2019 18:01:34 +0900
Message-ID: <CAK7LNAREyw=qhRO-Cvg4O2fOnbV=zVJDE_mRZcVTkKG+B1gkRQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: remove top-level built-in.a
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

Hi Nicholas,


On Tue, Jan 15, 2019 at 5:07 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Masahiro Yamada's on January 14, 2019 1:27 pm:
> > The symbol table in the final archive is unneeded because it is passed
> > to the linker after the --whole-archive option. Every object file in
> > the archive is included in the link anyway.
> >
> > Pass thin archives from subdirectories directly to the linker, and
> > remove the final archiving step.
>
> This seems like a good improvement. As far as I remember, it was slower
> to do the final link without the index built. Maybe I was testing it
> in a revision before moving those files into --whole-archive? If there
> is no slowdown, then I have no objection.


Thanks for the review.


I measured the performance of scripts/link-vmlinux.sh with 'perf stat'.
(20 times for each)



Before this patch:

 Performance counter stats for 'make vmlinux' (20 runs):

       5.266796537 seconds time elapsed
          ( +-  0.12% )



After this patch:

 Performance counter stats for 'make vmlinux' (20 runs):

       4.945576395 seconds time elapsed




So, the performance is slightly better.

Maybe, does omitting the 'ar' save some time?


Anyway, this commit is good.


-- 
Best Regards
Masahiro Yamada
