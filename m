Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:51574 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbgBEEms (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Feb 2020 23:42:48 -0500
MIME-Version: 1.0
References: <ced8ab1c-9c35-c7b0-6b9e-bcee7ffdf469@i-love.sakura.ne.jp>
 <CAK7LNATNY1oP5XgFH3+fuUU=Z7pEz7Sqz0vKCzvhM4Kem7RkOg@mail.gmail.com> <202002040408.01448ioc013868@www262.sakura.ne.jp>
In-Reply-To: <202002040408.01448ioc013868@www262.sakura.ne.jp>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 5 Feb 2020 13:42:07 +0900
Message-ID: <CAK7LNATD1p6KDYNLYmb+UZpVNOaLdFEp-QRm1waDX_v-sSZ1=w@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Invalidate all symbols after changing to y or m.
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>

Hi.

On Tue, Feb 4, 2020 at 1:09 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Since commit 89b9060987d98833 ("kconfig: Add yes2modconfig and
> mod2yesconfig targets.") forgot to clear SYMBOL_VALID bit after
> changing to y or m, these targets did not save the changes.
> Call sym_clear_all_valid() so that all symbols are revalidated.
>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>


My previous comment:
"sym_add_change_count(1); seems the convention way
to inform kconfig of some options being updated."
was misleading. Sorry.


conf_write() skips symbol invalidation
when conf_get_change() returns non-zero value.

        if (!conf_get_changed())
                sym_clear_all_valid();

I do not know why this if-conditional exists here...

Anyway, this patch fixes the issue.

Applied. Thanks.



> ---
>  scripts/kconfig/confdata.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 11f6c72c2eee..aa70360f27c1 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -1331,9 +1331,8 @@ void conf_rewrite_mod_or_yes(enum conf_def_mode mode)
>
>         for_all_symbols(i, sym) {
>                 if (sym_get_type(sym) == S_TRISTATE &&
> -                   sym->def[S_DEF_USER].tri == old_val) {
> +                   sym->def[S_DEF_USER].tri == old_val)
>                         sym->def[S_DEF_USER].tri = new_val;
> -                       sym_add_change_count(1);
> -               }
>         }
> +       sym_clear_all_valid();
>  }
> --
> 2.11.0
>


-- 
Best Regards
Masahiro Yamada
