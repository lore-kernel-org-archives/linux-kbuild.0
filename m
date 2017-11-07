Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:24637 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932814AbdKGA2R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Nov 2017 19:28:17 -0500
MIME-Version: 1.0
In-Reply-To: <69422e77-ac67-d23f-59e2-c8d0df1819b6@imag.fr>
References: <1508993438-15325-1-git-send-email-yamada.masahiro@socionext.com>
 <alpine.DEB.2.20.1710260658330.17107@hadrien> <69422e77-ac67-d23f-59e2-c8d0df1819b6@imag.fr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 7 Nov 2017 09:27:23 +0900
Message-ID: <CAK7LNAQ9iXf1D3SWvX=GVWbEiwazDtsTBBaEhOO44PDRc5JqZw@mail.gmail.com>
Subject: Re: [PATCH] coccinelle: grep Options and Requires fields more precisely
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Nicolas Palix (LIG)" <Nicolas.Palix@imag.fr>
Cc: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>

2017-10-26 16:26 GMT+09:00 Nicolas Palix (LIG) <Nicolas.Palix@imag.fr>:
> Le 26/10/17 =C3=A0 06:59, Julia Lawall a =C3=A9crit :
>>
>>
>>
>> On Thu, 26 Oct 2017, Masahiro Yamada wrote:
>>
>>> Currently, the required version for badzero.cocci is picked up from
>>> its "Comments:" line since it contains the word "Requires".
>>>
>>> Surprisingly, ld-version.sh can extract the version number from the
>>> string "Requires Coccinelle version 1.0.0-rc20 or later", but this
>>> expectation is fragile.  Fix the .cocci file.  I removed "-rc20"
>>> because ld-version.sh cannot handle it.
>>
>>
>> OK.
>>
>>> Make the coccicheck script to see exact patterns for "Options:" and
>>> "Requires:" in order to avoid accidental matching to what just happens
>>> to appear in comment lines.
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>
>>
>> Thanks for checking on this!
>>
>> Acked-by: Julia Lawall <julia.lawall@lip6.fr>
>
> Acked-by: Nicolas Palix <nicolas.palix@imag.fr>
>
>>
>>> ---
>>>
>>>   scripts/coccicheck                    | 4 ++--
>>>   scripts/coccinelle/null/badzero.cocci | 2 +-
>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/scripts/coccicheck b/scripts/coccicheck
>>> index 3e21a1b..1bfa2d2 100755
>>> --- a/scripts/coccicheck
>>> +++ b/scripts/coccicheck
>>> @@ -168,8 +168,8 @@ OPTIONS=3D"$OPTIONS $SPFLAGS"
>>>   coccinelle () {
>>>       COCCI=3D"$1"
>>>
>>> -    OPT=3D`grep "Option" $COCCI | cut -d':' -f2`
>>> -    REQ=3D`grep "Requires" $COCCI | cut -d':' -f2 | sed "s| ||"`
>>> +    OPT=3D`grep "Options:" $COCCI | cut -d':' -f2`
>>> +    REQ=3D`grep "Requires:" $COCCI | cut -d':' -f2 | sed "s| ||"`
>>>       REQ_NUM=3D$(echo $REQ | ${DIR}/scripts/ld-version.sh)
>>>       if [ "$REQ_NUM" !=3D "0" ] ; then
>>>             if [ "$SPATCH_VERSION_NUM" -lt "$REQ_NUM" ] ; then
>>> diff --git a/scripts/coccinelle/null/badzero.cocci
>>> b/scripts/coccinelle/null/badzero.cocci
>>> index 5551da2..f597c80 100644
>>> --- a/scripts/coccinelle/null/badzero.cocci
>>> +++ b/scripts/coccinelle/null/badzero.cocci
>>> @@ -10,7 +10,7 @@
>>>   // Copyright: (C) 2012 Julia Lawall, INRIA/LIP6.  GPLv2.
>>>   // Copyright: (C) 2012 Gilles Muller, INRIA/LiP6.  GPLv2.
>>>   // URL: http://coccinelle.lip6.fr/
>>> -// Comments: Requires Coccinelle version 1.0.0-rc20 or later
>>> +// Requires: 1.0.0
>>>   // Options:
>>>
>>>   virtual patch
>>> --
>>> 2.7.4
>>>
>>>
>
>
> --
> Nicolas Palix
> http://lig-membres.imag.fr/palix/
>


Applied to linux-kbuild/misc.


--=20
Best Regards
Masahiro Yamada
