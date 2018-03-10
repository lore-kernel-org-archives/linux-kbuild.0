Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:38885 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752238AbeCJSo0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Mar 2018 13:44:26 -0500
Received: by mail-it0-f68.google.com with SMTP id j7-v6so6688933ita.3
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Mar 2018 10:44:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNASRLcaegdM8nWwqmw9mVMZvR7nQJTu8YuPya3Hse5z6PA@mail.gmail.com>
References: <CAK7LNASRLcaegdM8nWwqmw9mVMZvR7nQJTu8YuPya3Hse5z6PA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 10 Mar 2018 10:44:25 -0800
Message-ID: <CA+55aFxRjUCCKj6opiSrWw7gOC38yb+h7XivMrR0iMT-oRTxCg@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v4.16-rc5
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Mar 10, 2018 at 5:48 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Please pull more Kbuild fixes for v4.16.

Pulled.

And I really don't think these are the reason, but I wonder if you've
looked at why an empty build seems to have become slower lately?

I do "allmodconfig" builds between each pull, and it used to be in the
40+ second range. Now it's in the "just over a minute" range. That's
with absolutely nothing actually being built.

That "nothing rebuilt" is actually the big expense for me for the
later -rc handling, since it completely dominates when the pull
requests shrink (even if *something* gets rebuilt, the one minute for
the empty build is 90+% of the time).

It might not be kbuild that has triggered this, it might be something
else. But some trivial profiling shows that it's definitely pretty
much all in make, although 'modpost' does show up:

  83.18%  make
  11.30%  modpost
   5.10%  sh
   0.31%  cat
   0.03%  cc1
   0.01%  grep
   ...

The above was just from

    perf record -e cycles:pp make -j16

and then doing a

    perf report --sort=comm

to see a very high-level overview.

Pretty much all of the time in 'make' is spent on parsing, it seems:

   5.24%  make      [.] hash_find_slot
   3.86%  make      [.] __strlen_avx2
   3.76%  make      [.] _int_malloc
   3.25%  make      [.] target_environment
   2.82%  make      [.] __memmove_avx_unaligned_erms
   2.49%  make      [.] __strcmp_sse2_unaligned
   2.41%  modpost   [.] parse_file
   2.21%  make      [.] malloc
   2.18%  make      [.] 0x000000000001e1f3
   2.10%  make      [.] glob
   2.06%  make      [.] __strchr_avx2
   1.92%  make      [.] parse_variable_definition
   1.76%  make      [.] _int_free
   1.52%  make      [.] parse_file_seq
   1.49%  make      [.] find_next_token
   ....

and maybe it's 'make' that has gotten upgraded and slowed down, and
it's not our build system at all.

Yes, my build times continually do go up as the kernel grows, so
that's normal. It's just that there seems to have been a fairly big
jump in the last month or so.

I haven't tried to bisect anything, I thought I'd just mention it in
case you go "yeah, I'm aware.."

                     Linus
