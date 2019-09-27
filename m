Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25430 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfI0J56 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 05:57:58 -0400
MIME-Version: 1.0
References: <20190927093603.9140-1-yamada.masahiro@socionext.com> <20190927093603.9140-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190927093603.9140-2-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 27 Sep 2019 18:56:55 +0900
Message-ID: <CAK7LNATamQYGDj0CQCn6Fg-+tNykfGqFzhjFxUyoGYxn2DSKgA@mail.gmail.com>
Subject: Re: [PATCH 1/7] modpost: fix broken sym->namespace for external
 module builds
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Matthias Maennich <maennich@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>, Will Deacon <will.deacon@arm.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Sep 27, 2019 at 6:37 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Currently, external module builds produce tons of false-positives:
>
>   WARNING: module <mod> uses symbol <sym> from namespace <ns>, but does not import it.
>
> Here, the <ns> part shows a random string.
>
> When you build external modules, the symbol info of vmlinux and
> in-kernel modules are read from $(objtree)/Module.symvers, but
> read_dump() is buggy in multiple ways:
>
> [1] When the modpost is run for vmlinux and in-kernel modules,
> sym_extract_namespace() correctly allocates memory for the namespace.
> On the other hand, read_dump() does not, then sym->namespace will
> point to somewhere in the line buffer of get_next_line(). The data
> in the buffer will be replaced soon, and sym->namespace will end up
> with pointing to unrelated data. As a result, check_exports() will
> show random strings in the warning messages.
>
> [2] When there is no namespace, sym_extract_namespace() returns NULL.
> On the other hand, read_dump() sets namespace to an empty string "".
> (but, it will be later replaced with unrelated data due to bug [1].)
> The check_exports() shows a warning unless exp->namespace is NULL,
> so every symbol read from read_dump() emits the warning, which is
> mostly false positive.
>
> To address [1], I added NOFAIL(strdup(...)) to allocate memory.
> For [2], I changed the if-conditional in check_exports().
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Fixes: cb9b55d21fe0 ("modpost: add support for symbol namespaces")


-- 
Best Regards
Masahiro Yamada
