Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.33.17]:32757 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761574AbZLPE5Y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Dec 2009 23:57:24 -0500
Received: from spaceape13.eur.corp.google.com (spaceape13.eur.corp.google.com [172.28.16.147])
	by smtp-out.google.com with ESMTP id nBG4vMgA005130
	for <linux-kbuild@vger.kernel.org>; Wed, 16 Dec 2009 04:57:22 GMT
Received: from yxe42 (yxe42.prod.google.com [10.190.2.42])
	by spaceape13.eur.corp.google.com with ESMTP id nBG4vJtB026336
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Dec 2009 20:57:20 -0800
Received: by yxe42 with SMTP id 42so732608yxe.22
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Dec 2009 20:57:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B279021.6070508@suse.cz>
References: <3b09bd800912142246u2d069702n759e165553bddc9f@mail.gmail.com>
	<4B279021.6070508@suse.cz>
From: =?UTF-8?B?VmFkaW0gQmVuZGVidXJ5ICjQstCxKQ==?= <vbendeb@google.com>
Date: Tue, 15 Dec 2009 20:56:59 -0800
Message-ID: <3b09bd800912152056g40fab3f9q76aef60ccf525bd0@mail.gmail.com>
Subject: Re: [PATCH] wrap long help lines, take two
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

2009/12/15 Michal Marek <mmarek@suse.cz>:
> On 15.12.2009 07:46, Vadim Bendebury (вб) wrote:
>> Tested by running
>>
>> mkdir ../build/powerpc
>> ARCH=powerpc make menuconfig O=../build/powerpc
>
> Did you test this exact patch? :) I'm getting
>  HOSTCC  scripts/kconfig/zconf.tab.o

That's embarrassing, I was wondering if it would compile and then
forgot to check why it does not complain.. I never did anything with
git before, this is and missed the fact that the previous change was
lingering in my tree. This is taken care of now.

> In file included from scripts/kconfig/zconf.tab.c:2452:
> /home/mmarek/linux-2.6/scripts/kconfig/expr.c: In function
> ‘expr_print_gstr_helper’:
> /home/mmarek/linux-2.6/scripts/kconfig/expr.c:1103: warning: implicit
> declaration of function ‘getmaxx’
> /home/mmarek/linux-2.6/scripts/kconfig/expr.c:1103: error: ‘stdscr’
> undeclared (first use in this function)
> /home/mmarek/linux-2.6/scripts/kconfig/expr.c:1103: error: (Each
> undeclared identifier is reported only once
> /home/mmarek/linux-2.6/scripts/kconfig/expr.c:1103: error: for each
> function it appears in.)
> make[2]: *** [scripts/kconfig/zconf.tab.o] Error 1
>
> Anyway, it's better than the last version, but see comments below.
>
>> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
>> index 2aa49e8..203eb6d 100644
>> --- a/scripts/kconfig/expr.c
>> +++ b/scripts/kconfig/expr.c
>> @@ -1099,9 +1099,25 @@ void expr_fprint(struct expr *e, FILE *out)
>>
>>  static void expr_print_gstr_helper(void *data, struct symbol *sym,
>> const char *str)
>>  {
>> -       str_append((struct gstr*)data, str);
>> +       struct gstr *gs = (struct gstr*)data;
>> +       unsigned extra_length = strlen(str) + (sym ? 4 : 0);
>> +       const char *last_cr = strrchr(gs->s, '\n');
>> +       unsigned screen_width = getmaxx(stdscr) - 10;
>> +       unsigned last_line_length;
>> +
>> +       if (!last_cr) {
>> +               last_cr = gs->s;
>> +       }
>> +
>> +       last_line_length = strlen(gs->s) - (last_cr - gs->s);
>
> You can avoid recomputing all this if you store the state in a struct
> that gets passed as the data argument:
>
> struct somename {
>  struct gstr *gstr;
>  int width;
>  /* other bookkeeping stuff like last_line_length */
> }
>
> Then expr_gstr_print would just initialize an instance of this structure
> and pass it to expr_print as the callback argument.

I first thought about it, but decided against it, because the way it
is now it is a much more contained change. Yes, recalculating string
length every time is excessive, but in this particular case it is
harmless.I am also worried of the string modified elsewhere bypassing
the print helper function, which would take things out of sync and
cause corrupted data.

 Please take another look at this, I can change it, but I think a
smaller modification has merits.

> Also, computing the
> desired width should be done in mconf and passed to expr_gstr_print as
> an argument. First, the other config programs (conf, qconf and gconf)
> should not depend on ncurses (they can pass a zero, meaning no
> wrapping), second the getmaxx(stdscr) - 10 logic really belongs to
> mconf. If we make use of this feature in nconf, then there the right
> number be getmaxx(stdscr) - 12 or whatever, depending on the exact layout.
>
good point, I'll take care of this.

cheers,
/vb


> Michal
>
>> +
>> +       if ((last_line_length + extra_length) > screen_width) {
>> +               str_append(gs, "\\\n");
>> +       }
>> +
>> +       str_append(gs, str);
>>         if (sym)
>> -               str_printf((struct gstr*)data, " [=%s]",
>> sym_get_string_value(sym));
>> +               str_printf(gs, " [=%s]", sym_get_string_value(sym));
>>  }
>>
>>  void expr_gstr_print(struct expr *e, struct gstr *gs)
>> --
>> 1.5.4.3
>
>
