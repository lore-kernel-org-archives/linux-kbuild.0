Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:33612 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750910AbeBWKJv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Feb 2018 05:09:51 -0500
Received: by mail-vk0-f68.google.com with SMTP id w201so4992132vkw.0
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Feb 2018 02:09:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1jtOWVzJFQjSjqbGHZSGGMkii1Bi5qpdAG1AvWjPKbLg@mail.gmail.com>
References: <20180223060901.4052-1-ulfalizer@gmail.com> <CAFkk2KQPjeyE-E_TW3NBwFXbE-Q2mNnn1yAFkoA5w6xLQQ9hrw@mail.gmail.com>
 <CAK8P3a1jtOWVzJFQjSjqbGHZSGGMkii1Bi5qpdAG1AvWjPKbLg@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 23 Feb 2018 11:09:50 +0100
Message-ID: <CAFkk2KSA70OePwmMqyoPA5cYEJp-Jni2fa9-MHM1_XhvFhv-Cg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: do not write 'n' defaults to .config
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Sam Ravnborg <sam@ravnborg.org>

On Fri, Feb 23, 2018 at 10:59 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Feb 23, 2018 at 7:14 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
>> On Fri, Feb 23, 2018 at 7:09 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
>
>>>  scripts/kconfig/symbol.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
>>> index cca9663be5dd..02eb8b10a83c 100644
>>> --- a/scripts/kconfig/symbol.c
>>> +++ b/scripts/kconfig/symbol.c
>>> @@ -403,9 +403,10 @@ void sym_calc_value(struct symbol *sym)
>>>                         if (!sym_is_choice(sym)) {
>>>                                 prop = sym_get_default_prop(sym);
>>>                                 if (prop) {
>>> -                                       sym->flags |= SYMBOL_WRITE;
>>>                                         newval.tri = EXPR_AND(expr_calc_value(prop->expr),
>>>                                                               prop->visible.tri);
>>> +                                       if (newval.tri != no)
>>> +                                               sym->flags |= SYMBOL_WRITE;
>>>                                 }
>>>                                 if (sym->implied.tri != no) {
>>>                                         sym->flags |= SYMBOL_WRITE;
>>> --
>>> 2.14.1
>>>
>>
>> This stuff gets pretty obscure, so please tell me if you can think of
>> any practical benefits to remembering an n default as a user selection
>> for non-visible symbols (which is all '# CONFIG_FOO is not set' does
>> in practice). I couldn't think of anything.
>
> I had to read the patch description twice to see that you are only
> changing the invisible symbols. This seems fine for any automated
> interaction with the .config file.

Yeah... maybe a patch title like "kconfig: only write '# CONFIG_FOO is
not set' for visible symbols" would make it clearer (or something to
that effect early on in the commit message).

>
> The only possible downside I can think of is that it's sometimes easier
> to see the '# CONFIG_FOO is unset' when using 'grep CONFIG_FOO
> .config' to see if something was set. On the other hand, I might
> edit .config and remove that line today, and then be surprised that
> 'make oldconfig' doesn't ask me about it again (since it's invisible).

Note that it only affects symbols that get the value 'n' through an
explicit 'default'. You won't get a '# CONFIG_FOO is not set' for
n-valued invisible symbols without a 'default' property neither before
nor after this patch.

>
> So no, I don't see a strong reason against it either.
>
>      Arnd

Cheers,
Ulf
