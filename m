Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41780 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbfAWI0t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Jan 2019 03:26:49 -0500
Date: Wed, 23 Jan 2019 18:26:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] kbuild: remove top-level built-in.a
References: <1547436479-10491-1-git-send-email-yamada.masahiro@socionext.com>
        <1547536378.afs6amsrzj.astroid@bobo.none>
        <CAK7LNAREyw=qhRO-Cvg4O2fOnbV=zVJDE_mRZcVTkKG+B1gkRQ@mail.gmail.com>
In-Reply-To: <CAK7LNAREyw=qhRO-Cvg4O2fOnbV=zVJDE_mRZcVTkKG+B1gkRQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1548231946.lwdxf373y2.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

Masahiro Yamada's on January 15, 2019 7:01 pm:
> Hi Nicholas,
>=20
>=20
> On Tue, Jan 15, 2019 at 5:07 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> Masahiro Yamada's on January 14, 2019 1:27 pm:
>> > The symbol table in the final archive is unneeded because it is passed
>> > to the linker after the --whole-archive option. Every object file in
>> > the archive is included in the link anyway.
>> >
>> > Pass thin archives from subdirectories directly to the linker, and
>> > remove the final archiving step.
>>
>> This seems like a good improvement. As far as I remember, it was slower
>> to do the final link without the index built. Maybe I was testing it
>> in a revision before moving those files into --whole-archive? If there
>> is no slowdown, then I have no objection.
>=20
>=20
> Thanks for the review.
>=20
>=20
> I measured the performance of scripts/link-vmlinux.sh with 'perf stat'.
> (20 times for each)
>=20
>=20
>=20
> Before this patch:
>=20
>  Performance counter stats for 'make vmlinux' (20 runs):
>=20
>        5.266796537 seconds time elapsed
>           ( +-  0.12% )
>=20
>=20
>=20
> After this patch:
>=20
>  Performance counter stats for 'make vmlinux' (20 runs):
>=20
>        4.945576395 seconds time elapsed
>=20
>=20
>=20
>=20
> So, the performance is slightly better.
>=20
> Maybe, does omitting the 'ar' save some time?

Wow yeah that's a good speedup and simplification to boot. Thanks for=20
checking it.

> Anyway, this commit is good.

Yes, it's a good improvement.

Thanks,
Nick
=
