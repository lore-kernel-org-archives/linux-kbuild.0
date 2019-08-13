Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17930 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729424AbfHMPAs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 11:00:48 -0400
MIME-Version: 1.0
References: <201908121448.4D023D7@keescook>
In-Reply-To: <201908121448.4D023D7@keescook>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Aug 2019 00:00:05 +0900
Message-ID: <CAK7LNASSkD3SzS5do1REjTe8n7RqUKsLGc2XwWJ7PKJ-z18Oig@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Parameterize kallsyms generation and correct reporting
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Aug 13, 2019 at 6:49 AM Kees Cook <keescook@chromium.org> wrote:
>
> When kallsyms generation happens, temporary vmlinux outputs are linked
> but the quiet make output doesn't report it, giving the impression that
> the prior command is taking longer than expected.
>
> Instead, report the KSYM step before the temporary linking. While at it,
> this consolidates the repeated "kallsyms generation step" into a single
> function and removes the existing copy/pasting.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Hmm, I did not notice this.

How about showing the link stage explicitly?
(Is it too verbose?)

  MODINFO modules.builtin.modinfo
  LD      .tmp_vmlinux1
  KSYMS   .tmp_kallsyms1.o
  LD      .tmp_vmlinux2
  KSYMS   .tmp_kallsyms2.o
  LD      vmlinux
  SORTEX  vmlinux


If this verbosity is OK,
you can move 'info LD  ${2}' into vmlinux_link()




Anyway, I like the clean-ups in this patch.

This is just my personal preference, but
may I ask two cosmetic changes?

[1] Could you move kallsyms_step()
    between  kallsyms() and mksysmap() ?
    I want to collect function definitions
    to the top of the script.

[2] Could you shorten 'kallsymso_previous'
    to 'kallsymso_prev' ?




-- 
Best Regards
Masahiro Yamada
