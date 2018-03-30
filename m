Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:35660 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750725AbeC3Fb4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Mar 2018 01:31:56 -0400
MIME-Version: 1.0
In-Reply-To: <CAFkk2KT4_08348-3ecumBxBQqyCAyZEPgcNou5Le1hOtVk2aAA@mail.gmail.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
 <1522128575-5326-5-git-send-email-yamada.masahiro@socionext.com> <CAFkk2KT4_08348-3ecumBxBQqyCAyZEPgcNou5Le1hOtVk2aAA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 30 Mar 2018 14:30:49 +0900
Message-ID: <CAK7LNAQ2nTa28zmMdpYZnNkLa5uFnq=4WeCinCrNa=3fcHenoA@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] kconfig: reference environments directly and
 remove 'option env=' syntax
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>

2018-03-29 11:19 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:.

>>  %%
>> +static void expand_string(const char *in)
>> +{
>> +       char *p, *q;
>> +
>> +       p = expand_string_value(in);
>> +
>> +       q = p + strlen(p);
>> +       while (q > p)
>> +               unput(*--q);
>> +
>> +       free(p);
>> +}
>> +
>
> I like the simplicity of this approach, but I suspect it might be too simple.
>
> For example, the following breaks with a syntax error if $ENV has any
> double quotes in its value:
>
>     config FOO
>         string "foo"
>         default "$ENV"
>
> The following will only work as expected if $ENV expands to a valid
> Kconfig symbol name. If it doesn't, random stuff will happen (most
> likely a syntax error).
>
>     config FOO
>         string "foo"
>         default $ENV
>
> The reason it works if $ENV expands to a valid symbol name is that
> undefined symbols get their name as their (string) value. If the
> symbol happens to be defined, it will be referenced, which seems
> confusing too.
>
> In general, that reinterpretation of expanded values feels a bit icky
> to me, and as something that might add complexity to Kconfig for
> little value. If $ENV outside of quotes absolutely must be supported,
> I think it should be a shorthand for "$ENV" (which means "constant
> value" in Kconfig speak).
>

You are right.  This implementation is too lazy, and bad.
I will change the implementation.

Thanks.




-- 
Best Regards
Masahiro Yamada
