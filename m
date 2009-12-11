Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.45.13]:42611 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756012AbZLKRBn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Dec 2009 12:01:43 -0500
Received: from wpaz17.hot.corp.google.com (wpaz17.hot.corp.google.com [172.24.198.81])
	by smtp-out.google.com with ESMTP id nBBH1n4K014165
	for <linux-kbuild@vger.kernel.org>; Fri, 11 Dec 2009 09:01:49 -0800
Received: from qyk15 (qyk15.prod.google.com [10.241.83.143])
	by wpaz17.hot.corp.google.com with ESMTP id nBBH1Gfm027596
	for <linux-kbuild@vger.kernel.org>; Fri, 11 Dec 2009 09:01:46 -0800
Received: by qyk15 with SMTP id 15so473166qyk.23
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Dec 2009 09:01:46 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?VmFkaW0gQmVuZGVidXJ5ICjQstCxKQ==?= <vbendeb@google.com>
Date: Fri, 11 Dec 2009 09:01:25 -0800
Message-ID: <3b09bd800912110901t106bb3a6td581537e151d5ce0@mail.gmail.com>
Subject: Re: [PATCH] wrap long help lines
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi Michal, thank you for your comments. Please see my further questions below:

2009/12/11 Michal Marek <mmarek@suse.cz>:
> Vadim Bendebury napsal(a):
>> Help text for certain config options is very extensive (the text includes all
>> config options which the option in question depends on). Long lines are not
>> wrapped, making it impossible to see the list.
>>
>> This patch adds a function to wrap long lines to fit the screen width and
>> makes sure the function is invoked after help text is prepared.
>
> Hi Vadim,
>
> I think that wrapping long lines in menuconfig is a good idea, but I
> have a few problems with your patch.
>

this was just an attempt to get the discussion going  :-)

>> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
>> index edd3f39..2aa49e8 100644
>> --- a/scripts/kconfig/expr.c
>> +++ b/scripts/kconfig/expr.c
>> @@ -1083,6 +1083,8 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
>>       }
>>       if (expr_compare_type(prevtoken, e->type) > 0)
>>               fn(data, NULL, ")");
>> +
>> +     str_screen_wrap(data, "||");
>>  }
>
> expr_print() is not the right place to do it. data is a opaque pointer,
> you can't assume that it's a pointer to struct gstr. qconf passes some
> class pointer here, there is code to dump symbol info to a filehandle.
> This should be done in the actual interface program, not in this generic
> code.
>

well, I picked this spot because this is where just the last line of
the text might require wrapping, this makes the wrapping function
simpler.

What do you think of mconf:show_help() before invoking
show_help_text() - is it the right spot to plug this in? Do you have a
suggestion?

> Also, why wrap at "||" but not "&&"? Try the help text for VGA_CONSOLE :).
>

good point. To keep things simple I could invoke the wrapper twice -
with "||" and then  "&&" as the break point string value?


>>  static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
>> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
>> index f379b0b..8fc69a3 100644
>> --- a/scripts/kconfig/lkc.h
>> +++ b/scripts/kconfig/lkc.h
>> @@ -112,6 +112,7 @@ struct gstr str_assign(const char *s);
>>  void str_free(struct gstr *gs);
>>  void str_append(struct gstr *gs, const char *s);
>>  void str_printf(struct gstr *gs, const char *fmt, ...);
>> +void str_screen_wrap(struct gstr *gs, const char *break_point);
>>  const char *str_get(struct gstr *gs);
>>
>>  /* symbol.c */
>> diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
>> index b6b2a46..f6c8930 100644
>> --- a/scripts/kconfig/util.c
>> +++ b/scripts/kconfig/util.c
>> @@ -7,6 +7,7 @@
>>
>>  #include <string.h>
>>  #include "lkc.h"
>> +#include <curses.h>
>
> This adds an unnecessary ncurses dependency to the other config interfaces.
>

yes, this did not feel right, the screen width should be passed in as
a parameter.

And this brings the main question: how do we tell the window width in
different modes? Do we care to do this wrap in other than text
terminal modes?


cheers,
/vb

>
>>  /* file already present in list? If not add it */
>>  struct file *file_lookup(const char *name)
>> @@ -131,3 +132,54 @@ const char *str_get(struct gstr *gs)
>>       return gs->s;
>>  }
>>
>> +static const char string_breaker[] = { '\\', '\n' };
>> +#define STRING_BREAKER_SIZE sizeof(string_breaker)
>> +/*
>> + * wrap long lines in the passed in strings. The lines are wrapped to fit into
>> + * the current screen width. The lines can be broken only at 'break points' -
>> + * passed in as the second parameter. A \<cr> (two characters) sequence is
>> + * instered after the appropriate break points to get the line wrapped to fit
>> + * the screen.
>> +*/
>> +void str_screen_wrap(struct gstr *data, const char *break_point)
>> +{
>> +     char *eol_location;
>> +     int total_length;
>> +     int screen_width = getmaxx(stdscr) - 10;
>> +     int break_point_size = strlen(break_point);
>> +
>> +     eol_location = strrchr(data->s, '\n');
>> +     if (!eol_location)
>> +             eol_location = data->s;
>> +
>> +     total_length = strlen(data->s) + 1; /* include trailing zero */
>> +
>> +     /* while last line's length exceeds screen width */
>> +     while ((total_length - (eol_location - data->s) - 1) > screen_width) {
>> +             char *prev_breakp;
>> +             char *breakp = eol_location;
>> +             do {
>> +                     prev_breakp = breakp;
>> +                     breakp = strstr(breakp + 1, break_point);
>> +             } while (breakp &&
>> +                      ((breakp - eol_location) < screen_width));
>> +
>> +             if (prev_breakp == eol_location) {
>> +                     /* no break_points found */
>> +                     return;
>> +             }
>> +
>> +             total_length += STRING_BREAKER_SIZE;
>> +             if (data->len < total_length) {
>> +                     data->s = realloc(data->s, total_length);
>> +                     data->len = total_length;
>> +             }
>> +             prev_breakp += break_point_size;
>> +
>> +             eol_location = prev_breakp + STRING_BREAKER_SIZE;
>> +             /* move the remainder of the string including trailing zero */
>> +             memmove(eol_location, prev_breakp, strlen(prev_breakp) + 1);
>> +             /* insert the line break */
>> +             memcpy(prev_breakp, string_breaker, STRING_BREAKER_SIZE);
>> +     }
>> +}
>
>
