Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:42567 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751123AbeBHCCh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Feb 2018 21:02:37 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNASr5yJ8HY8vRye12UyV7rcx_N=4Abz8fz9AQDh4y8TsYg@mail.gmail.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
 <1517877294-4826-2-git-send-email-yamada.masahiro@socionext.com>
 <CAFkk2KQNQV2GAXW+hyMvE+J5mMp+5g3SuYdcGA-JjGk5fE=VUA@mail.gmail.com> <CAK7LNASr5yJ8HY8vRye12UyV7rcx_N=4Abz8fz9AQDh4y8TsYg@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 8 Feb 2018 03:02:36 +0100
Message-ID: <CAFkk2KQ4K8k3HBpadC0nSq4eM8gt9ZNhGBetAcofMeY32opTCQ@mail.gmail.com>
Subject: Re: [PATCH 01/14] kconfig: send error messages to stderr
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Herbert <marc.herbert@intel.com>

On Thu, Feb 8, 2018 at 2:49 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2018-02-08 5:24 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
>> On Tue, Feb 6, 2018 at 1:34 AM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>> These messages should be directed to stderr.
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> ---
>>>
>>>  scripts/kconfig/conf.c  | 18 +++++++++++-------
>>>  scripts/kconfig/zconf.l | 27 +++++++++++++++------------
>>>  2 files changed, 26 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
>>> index 307bc3f..90a76aa2 100644
>>> --- a/scripts/kconfig/conf.c
>>> +++ b/scripts/kconfig/conf.c
>>> @@ -75,9 +75,11 @@ static void strip(char *str)
>>>  static void check_stdin(void)
>>>  {
>>>         if (!valid_stdin) {
>>> -               printf(_("aborted!\n\n"));
>>> -               printf(_("Console input/output is redirected. "));
>>> -               printf(_("Run 'make oldconfig' to update configuration.\n\n"));
>>> +               fprintf(stderr,
>>> +                       _("Aborted!\n"
>>> +                         "Console input/output is redirected.\n"
>>> +                         "Run 'make oldconfig' to update configuration.\n\n")
>>> +                       );
>>
>> This could use fputs() too, moving the stderr to the last argument.
>
>
> In general, I am not keen on replacement of (f)printf with (f)puts.
>
> If '%' does not appear in the format literal, compiler will automatically
> replace the function call with a faster one.
>
> My compiler replaced both fprintf(stderr, "blah\n") and fputs("blah\n", stderr)
> with fwrite.
>
> At this moment, right, the compiler cannot optimize it
> because it never knows the result of _(...).
>
> If we rip off the gettext things, it will be optimized.

No problem with me. Just some personal OCD. :)

>
>
>
>> I think the _() thingies around the strings are for gettext
>> (https://www.gnu.org/software/gettext/manual/html_node/Mark-Keywords.html).
>> This would break it if there are existing translations, since the
>> msgids change.
>
> Right.  I will keep  inside _(...) as-is just in case
> to not break gettext.
>
>
>
>
>> More practically, I doubt anyone is translating these tools. IMO we
>> should remove the gettext stuff unless we find traces of translations.
>
> I agree.  Probably, it should not hurt to eliminate gettext,
> but out of scope of this series.

Yeah, out of scope.

>
>
>>>                 exit(1);
>>>         }
>>>  }
>>> @@ -565,7 +567,7 @@ int main(int ac, char **av)
>>>                 }
>>>         }
>>>         if (ac == optind) {
>>> -               printf(_("%s: Kconfig file missing\n"), av[0]);
>>> +               fprintf(stderr, _("%s: Kconfig file missing\n"), av[0]);
>>>                 conf_usage(progname);
>>>                 exit(1);
>>>         }
>>> @@ -590,9 +592,11 @@ int main(int ac, char **av)
>>>                 if (!defconfig_file)
>>>                         defconfig_file = conf_get_default_confname();
>>>                 if (conf_read(defconfig_file)) {
>>> -                       printf(_("***\n"
>>> -                               "*** Can't find default configuration \"%s\"!\n"
>>> -                               "***\n"), defconfig_file);
>>> +                       fprintf(stderr,
>>> +                               _("***\n"
>>> +                                 "*** Can't find default configuration \"%s\"!\n"
>>> +                                 "***\n"),
>>> +                               defconfig_file);
>>>                         exit(1);
>>>                 }
>>>                 break;
>>> diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
>>> index 07e074d..0ba4900 100644
>>> --- a/scripts/kconfig/zconf.l
>>> +++ b/scripts/kconfig/zconf.l
>>> @@ -184,7 +184,9 @@ n   [A-Za-z0-9_-]
>>>                         append_string(yytext, 1);
>>>         }
>>>         \n      {
>>> -               printf("%s:%d:warning: multi-line strings not supported\n", zconf_curname(), zconf_lineno());
>>> +               fprintf(stderr,
>>> +                       "%s:%d:warning: multi-line strings not supported\n",
>>> +                       zconf_curname(), zconf_lineno());
>>
>> Whether stuff is translated seems inconsistent too.
>
>
> Right.  Many people change the same tool, it is difficult to
> keep the consistency.
>
>
>
>
>>>                 current_file->lineno++;
>>>                 BEGIN(INITIAL);
>>>                 return T_EOL;
>>> @@ -294,7 +296,7 @@ void zconf_initscan(const char *name)
>>>  {
>>>         yyin = zconf_fopen(name);
>>>         if (!yyin) {
>>> -               printf("can't find file %s\n", name);
>>> +               fprintf(stderr, "can't find file %s\n", name);
>>>                 exit(1);
>>>         }
>>>
>>> @@ -315,8 +317,8 @@ void zconf_nextfile(const char *name)
>>>         current_buf->state = YY_CURRENT_BUFFER;
>>>         yyin = zconf_fopen(file->name);
>>>         if (!yyin) {
>>> -               printf("%s:%d: can't open file \"%s\"\n",
>>> -                   zconf_curname(), zconf_lineno(), file->name);
>>> +               fprintf(stderr, "%s:%d: can't open file \"%s\"\n",
>>> +                       zconf_curname(), zconf_lineno(), file->name);
>>>                 exit(1);
>>>         }
>>>         yy_switch_to_buffer(yy_create_buffer(yyin, YY_BUF_SIZE));
>>> @@ -325,20 +327,21 @@ void zconf_nextfile(const char *name)
>>>
>>>         for (iter = current_file->parent; iter; iter = iter->parent ) {
>>>                 if (!strcmp(current_file->name,iter->name) ) {
>>> -                       printf("%s:%d: recursive inclusion detected. "
>>> -                              "Inclusion path:\n  current file : '%s'\n",
>>> -                              zconf_curname(), zconf_lineno(),
>>> -                              zconf_curname());
>>> +                       fprintf(stderr,
>>> +                               "%s:%d: recursive inclusion detected. "
>>> +                               "Inclusion path:\n  current file : '%s'\n",
>>> +                               zconf_curname(), zconf_lineno(),
>>> +                               zconf_curname());
>>>                         iter = current_file->parent;
>>>                         while (iter && \
>>>                                strcmp(iter->name,current_file->name)) {
>>> -                               printf("  included from: '%s:%d'\n",
>>> -                                      iter->name, iter->lineno-1);
>>> +                               fprintf(stderr, "  included from: '%s:%d'\n",
>>> +                                       iter->name, iter->lineno-1);
>>>                                 iter = iter->parent;
>>>                         }
>>>                         if (iter)
>>> -                               printf("  included from: '%s:%d'\n",
>>> -                                      iter->name, iter->lineno+1);
>>> +                               fprintf(stderr, "  included from: '%s:%d'\n",
>>> +                                       iter->name, iter->lineno+1);
>>>                         exit(1);
>>>                 }
>>>         }
>>> --
>>> 2.7.4
>>>
>>
>> The unrelated gettext stuff aside:
>>
>> Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
>>
>> Cheers,
>> Ulf
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Best Regards
> Masahiro Yamada

Cheers,
Ulf
