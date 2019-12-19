Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:47773 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726744AbfLSMFX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 07:05:23 -0500
MIME-Version: 1.0
Message-ID: <trinity-76f78a91-fc1f-479c-bd38-a7b989b28234-1576757117258@3c-app-gmx-bap68>
From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re: [PATCH] kbuild: Add DTC_CPP_FLAGS
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Dec 2019 13:05:17 +0100
In-Reply-To: <CAL_Jsq+we-0c25Hn+eGDTsyTDwKEvs9LWV9QtLX1+8V3DmtFtg@mail.gmail.com>
References: <20191218114625.28438-1-frank-w@public-files.de>
 <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
 <CAL_Jsq+we-0c25Hn+eGDTsyTDwKEvs9LWV9QtLX1+8V3DmtFtg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, DTML <devicetree@vger.kernel.org>

Hi Rob,

so the way you prefer is this one (use new file for additions and includin=
g the board dts):

arch/arm64/boot/dts/mediatek/mt7622-bpi-r64-mt7531.dts (example for mt7531=
-phy)

/*
 * Copyright (c) 2018 MediaTek Inc.
 * Author:
 *
 * SPDX-License-Identifier: (GPL-2.0 OR MIT)
 */

/dts-v1/;

#include "mt7622-bananapi-bpi-r64.dts"

/ {
        gsw: gsw@0 {
                compatible =3D "mediatek,mt753x";
                mediatek,ethsys =3D <&ethsys>;
                #address-cells =3D <1>;
                #size-cells =3D <0>;
        };
};

&gsw {
        mediatek,mdio =3D <&mdio>;
        mediatek,portmap =3D "wllll";
        mediatek,mdio_master_pinmux =3D <0>;
        reset-gpios =3D <&pio 54 0>;
        interrupt-parent =3D <&pio>;
        interrupts =3D <53 IRQ_TYPE_LEVEL_HIGH>;
        status =3D "okay";

        port5: port@5 {
                compatible =3D "mediatek,mt753x-port";
                reg =3D <5>;
                phy-mode =3D "rgmii";
                fixed-link {
                        speed =3D <1000>;
                        full-duplex;
                };
        };

        port6: port@6 {
                compatible =3D "mediatek,mt753x-port";
                reg =3D <6>;
                phy-mode =3D "2500base-x";
                fixed-link {
                        speed =3D <2500>;
                        full-duplex;
                };
        };
};

at least it compiles and after decompile the new nodes are visible...

is there any way to drop nodes (in case dsa-driver gets merged i don't nee=
d it in the other 2)? i can disable them, but they will be present.

regards Frank


> Gesendet: Mittwoch, 18. Dezember 2019 um 14:51 Uhr
> Von: "Rob Herring" <robh+dt@kernel.org>
> NAK. #ifdefs and complex macros in particular are features we don't
> want in dts files.
>
> Rob
