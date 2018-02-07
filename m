Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:36602 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754148AbeBGAbd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Feb 2018 19:31:33 -0500
Received: by mail-vk0-f68.google.com with SMTP id m197so2352663vka.3
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Feb 2018 16:31:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFkk2KTd7FDtMAc+xTH5wK266khxwUSk+bqzskrNNKJPcz-0TQ@mail.gmail.com>
References: <20180204113712.8983-1-rosca.eugeniu@gmail.com>
 <CAFkk2KQmROW-Z--qwvxWQrsohBSsnk_EhqZixOWFXUxeBj=tkQ@mail.gmail.com>
 <20180204214953.GA2905@example.com> <CAFkk2KR9JDTxtD7=HVzP4eS2hh6xFNd-AkPi7_cDSgjc8k4u4A@mail.gmail.com>
 <CAK7LNATnROTM1bECz4fk=e7B0ioWKWmL+pz_MUh9j2tc3eZwzg@mail.gmail.com>
 <20180206120032.v52k4xm7oyono3yg@dell5510> <CAH3KO=0o0aN2-a369TvaMWwUVB81vagTS03d8kstzttiZ+2Xog@mail.gmail.com>
 <CAFkk2KTd7FDtMAc+xTH5wK266khxwUSk+bqzskrNNKJPcz-0TQ@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 7 Feb 2018 01:31:32 +0100
Message-ID: <CAFkk2KR=kgW7t4hhjMWZyqzC6=sYQbtMQRoyysNcS02V_xGgLA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Minimize 'Selected by' and 'Implied by'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Petr Vorel <petr.vorel@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>

On Wed, Feb 7, 2018 at 1:28 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> On Tue, Feb 6, 2018 at 3:43 PM, Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
>> Hi all,
>>
>> On Tue, Feb 6, 2018 at 1:00 PM, Petr Vorel <petr.vorel@gmail.com> wrote:
>>> Hi,
>>>
>>>> Another possibility?
>>>
>>>
>>>> Add [ ]: for each line to show the expression value.
>>>> (but blank for 'n' for readability)
>>>
>>>
>>>>  Symbol: REGMAP_I2C [=y]
>>>>  Type  : tristate
>>>>    Defined at drivers/base/regmap/Kconfig:19
>>>>    Depends on: I2C [=y]
>>>>    Selected by:
>>>>     [y]: EEPROM_AT24 [=y] && I2C [=y] && SYSFS [=y]
>>>>     [ ]: NET_DSA_SMSC_LAN9303_I2C [=n] && NETDEVICES [=y] &&
>>>> HAVE_NET_DSA [=y] && NET_DSA [=n] && I2C [=y]
>>>>     [ ]: KEYBOARD_CAP11XX [=n] && !UML && INPUT [=y] && INPUT_KEYBOARD
>>>> [=y] && OF [=y] && I2C [=y]
>>>>     [ ]: TOUCHSCREEN_AD7879_I2C [=n] && !UML && INPUT [=y] &&
>>>> INPUT_TOUCHSCREEN [=n] && TOUCHSCREEN_AD7879 [=n] &&
>>>>     [ ]: TOUCHSCREEN_TSC2004 [=n] && !UML && INPUT [=y] &&
>>>> INPUT_TOUCHSCREEN [=n] && I2C [=y]
>>>>     [ ]: INPUT_DRV260X_HAPTICS [=n] && !UML && INPUT_MISC [=y] &&
>>>> INPUT [=y] && I2C [=y] && (GPIOLIB [=y] || COMPI
>>>>     [ ]: INPUT_DRV2665_HAPTICS [=n] && !UML && INPUT_MISC [=y] &&
>>>> INPUT [=y] && I2C [=y]
>>>>     [ ]: INPUT_DRV2667_HAPTICS [=n] && !UML && INPUT_MISC [=y] &&
>>>> INPUT [=y] && I2C [=y]
>>>>     [ ]: SERIAL_SC16IS7XX_I2C [=n] && TTY [=y] && HAS_IOMEM [=y] &&
>>>> SERIAL_SC16IS7XX [=n] && I2C [=y]
>>>>     [ ]: I2C_MUX_LTC4306 [=n] && I2C [=y] && I2C_MUX [=y]
>>>>     [ ]: PINCTRL_MCP23S08 [=n] && PINCTRL [=y] && (SPI_MASTER [=y] ||
>>>> I2C [=y]) && (I2C [=y] || I2C [=y]=n) && I2C
>>>>     [ ]: GPIO_TS4900 [=n] && GPIOLIB [=y] && I2C [=y] && (SOC_IMX6 ||
>>>> COMPILE_TEST [=n])
>>>>     [ ]: BATTERY_MAX17042 [=n] && POWER_SUPPLY [=y] && I2C [=y]
>>>>     [ ]: CHARGER_BQ25890 [=n] && POWER_SUPPLY [=y] && I2C [=y] &&
>>>> (GPIOLIB [=y] || COMPILE_TEST [=n])
>>>>     [ ]: CHARGER_SMB347 [=n] && POWER_SUPPLY [=y] && I2C [=y]
>>>>     [ ]: CHARGER_RT9455 [=n] && POWER_SUPPLY [=y] && I2C [=y] &&
>>>> (GPIOLIB [=y] || COMPILE_TEST [=n])
>>>>     [y]: SENSORS_LTC2945 [=y] && HWMON [=y] && I2C [=y]
>>>>               ...
>>>
>>>
>>> This looks best variant to me.
>>
>> I like this approach too. The only downside I see for not doing
>> explicit classification/break-down is that you will still have to
>> scroll through 212 Selected-by entries of REGMAP_I2C to identify the 9
>> ones which evaluate to =y or =m.
>> Fortunately, there are not so many symbols like REGMAP_I2C, so it will
>> most lilkely not bother anybody.
>> I'll make a sketch/proposal in the next days. But if anybody is
>> impatient about implementing this himself, I don't mind.
>>
>> Thanks for your replies.
>>
>> Best regards,
>> Eugeniu.
>
> Yeah, I like the grouping feature too, with the m/y selects listed
> separately from the n selects. That'd be helpful both when trying to
> figure why a particular symbol is being selected, and when trying to
> figure why it isn't being selected, both of which are probably pretty
> common.
>
> Cheers,
> Ulf

Though I guess it wouldn't matter for the not-selected case. Many
cases where it'd be helpful still I think.

Cheers,
Ulf
