Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39924 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730869AbeHGSoa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Aug 2018 14:44:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id j8-v6so8841636pff.6
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Aug 2018 09:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdkozP4t3AusfnKfrTmhyrXh4JW4m-ersfnoeTWXcMfJSw@mail.gmail.com>
 <20180807100822.GD31204@gate.crashing.org>
In-Reply-To: <20180807100822.GD31204@gate.crashing.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Aug 2018 09:29:13 -0700
Message-ID: <CAKwvOd=FARo+s_YKiRQYpTObdDHA=LmCQxtNkdRqsDY42Aztxg@mail.gmail.com>
Subject: Re: debugging kbuild
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: segher@kernel.crashing.org, rdunlap@infradead.org
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Aug 7, 2018 at 3:08 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Mon, Aug 06, 2018 at 04:31:14PM -0700, Nick Desaulniers wrote:
> > Is there a way to print the exact command that's being invoked from
> > Make? For example, some of the macro's in scripts/Kbuild.include are
> > tricky to unwind. Is there a way to dump each sub command being run?
>
> There always is strace...  Or maybe  make -dj  and friends.

Hmm...I'm debugging a 4.9 LTS based kernel. `make V=1` and `make -dj`
were things I tried, but don't seem to be printing the commands being
executed (only "Reading makefile ...") until the first warning is hit.
I wonder if someone is setting the quiet variable somehow, or if I'm
missing a patch...

Thanks for the ideas.
-- 
Thanks,
~Nick Desaulniers
