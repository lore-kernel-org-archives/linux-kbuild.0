Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:38132 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbeILOuo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Sep 2018 10:50:44 -0400
MIME-Version: 1.0
References: <CALjTZvb4hOY_Hew-jEUtpyhkGbmh4Tgb0doPC6EaGtz_rMGt7A@mail.gmail.com>
 <ed2459210f8043999f1197e8c063601d@SOC-EX01V.e01.socionext.com>
In-Reply-To: <ed2459210f8043999f1197e8c063601d@SOC-EX01V.e01.socionext.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Wed, 12 Sep 2018 10:46:47 +0100
Message-ID: <CALjTZvYRkhbazB4BAMF-cmmDS4rKtGqH=+CkNmFaaRDUg+zHJg@mail.gmail.com>
Subject: Re: 4.19-rc3: bindeb-pkg target is failing on ppc64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: michal.lkml@markovi.net, ben@decadent.org.uk, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 12 Sep 2018 at 10:32, <yamada.masahiro@socionext.com> wrote:
>
> Hi, Rui,
>
>
>
> Could you cater to =E2=80=98git bisect=E2=80=99 ?
>
>
>
> Thanks
>
>
>
>
>
> Greetings! I'm having trouble building the kernel on my ppc64 machine (Po=
wer Mac G5) running Debian Sid. The make bindeb-pkg target is failing ever =
since 4.19-rc1. Is this a known issue? If not, let me know if you need anyt=
hing else in order to help debug this. Thanks in advance!

Hi! I never did a git bisection before, but I'll try that and get back
to you. Thanks!
