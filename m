Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:47233 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726998AbfLRNyI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 08:54:08 -0500
MIME-Version: 1.0
Message-ID: <trinity-d7a098bf-51a2-4579-93c9-963826ed2895-1576677243636@3c-app-gmx-bap62>
From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re: [PATCH] kbuild: Add DTC_CPP_FLAGS
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Dec 2019 14:54:03 +0100
In-Reply-To: <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
References: <20191218114625.28438-1-frank-w@public-files.de>
 <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, DTML <devicetree@vger.kernel.org>

Hi,

thank you for your answer... i waited for this argument ;) so here an exam=
ple (don't wanted to add in patch itself):

i have 2 different Bananapi-r64 boards with different switch-chips (v0.x r=
tl8367,v1.x xmt7531). for 1 of the switches (mt7531) there are 2 drivers (=
phy-driver + dsa driver) available and so i have 3 different configs in DT=
S.

Imho dtsi should contain only config for 1 chip, but the board has only 1 =
dts. Till now i have copied the whole dts twice, so i have 3 independent d=
ts. if i Patch any other in one like for bluetooth, wifi, which is same on=
 each board i have to do it on all 3 dts files.

so i tried to make the switch-part conditionally, include the right dtsi f=
or switch to 1 bpi-r64 dts based on -D param passed to the build-chain.

#ifdef __SWITCH_RTL8367__
       #include "rtl8367.dtsi"
#endif
#ifdef __SWITCH_MT7531_DSA__
       #include "mt7531.dtsi"
#endif

imho i can/should not include a dtsi to a dtsi and no dts to dts, so i can=
not have a small dts (with the switch-config) including the whole r64 boar=
d. Am i right?

and this change should be less interferring than other ideas i'm thinking =
about.

Another example: I had tried adding the include/generated/autoconf.h to dt=
si (same reason) which needs a change in scripts/dtc/include-prefixes/ (ad=
d symlink) or an odd include in the dtsi (#include "../../../../../include=
/generated/autoconf.h"). Both ways not nice...

regards Frank


> Gesendet: Mittwoch, 18. Dezember 2019 um 14:31 Uhr
> Von: "Masahiro Yamada" <masahiroy@kernel.org>
> I think this is questionable
> since DT is supposed to describe hardware.
> Does it depends on #ifdef or some external defines?
>
> If you want to add variations,
> you can add a new DTS which includes other DTS(I) files.
