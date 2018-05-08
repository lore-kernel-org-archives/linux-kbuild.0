Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:32968 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752239AbeEHL4f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 May 2018 07:56:35 -0400
Received: by mail-lf0-f51.google.com with SMTP id m18-v6so45442419lfb.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 May 2018 04:56:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQCMsoyKCLh+qVC1wpT3DEvxfssJO9==qRBk93FNJ_rVg@mail.gmail.com>
References: <20180507071134.5213-1-riku.voipio@linaro.org> <CAK7LNAQCMsoyKCLh+qVC1wpT3DEvxfssJO9==qRBk93FNJ_rVg@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Tue, 8 May 2018 14:56:32 +0300
Message-ID: <CAAqcGH=hi+DpYZRzZrbh+Zw8uD2YdGn83MB7pWfTY4o9Zna0kg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: deb-pkg improve maintainer address generation
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>, Mathieu Malaterre <malat@debian.org>

On 7 May 2018 at 16:35, Masahiro Yamada <yamada.masahiro@socionext.com> wro=
te:
> Hi Riku,
>
> 2018-05-07 16:11 GMT+09:00  <riku.voipio@linaro.org>:
>> From: Riku Voipio <riku.voipio@linaro.org>
>>
>> There is multiple issues with the genaration of maintainer string
>>
>> It uses DEBEMAIL and EMAIL enviroment variables, which may contain angle=
 brackets,
>> creating invalid maintainer strings. The documented KBUILD_BUILD_USER an=
d
>> KBUILD_BUILD_HOST variables are not used. Undocumented and uncommon NAME
>> variable is used.
>
> Sorry, I missed to ask you about 'NAME' variable.
>
>
> I checked the Debian Administrator's Handbook.
>
> I see the following description
>
>
>   TIP
>   Maintainer=E2=80=99s name and email address
>
>   Most of the programs involved in package maintenance will look for
> your name and
>   email address in the DEBFULLNAME and DEBEMAIL or EMAIL environment vari=
ables.
>   Defining them once and for all will avoid you having to type them
> multiple times.
>   If your usual shell is bash , it is a simple matter of adding the
> following two lines
>   in your ~/.bashrc file (you will obviously replace the values with
> more relevant
>   ones!):
>
>   export EMAIL=3D=E2=80=9Dhertzog@debian.org=E2=80=9D
>   export DEBFULLNAME=3D=E2=80=9DRaphael Hertzog=E2=80=9D
>
>
> Indeed, 'NAME' is not mentioned at all here.
>
>
> On the other hand, I also checked the following link
> referred by Mathieu:
> https://manpages.debian.org/unstable/devscripts/dch.1.en.html
>
>   If the environment variable DEBFULLNAME is set, this will be used for t=
he
>   maintainer full name; if not, then NAME will be checked. If the environ=
ment
>   variable DEBEMAIL is set, this will be used for the email address. If t=
his
>   variable has the form "name <email>", then the maintainer name will als=
o be
>   taken from here if neither DEBFULLNAME nor NAME is set.
>
>
> Hmm, debchange checks 'NAME' too.

dch is symlink to debchange. I found one common tool that falls back
from DEBFULLNAME to NAME, reportbug. But almost all other users of
DEBFULLNAME don't:

https://codesearch.debian.net/search?q=3DDEBFULLNAME&perpkg=3D1

Supporting DEBFULLNAME and DEBEMAIL makes sense, since they are
explicitly documented Debian variables. EMAIL is commonly used
elsewhere (such as with git). NAME otoh is is not used outside Debian.
And you will have a poor experience in Debian if you have only NAME
set - reportbug will use it, but bts wont.

The main reason to keep NAME, would be historic reasons ("has been
supported in deb-pkg before"). Given that setting a) either
DEBFULLNAME or KBUILD_BUILD_USER is trivial, and b) it's a cosmetic
issue to begin with, I'm not sure it's worth it.

Riku
