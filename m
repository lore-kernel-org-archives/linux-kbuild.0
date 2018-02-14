Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:53752 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966220AbeBNAqa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Feb 2018 19:46:30 -0500
Received: by mail-wm0-f65.google.com with SMTP id t74so19322840wme.3
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Feb 2018 16:46:30 -0800 (PST)
Date: Wed, 14 Feb 2018 01:46:27 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH 2/2] kconfig: Print the value of each reverse dependency
Message-ID: <20180214004626.GB1154@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
 <20180213005610.10575-2-rosca.eugeniu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180213005610.10575-2-rosca.eugeniu@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ulf Magnusson <ulfalizer@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Eugeniu Rosca <erosca@de.adit-jv.com>, linux-kbuild@vger.kernel.org, Eugeniu Rosca <rosca.eugeniu@gmail.com>

Hi Eugeniu,

> From: Eugeniu Rosca <erosca@de.adit-jv.com>

> Assuming commit 617aebe6a97e ("Merge tag 'usercopy-v4.16-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux"), ARCH=arm64
> and vanilla arm64 defconfig, here is the top 10 CONFIG options with
> the highest amount of OR sub-expressions that make up the final
> "{Selected,Implied} by" reverse dependency expression.

> | Config                        | Revdep all | Revdep ![=n] |
> |-------------------------------|------------|--------------|
> | REGMAP_I2C                    | 212        | 9            |
> | CRC32                         | 167        | 25           |
> | FW_LOADER                     | 128        | 5            |
> | MFD_CORE                      | 124        | 9            |
> | FB_CFB_IMAGEBLIT              | 114        | 2            |
> | FB_CFB_COPYAREA               | 111        | 2            |
> | FB_CFB_FILLRECT               | 110        | 2            |
> | SND_PCM                       | 103        | 2            |
> | CRYPTO_HASH                   | 87         | 19           |
> | WATCHDOG_CORE                 | 86         | 6            |

> The story behind the above table is that the user needs to visually
> review/evaluate 212 expressions which *potentially* select REGMAP_I2C
> in order to identify the expressions which *actually* select REGMAP_I2C,
> for a particular ARCH and for a particular defconfig used.

> To make this experience smoother, transform the way reverse dependencies
> are displayed to the user from [1] to [2].

> [1] Before this commit
> Symbol: MTD_BLKDEVS [=y]
>   ...
>   Selected by:
>   - MTD_BLOCK [=y] && MTD [=y] && BLOCK [=y]
>   - MTD_BLOCK_RO [=n] && MTD [=y] && MTD_BLOCK [=y]!=y && BLOCK [=y]
>   - FTL [=n] && MTD [=y] && BLOCK [=y]
>   - NFTL [=n] && MTD [=y] && BLOCK [=y]
>   - INFTL [=n] && MTD [=y] && BLOCK [=y]
>   - RFD_FTL [=n] && MTD [=y] && BLOCK [=y]
>   - SSFDC [=n] && MTD [=y] && BLOCK [=y]
>   - SM_FTL [=n] && MTD [=y] && BLOCK [=y]
>   - MTD_SWAP [=n] && MTD [=y] && SWAP [=y]

> [2] After this commit
> Symbol: MTD_BLKDEVS [=y]
>   ...
>   Selected by:
>   - [y] MTD_BLOCK [=y] && MTD [=y] && BLOCK [=y]
>   - [ ] MTD_BLOCK_RO [=n] && MTD [=y] && MTD_BLOCK [=y]!=y && BLOCK [=y]
>   - [ ] FTL [=n] && MTD [=y] && BLOCK [=y]
>   - [ ] NFTL [=n] && MTD [=y] && BLOCK [=y]
>   - [ ] INFTL [=n] && MTD [=y] && BLOCK [=y]
>   - [ ] RFD_FTL [=n] && MTD [=y] && BLOCK [=y]
>   - [ ] SSFDC [=n] && MTD [=y] && BLOCK [=y]
>   - [ ] SM_FTL [=n] && MTD [=y] && BLOCK [=y]
>   - [ ] MTD_SWAP [=n] && MTD [=y] && SWAP [=y]
Note, Masahiro suggested to have ':' after first expression [1]:
   Selected by:
    [y]: EEPROM_AT24 [=y] && I2C [=y] && SYSFS [=y]
    [ ]: NET_DSA_SMSC_LAN9303_I2C [=n] && NETDEVICES [=y] &&
HAVE_NET_DSA [=y] && NET_DSA [=n] && I2C [=y]
...

I think it's better, it's clearer that the expression is for whole line.


Kind regards,
Petr

[1]: https://marc.info/?l=linux-kbuild&m=151791725709825&w=4
