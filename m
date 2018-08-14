Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:43938 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbeHNFcc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Aug 2018 01:32:32 -0400
MIME-Version: 1.0
In-Reply-To: <CAGXu5jLMr1+M7Xnt5HFi73fkhgh2YEwJyaPrFb0tQ2i8T0-i-Q@mail.gmail.com>
References: <20180813101435.17016-1-arekm@maven.pl> <CAGXu5jLMr1+M7Xnt5HFi73fkhgh2YEwJyaPrFb0tQ2i8T0-i-Q@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 14 Aug 2018 11:46:45 +0900
Message-ID: <CAK7LNARzA_X90g0if98U5jRrzGGYQkiqgN1+T9z84WWgDMi9Cg@mail.gmail.com>
Subject: Re: [PATCH] Support mksh as /bin/sh.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, arekm@maven.pl
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Nicholas Piggin <npiggin@gmail.com>

2018-08-14 7:32 GMT+09:00 Kees Cook <keescook@chromium.org>:
> On Mon, Aug 13, 2018 at 3:14 AM,  <arekm@maven.pl> wrote:
>> From: Arkadiusz Mi=C5=9Bkiewicz <arekm@maven.pl>
>>
>> mksh needs space between ! and ( to work properly. Otherwise this
>> happens:
>>
>> + make oldconfig
>> scripts/kconfig/conf  --oldconfig Kconfig
>> ./scripts/clang-version.sh[18]: COPYING: not found
>> printf: =E2=80=98__clang_major__=E2=80=99: expected a numeric value
>> printf: =E2=80=98__clang_minor__=E2=80=99: expected a numeric value
>> printf: =E2=80=98__clang_patchlevel__=E2=80=99: expected a numeric value
>> init/Kconfig:24:warning: 'CLANG_VERSION': number is invalid
>>
>> Signed-off-by: Arkadiusz Mi=C5=9Bkiewicz <arekm@maven.pl>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> -Kees
>

I could not find this patch in ML.


Arkadiusz,

Please resend this patch to

linux-kbuild@vger.kernel.org



>> ---
>>  scripts/clang-version.sh | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/clang-version.sh b/scripts/clang-version.sh
>> index dbf0a31eb111..e65fbc3079d4 100755
>> --- a/scripts/clang-version.sh
>> +++ b/scripts/clang-version.sh
>> @@ -12,7 +12,7 @@
>>
>>  compiler=3D"$*"
>>
>> -if !( $compiler --version | grep -q clang) ; then
>> +if ! ( $compiler --version | grep -q clang) ; then
>>         echo 0
>>         exit 1
>>  fi
>> --
>> 2.18.0
>>
>
>
>
> --
> Kees Cook
> Pixel Security



--=20
Best Regards
Masahiro Yamada
