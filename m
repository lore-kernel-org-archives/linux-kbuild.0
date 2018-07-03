Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:58519 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932915AbeGCHhL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Jul 2018 03:37:11 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH 2/2] kconfig: fix comment for symbol flag SYMBOL_AUTO
In-Reply-To: <CAK7LNASQ6mJkn69BkLm40t8-dxJfdQJ+G0nBrtUCeU2hBN_b3Q@mail.gmail.com>
        (Masahiro Yamada's message of "Tue, 3 Jul 2018 00:14:52 +0900")
References: <ghd0wc58z6.fsf@lena.gouders.net>
        <20180629091237.16620-1-dirk@gouders.net>
        <20180629091237.16620-3-dirk@gouders.net>
        <CAK7LNASQ6mJkn69BkLm40t8-dxJfdQJ+G0nBrtUCeU2hBN_b3Q@mail.gmail.com>
Date: Tue, 03 Jul 2018 09:32:36 +0200
Message-ID: <ghzhz8wz8r.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> 2018-06-29 18:12 GMT+09:00 Dirk Gouders <dirk@gouders.net>:
>> I could not verify the comment for that symbol flag.
>
> Good catch.
> I forgot to fix up the comment
> in commit 104daea149c4.
>
>
>> I could only find that flag set for choices and the defconfig_list
>> symbol in a dump of all symbols, which corresponds to the only two
>> locations in the code where that flag is being set explicitely.
>>
>> Signed-off-by: Dirk Gouders <dirk@gouders.net>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> ---
>>  scripts/kconfig/expr.h | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
>> index 94a383b21df6..0f53e44f14d6 100644
>> --- a/scripts/kconfig/expr.h
>> +++ b/scripts/kconfig/expr.h
>> @@ -141,7 +141,9 @@ struct symbol {
>>  #define SYMBOL_OPTIONAL   0x0100  /* choice is optional - values can be 'n' */
>>  #define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
>>  #define SYMBOL_CHANGED    0x0400  /* ? */
>> -#define SYMBOL_AUTO       0x1000  /* value from environment variable */
>> +#define SYMBOL_AUTO       0x1000  /* Symbols of type choice and the
>> +                                  * symbol with option defconfig_list
>> +                                  * have this flag set */
>
> Hmm.  This explanation is not very helpful in my opinion.
> Could you reword that?
>
> In my understanding, symbols with SYMBOL_AUTO
> are never written out to file.

Yes, that's right, sym_calc_value() clears SYMBOL_WRITE for those
symbols and the comment should describe the effect of the flag, not it's
users.  I will read a bit more to see if the flag has more effects and
reword the comment.

Sidenote: probably, AUTO is a misnomer for this flag.  I would expect
something like automatically generated symbols but the symbols that have
this flag set are rather -- hmm, perhaps auxiliary symbols?

Dirk
