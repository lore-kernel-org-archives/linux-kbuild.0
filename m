Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f52.google.com ([209.85.160.52]:44510 "EHLO
        mail-pl0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752403AbeBFMAk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Feb 2018 07:00:40 -0500
Received: by mail-pl0-f52.google.com with SMTP id f8so1089990plk.11
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Feb 2018 04:00:39 -0800 (PST)
Date: Tue, 6 Feb 2018 13:00:33 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH] kconfig: Minimize 'Selected by' and 'Implied by'
Message-ID: <20180206120032.v52k4xm7oyono3yg@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20180204113712.8983-1-rosca.eugeniu@gmail.com>
 <CAFkk2KQmROW-Z--qwvxWQrsohBSsnk_EhqZixOWFXUxeBj=tkQ@mail.gmail.com>
 <20180204214953.GA2905@example.com>
 <CAFkk2KR9JDTxtD7=HVzP4eS2hh6xFNd-AkPi7_cDSgjc8k4u4A@mail.gmail.com>
 <CAK7LNATnROTM1bECz4fk=e7B0ioWKWmL+pz_MUh9j2tc3eZwzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATnROTM1bECz4fk=e7B0ioWKWmL+pz_MUh9j2tc3eZwzg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>

Hi,

> Another possibility?


> Add [ ]: for each line to show the expression value.
> (but blank for 'n' for readability)


>  Symbol: REGMAP_I2C [=y]
>  Type  : tristate
>    Defined at drivers/base/regmap/Kconfig:19
>    Depends on: I2C [=y]
>    Selected by:
>     [y]: EEPROM_AT24 [=y] && I2C [=y] && SYSFS [=y]
>     [ ]: NET_DSA_SMSC_LAN9303_I2C [=n] && NETDEVICES [=y] &&
> HAVE_NET_DSA [=y] && NET_DSA [=n] && I2C [=y]
>     [ ]: KEYBOARD_CAP11XX [=n] && !UML && INPUT [=y] && INPUT_KEYBOARD
> [=y] && OF [=y] && I2C [=y]
>     [ ]: TOUCHSCREEN_AD7879_I2C [=n] && !UML && INPUT [=y] &&
> INPUT_TOUCHSCREEN [=n] && TOUCHSCREEN_AD7879 [=n] &&
>     [ ]: TOUCHSCREEN_TSC2004 [=n] && !UML && INPUT [=y] &&
> INPUT_TOUCHSCREEN [=n] && I2C [=y]
>     [ ]: INPUT_DRV260X_HAPTICS [=n] && !UML && INPUT_MISC [=y] &&
> INPUT [=y] && I2C [=y] && (GPIOLIB [=y] || COMPI
>     [ ]: INPUT_DRV2665_HAPTICS [=n] && !UML && INPUT_MISC [=y] &&
> INPUT [=y] && I2C [=y]
>     [ ]: INPUT_DRV2667_HAPTICS [=n] && !UML && INPUT_MISC [=y] &&
> INPUT [=y] && I2C [=y]
>     [ ]: SERIAL_SC16IS7XX_I2C [=n] && TTY [=y] && HAS_IOMEM [=y] &&
> SERIAL_SC16IS7XX [=n] && I2C [=y]
>     [ ]: I2C_MUX_LTC4306 [=n] && I2C [=y] && I2C_MUX [=y]
>     [ ]: PINCTRL_MCP23S08 [=n] && PINCTRL [=y] && (SPI_MASTER [=y] ||
> I2C [=y]) && (I2C [=y] || I2C [=y]=n) && I2C
>     [ ]: GPIO_TS4900 [=n] && GPIOLIB [=y] && I2C [=y] && (SOC_IMX6 ||
> COMPILE_TEST [=n])
>     [ ]: BATTERY_MAX17042 [=n] && POWER_SUPPLY [=y] && I2C [=y]
>     [ ]: CHARGER_BQ25890 [=n] && POWER_SUPPLY [=y] && I2C [=y] &&
> (GPIOLIB [=y] || COMPILE_TEST [=n])
>     [ ]: CHARGER_SMB347 [=n] && POWER_SUPPLY [=y] && I2C [=y]
>     [ ]: CHARGER_RT9455 [=n] && POWER_SUPPLY [=y] && I2C [=y] &&
> (GPIOLIB [=y] || COMPILE_TEST [=n])
>     [y]: SENSORS_LTC2945 [=y] && HWMON [=y] && I2C [=y]
>               ...


This looks best variant to me.


> Best Regards
> Masahiro Yamada


Kind regards,
Petr
