Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:39908 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750935AbeDXQIj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Apr 2018 12:08:39 -0400
MIME-Version: 1.0
In-Reply-To: <1841878132.11493.1524585595039@ox.credativ.com>
References: <20180424084408.28034-1-sedat.dilek@credativ.de>
 <CAK7LNATsJ2kvw4JMS-2WsU7a9wrqcYLmfHPBwQDwbAEVFa8E1g@mail.gmail.com> <1841878132.11493.1524585595039@ox.credativ.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 25 Apr 2018 01:07:55 +0900
Message-ID: <CAK7LNATY12vXUXLNgGXwjTFN1pnWF=kft1AYDGp=KxQp2Vr-Qg@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Fix typo s/HOST_LOADLIBES/HOST_LOADLIBS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@credativ.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

2018-04-25 0:59 GMT+09:00 Sedat Dilek <sedat.dilek@credativ.de>:
>> Masahiro Yamada <yamada.masahiro@socionext.com> hat am 24. April 2018 um=
 17:51 geschrieben:
>>
>>
>> 2018-04-24 17:44 GMT+09:00 Sedat Dilek <sedat.dilek@credativ.de>:
>> > Signed-off-by: Sedat Dilek <sedat.dilek@credativ.de>
>> > ---
>> >  Makefile | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/Makefile b/Makefile
>> > index 83b6c541565a..e1869dc08288 100644
>> > --- a/Makefile
>> > +++ b/Makefile
>> > @@ -366,7 +366,7 @@ HOSTCFLAGS   :=3D -Wall -Wmissing-prototypes -Wstr=
ict-prototypes -O2 \
>> >                 -fomit-frame-pointer -std=3Dgnu89 $(HOST_LFS_CFLAGS)
>> >  HOSTCXXFLAGS :=3D -O2 $(HOST_LFS_CFLAGS)
>> >  HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS)
>> > -HOST_LOADLIBES :=3D $(HOST_LFS_LIBS)
>> > +HOST_LOADLIBS :=3D $(HOST_LFS_LIBS)
>> >
>> >  # Make variables (CC, etc...)
>> >  AS             =3D $(CROSS_COMPILE)as
>> > @@ -433,7 +433,7 @@ LDFLAGS :=3D
>> >  GCC_PLUGINS_CFLAGS :=3D
>> >
>> >  export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS L=
D CC
>> > -export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
>> > +export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBS
>> >  export MAKE LEX YACC AWK GENKSYMS INSTALLKERNEL PERL PYTHON PYTHON2 P=
YTHON3 UTS_MACHINE
>> >  export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
>> >
>>
>> Why is this a typo?
>>
>>
>> Our Makefiles use HOST_LOADLIBES consistently.
>>
>
> OK. Do you happen to know why it is LOADLIB*E*S?


I do not know.  Historical convention.

LOADLIBES and/or LDLIBS is conventionally used.

You will see them by running 'make --print-data-base'





> - Sedat -
>
>>
>> $ git grep HOST_LOADLIB
>> Makefile:HOST_LOADLIBES :=3D $(HOST_LFS_LIBS)
>> Makefile:export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIB=
ES
>> scripts/Makefile.host:          $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
>> scripts/Makefile.host:                    $(HOST_LOADLIBES)
>> $(HOSTLOADLIBES_$(@F))
>> scripts/Makefile.host:                    $(HOST_LOADLIBES)
>> $(HOSTLOADLIBES_$(@F))
>> scripts/Makefile.host:                    $(HOST_LOADLIBES)
>> $(HOSTLOADLIBES_$(@F))
>> scripts/Makefile.host:                    $(HOST_LOADLIBES)
>> $(HOSTLOADLIBES_$(@F))
>>
>>
>>
>>
>> --
>> Best Regards
>> Masahiro Yamada
>
> --
> Mit freundlichen Gr=C3=BCssen,
> Sedat Dilek
>
> Telefon: +49 2166 9901-153
> E-Mail: sedat.dilek@credativ.de
> Internet: https://www.credativ.de/
>
> GPG-Fingerprint: EA6D E17D D269 AC7E 101D C910 476F 2B3B 0AF7 F86B
>
> credativ GmbH, Trompeterallee 108, 41189 M=C3=B6nchengladbach
> Handelsregister: Amtsgericht M=C3=B6nchengladbach, HR-Nummer: HRB 12080, =
UID-Nummer: DE204566209
> Gesch=C3=A4ftsf=C3=BChrung: Dr. Michael Meskes, J=C3=B6rg Folz, Sascha He=
uer
>
> **********************************************
> Jetzt neu:
> Elephant Shed - PostgreSQL Appliance
> PostgreSQL und alles was dazugeh=C3=B6rt
>
> Von Backup =C3=BCber Monitoring bis Reporting:
> https://elephant-shed.io/
> **********************************************
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Best Regards
Masahiro Yamada
