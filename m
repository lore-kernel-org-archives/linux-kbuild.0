Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:31762 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbeI1IoG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Sep 2018 04:44:06 -0400
MIME-Version: 1.0
References: <20180815142749.18804-1-linux@rasmusvillemoes.dk> <CAKwiHFj5yGtsR+s0Ukjy0Pe1pDpd_euyT0MRZdTt0H3ssXqYXQ@mail.gmail.com>
In-Reply-To: <CAKwiHFj5yGtsR+s0Ukjy0Pe1pDpd_euyT0MRZdTt0H3ssXqYXQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 28 Sep 2018 11:21:41 +0900
Message-ID: <CAK7LNATmw1Tic2mDybRd-5CbZK_6J1+=3j31q8K9hONVoRHrdA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Kbuild: Some fixdep tweaks
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Rasmus,


2018=E5=B9=B49=E6=9C=8827=E6=97=A5(=E6=9C=A8) 3:58 Rasmus Villemoes <linux@=
rasmusvillemoes.dk>:
>
> On 15 August 2018 at 16:27, Rasmus Villemoes <linux@rasmusvillemoes.dk> w=
rote:
> > These patches eliminate two (albeit tiny and shortlived) processes
> > from the cmd_and_fixdep rule, i.e. from every TU being
> > compiled. Whether the diffstat below is worth it I'll leave to Kbuild
> > maintainers to decide.
>
> Ping.


Sorry for delay.
As far as I tested, the performance improvement was not noticeable level.

This patch set actually sits on the fence.
I tend to choose not-apply when I cannot make up my mind.


If you have something more to convince me, please let me know.


--=20
Best Regards
Masahiro Yamada
