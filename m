Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:44367 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbeIDE4p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Sep 2018 00:56:45 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id w840Y2Of001602
        for <linux-kbuild@vger.kernel.org>; Tue, 4 Sep 2018 09:34:03 +0900
Received: by mail-ua1-f53.google.com with SMTP id q7-v6so1537649uam.12
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Sep 2018 17:34:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5B8D247E02000078001E48EC@prv1-mh.provo.novell.com>
References: <5B8563A702000078001E2A82@prv1-mh.provo.novell.com> <5B8D247E02000078001E48EC@prv1-mh.provo.novell.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 4 Sep 2018 09:33:21 +0900
Message-ID: <CAK7LNAQR55Atady5uV4aWRRaV3zLLP19=bCxPQg5dfnRZgJ9uA@mail.gmail.com>
Subject: Re: [PATCH v2] kallsyms: reduce size a little on 64-bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

2018-09-03 21:09 GMT+09:00 Jan Beulich <JBeulich@suse.com>:
> Both kallsyms_num_syms and kallsyms_markers[] don't really need to use
> unsigned long as their (base) types; unsigned int fully suffices.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Drop unrelated hunk.
> ---

Applied to linux-kbuild/fixes.  Thanks!


>  kernel/kallsyms.c  |    4 ++--
>  scripts/kallsyms.c |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> --- 4.19-rc2/kernel/kallsyms.c
> +++ 4.19-rc2-kallsyms-reduce-size/kernel/kallsyms.c
> @@ -37,7 +37,7 @@ extern const u8 kallsyms_names[] __weak;
>   * Tell the compiler that the count isn't in the small data section if the arch
>   * has one (eg: FRV).
>   */
> -extern const unsigned long kallsyms_num_syms
> +extern const unsigned int kallsyms_num_syms
>  __attribute__((weak, section(".rodata")));
>
>  extern const unsigned long kallsyms_relative_base
> @@ -46,7 +46,7 @@ __attribute__((weak, section(".rodata"))
>  extern const u8 kallsyms_token_table[] __weak;
>  extern const u16 kallsyms_token_index[] __weak;
>
> -extern const unsigned long kallsyms_markers[] __weak;
> +extern const unsigned int kallsyms_markers[] __weak;
>
>  /*
>   * Expand a compressed symbol data into the resulting uncompressed string,
> --- 4.19-rc2/scripts/kallsyms.c
> +++ 4.19-rc2-kallsyms-reduce-size/scripts/kallsyms.c
> @@ -405,7 +405,7 @@ static void write_src(void)
>         }
>
>         output_label("kallsyms_num_syms");
> -       printf("\tPTR\t%u\n", table_cnt);
> +       printf("\t.long\t%u\n", table_cnt);
>         printf("\n");
>
>         /* table of offset markers, that give the offset in the compressed stream
> @@ -434,7 +434,7 @@ static void write_src(void)
>
>         output_label("kallsyms_markers");
>         for (i = 0; i < ((table_cnt + 255) >> 8); i++)
> -               printf("\tPTR\t%d\n", markers[i]);
> +               printf("\t.long\t%u\n", markers[i]);
>         printf("\n");
>
>         free(markers);
>
>
>
>



-- 
Best Regards
Masahiro Yamada
