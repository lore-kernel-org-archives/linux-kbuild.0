Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:55460 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934214AbdKGA2s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Nov 2017 19:28:48 -0500
MIME-Version: 1.0
In-Reply-To: <c18712da-6b47-3b13-059d-d49db738e386@imag.fr>
References: <1508993751-17218-1-git-send-email-yamada.masahiro@socionext.com> <c18712da-6b47-3b13-059d-d49db738e386@imag.fr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 7 Nov 2017 09:27:50 +0900
Message-ID: <CAK7LNARMTun58pa1Ew32SvQjR_u1Hg8mE-tDR_qqvztcx_Wnfg@mail.gmail.com>
Subject: Re: [PATCH] coccinelle: fix verbose message about .cocci file being run
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: nicolas.palix@univ-grenoble-alpes.fr
Cc: cocci@systeme.lip6.fr, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>

2017-10-26 16:22 GMT+09:00 Nicolas Palix (LIG) <Nicolas.Palix@imag.fr>:
> Le 26/10/17 =C3=A0 06:55, Masahiro Yamada a =C3=A9crit :
>>
>> If you run coccicheck with V=3D1 and COCCI=3D, you will see a strange
>> path to the semantic patch file.  For example, run the following:
>>
>> $ make V=3D1 COCCI=3Dscripts/coccinelle/free/kfree.cocci coccicheck
>>    [ snip ]
>>   The semantic patch that makes this report is available
>>   in scriptcoccinelle/free/kfree.cocci.
>>
>> Notice "s/" was dropped from "scripts/coccinelle/free/kfree.cocci".
>>
>> When running coccicheck without O=3D, $srctree is expanded to ".", which
>> represents one arbitrary character in the regular expression.  Using
>> sed is not a good choice here.  Strip $srctree/ simply without sed.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Acked-by: Nicolas Palix <nicolas.palix@imag.fr>
>>
>> ---

Applied to linux-kbuild/misc.


--=20
Best Regards
Masahiro Yamada
