Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:16529 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754306AbdDJQBo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Apr 2017 12:01:44 -0400
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com [209.85.213.178]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id v3AG1bXU026127
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Apr 2017 01:01:38 +0900
Received: by mail-yb0-f178.google.com with SMTP id i124so33975917ybc.3
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Apr 2017 09:01:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170403093545.ebn5lawttpfwbpbl@x230>
References: <20170223131008.13705-1-pvorel@suse.cz> <20170403093545.ebn5lawttpfwbpbl@x230>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 11 Apr 2017 01:01:36 +0900
Message-ID: <CAK7LNAQ0Az05tnvxSnMdKZh0U4r-1k7U+PKhmtZ5BGwxCFng5w@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] kconfig: menuconfig make "selected by:" readable
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>, Michal Marek <mmarek@suse.cz>

Hi Petr,

2017-04-03 18:35 GMT+09:00 Petr Vorel <pvorel@suse.cz>:
> Hi,
>
>> rev_dep expressions can get rather unwieldy, especially if a symbol is
>> selected by more than a handful of other symbols. Ie, it's possible to
>> have near endless expressions like:
>>    A && B && !C || D || F && (G || H) || [...]
>
>> Chop these expressions into actually readable chunks:
>>    - A && B && !C
>>    - D
>>    - F && (G || H)
>>    - [...]
>
>> Ie, transform the top level "||" tokens into newlines and prepend each
>> line with a minus. This makes the "Selected by:" blurb much easier to
>> read.
>
>> This also prevents trimming too long lines.
>
>> Based on patch from Paul Bolle.
>
>> Reported-by: Paul Bolle <pebolle@tiscali.nl>
>> Cc: Paul Bolle <pebolle@tiscali.nl>
>> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>> ---
>>  scripts/kconfig/expr.c | 16 +++++++++++++---
>>  scripts/kconfig/menu.c |  2 +-
>>  2 files changed, 14 insertions(+), 4 deletions(-)
>
>> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
>> index cbf4996dd9c1..4b4309b59349 100644
>> --- a/scripts/kconfig/expr.c
>> +++ b/scripts/kconfig/expr.c
>> @@ -1070,6 +1070,8 @@ struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2)
>>       return expr_get_leftmost_symbol(ret);
>>  }
>
>> +static int print_level = 0;
>> +
>>  void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
>>  {
>>       if (!e) {
>> @@ -1077,8 +1079,11 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
>>               return;
>>       }
>
>> -     if (expr_compare_type(prevtoken, e->type) > 0)
>> +     if (expr_compare_type(prevtoken, e->type) > 0) {
>> +             print_level++;
>>               fn(data, NULL, "(");
>> +     }
>> +
>>       switch (e->type) {
>>       case E_SYMBOL:
>>               if (e->left.sym->name)
>> @@ -1126,7 +1131,10 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
>>               break;
>>       case E_OR:
>>               expr_print(e->left.expr, fn, data, E_OR);
>> -             fn(data, NULL, " || ");
>> +             if (print_level == 0)
>> +                     fn(data, NULL, "\n  - ");
>> +             else
>> +                     fn(data, NULL, " || ");
>>               expr_print(e->right.expr, fn, data, E_OR);
>>               break;
>>       case E_AND:
>> @@ -1156,8 +1164,10 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
>>               break;
>>         }
>>       }
>> -     if (expr_compare_type(prevtoken, e->type) > 0)
>> +     if (expr_compare_type(prevtoken, e->type) > 0) {
>> +             print_level--;
>>               fn(data, NULL, ")");
>> +     }
>>  }
>
>>  static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
>> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
>> index e9357931b47d..3daf7b81637f 100644
>> --- a/scripts/kconfig/menu.c
>> +++ b/scripts/kconfig/menu.c
>> @@ -675,7 +675,7 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
>
>>       get_symbol_props_str(r, sym, P_SELECT, _("  Selects: "));
>>       if (sym->rev_dep.expr) {
>> -             str_append(r, _("  Selected by: "));
>> +             str_append(r, _("  Selected by: \n  - "));
>>               expr_gstr_print(sym->rev_dep.expr, r);
>>               str_append(r, "\n");
>>       }
>
> Any comment on this patch, please?


I noticed you added me in the To: list.

Basically I think this patch is a nice idea,
but I am not a Kconfig maintainer.  Sorry.
(I could pick up a really trivial one via kbuild tree somehow,
but I want this one to be handled by a person with expertise in the area.)

Yann E. MORIN is the Kconfig maintainer, but he has been
silent for a few years. I guess Kconfig needs a new maintainer.


Please take my comment just as a Kconfig user's point of view.

The git-log only mentions "select", but I notice this patch
also changes "depends on" format in a bit different way.

For example,

General setup  --->
     Kernel compression mode (Gzip)  --->


shows its help like this:

  Depends on: HAVE_KERNEL_GZIP  [=y]
  - HAVE_KERNEL_BZIP2 [=n]
  - HAVE_KERNEL_LZMA [=y]
  - HAVE_KERNEL_XZ [=y]
  - HAVE_KERNEL_LZO [=y]
  - HAVE_KERNEL_LZ4 [=y]

(the first dependency in the same line in the "Depends on")



-- 
Best Regards
Masahiro Yamada
