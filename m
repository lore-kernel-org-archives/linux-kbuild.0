Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:33365 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752187AbeBFI5a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Feb 2018 03:57:30 -0500
Received: by mail-ot0-f196.google.com with SMTP id q9so1047524oti.0
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Feb 2018 00:57:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNATPwA1uyqPbACtV5_9DFjGOv7gsZ=4i4-VtsPR2Wx_qLA@mail.gmail.com>
References: <20180128225651.1134-1-mforney@mforney.org> <CAK7LNATPwA1uyqPbACtV5_9DFjGOv7gsZ=4i4-VtsPR2Wx_qLA@mail.gmail.com>
From: Michael Forney <mforney@mforney.org>
Date: Tue, 6 Feb 2018 00:57:28 -0800
Message-ID: <CAGw6cBv9d9xEQrU18pTivReKafq44o_PU1jpBVV42mbwNMnUug@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Improve portability of some sed invocations
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 2018-02-06, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> 2018-01-29 7:56 GMT+09:00 Michael Forney <mforney@mforney.org>:
>> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
>> index a18bca720995..7328394cf9e8 100755
>> --- a/scripts/headers_install.sh
>> +++ b/scripts/headers_install.sh
>> @@ -31,13 +31,13 @@ trap 'rm -f "$OUTDIR/$FILE" "$OUTDIR/$FILE.sed"' EXIT
>>  for i in "$@"
>>  do
>>         FILE="$(basename "$i")"
>> -       sed -r \
>> -               -e 's/([ \t(])(__user|__force|__iomem)[ \t]/\1/g' \
>> -               -e 's/__attribute_const__([ \t]|$)/\1/g' \
>> +       sed -E \
>> +               -e 's/([        (])(__user|__force|__iomem)[    ]/\1/g' \
>> +               -e 's/__attribute_const__([     ]|$)/\1/g' \
>
> I am afraid this is unreadable.
>
> Does [[:SPACE:]] work?

Yep, I can resend with [[:space:]] instead of the literal <tab>.

Thanks for taking a look.
