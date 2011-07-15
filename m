Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:43464 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932677Ab1GOBjE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 Jul 2011 21:39:04 -0400
Received: by pzk3 with SMTP id 3so1009933pzk.5
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jul 2011 18:39:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E1F8374.3090701@infradead.org>
References: <20110713151724.3b16ce77.rdunlap@xenotime.net>
	<1310664362-28100-1-git-send-email-lacombar@gmail.com>
	<4E1F3296.5060000@infradead.org>
	<CACqU3MXp+1WX52sWVz4iey88=PGiFL3bLbQnSOJXBzsneOu6yg@mail.gmail.com>
	<4E1F8374.3090701@infradead.org>
Date: Thu, 14 Jul 2011 21:39:03 -0400
Message-ID: <CACqU3MX_AAn+wMf5tvVs=QdacadzdreNxuj0CMi1=8_VUoVbTA@mail.gmail.com>
Subject: Re: [PATCH] media/Kconfig: fix hexadecimal prefix for `hex' symbols
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Michal Marek <mmarek@suse.cz>

Hi,

[Add Michal to the Cc: list.]

On Thu, Jul 14, 2011 at 8:01 PM, Mauro Carvalho Chehab
<mchehab@infradead.org> wrote:
> Em 14-07-2011 20:32, Arnaud Lacombe escreveu:
>> Hi,
>>
>> On Thu, Jul 14, 2011 at 2:16 PM, Mauro Carvalho Chehab
>> <mchehab@infradead.org> wrote:
>>> Em 14-07-2011 14:26, Arnaud Lacombe escreveu:
>>>> Cc: Mauro Carvalho Chehab <mchehab@infradead.org>
>>>> Cc: Randy Dunlap <rdunlap@xenotime.net>
>>>> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
>>>
>>> Arnaud,
>>>
>>> The patch is ok for me. You can add my acked-by, if you want.
>>>
>> don't you want to take in though the media/video tree for -next ?
>
> It seems better if you could put it on your tree, before the patch that broke
> the Kconfig. Otherwise, you'll need to wait for my merge upstream, before
> being sending yours, to avoid breaking git bisect.
>
Technically, I do not have any tree, Michal does :) That said, both
patch are completely independent and both fix the issue. So you can
take this patch, for the sake of having prefixed hexadecimal value
when the user is editing the config, in the mean time, Michal can
merge the fix.

> Anyway, I'm ok to add it into my tree if you prefer this way.
>
I guess it is the easiest.

Btw, Randy's earliest patch will no longer be needed too.

Thanks,
 - Arnaud

> Thanks!
> Mauro
>
>>
>>  - Arnaud
>>
>>> However, with 3.0-rc7, this patch and/or Kconfig fixes don't seem to
>>> be needed. Basically, include/generated/autoconf.h has "0x" on it:
>>>
>>> $ grep CONFIG_RADIO_RTRACK_PORT */*/*
>>> include/config/auto.conf:CONFIG_RADIO_RTRACK_PORT=20f
>>> include/generated/autoconf.h:#define CONFIG_RADIO_RTRACK_PORT 0x20f
>>>
>>> Maybe some patch applied at -next from another tree broke that behavior.
>>>
>>> IMHO, keeping those values without "0x" at Kconfig seems more intuitive
>>> for the end-user, as otherwise a value like "200" would be confusing
>>> if this means 200d or 200h.
>>>
>>> Anyway, those drivers are very old, and very few people likely still
>>> use those old hardware. So, I'm fine if you either want to preserve
>>> the current way or to change it.
>>>
>>> Cheers,
>>> Mauro.
>>>
>>>> ---
>>>>  drivers/media/radio/Kconfig |   16 ++++++++--------
>>>>  1 files changed, 8 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/media/radio/Kconfig b/drivers/media/radio/Kconfig
>>>> index e4c97fd..9cab04d 100644
>>>> --- a/drivers/media/radio/Kconfig
>>>> +++ b/drivers/media/radio/Kconfig
>>>> @@ -58,7 +58,7 @@ config RADIO_RTRACK
>>>>  config RADIO_RTRACK_PORT
>>>>       hex "RadioTrack i/o port (0x20f or 0x30f)"
>>>>       depends on RADIO_RTRACK=y
>>>> -     default "20f"
>>>> +     default "0x20f"
>>>>       help
>>>>         Enter either 0x30f or 0x20f here.  The card default is 0x30f, if you
>>>>         haven't changed the jumper setting on the card.
>>>> @@ -81,7 +81,7 @@ config RADIO_RTRACK2
>>>>  config RADIO_RTRACK2_PORT
>>>>       hex "RadioTrack II i/o port (0x20c or 0x30c)"
>>>>       depends on RADIO_RTRACK2=y
>>>> -     default "30c"
>>>> +     default "0x30c"
>>>>       help
>>>>         Enter either 0x30c or 0x20c here.  The card default is 0x30c, if you
>>>>         haven't changed the jumper setting on the card.
>>>> @@ -104,7 +104,7 @@ config RADIO_AZTECH
>>>>  config RADIO_AZTECH_PORT
>>>>       hex "Aztech/Packard Bell I/O port (0x350 or 0x358)"
>>>>       depends on RADIO_AZTECH=y
>>>> -     default "350"
>>>> +     default "0x350"
>>>>       help
>>>>         Enter either 0x350 or 0x358 here.  The card default is 0x350, if you
>>>>         haven't changed the setting of jumper JP3 on the card.  Removing the
>>>> @@ -133,7 +133,7 @@ config RADIO_GEMTEK
>>>>  config RADIO_GEMTEK_PORT
>>>>       hex "Fixed I/O port (0x20c, 0x30c, 0x24c, 0x34c, 0c24c or 0x28c)"
>>>>       depends on RADIO_GEMTEK=y
>>>> -     default "34c"
>>>> +     default "0x34c"
>>>>       help
>>>>         Enter either 0x20c, 0x30c, 0x24c or 0x34c here. The card default is
>>>>         0x34c, if you haven't changed the jumper setting on the card. On
>>>> @@ -237,7 +237,7 @@ config RADIO_TERRATEC
>>>>  config RADIO_TERRATEC_PORT
>>>>       hex "Terratec i/o port (normally 0x590)"
>>>>       depends on RADIO_TERRATEC=y
>>>> -     default "590"
>>>> +     default "0x590"
>>>>       help
>>>>         Fill in the I/O port of your TerraTec FM radio card. If unsure, go
>>>>         with the default.
>>>> @@ -255,7 +255,7 @@ config RADIO_TRUST
>>>>  config RADIO_TRUST_PORT
>>>>       hex "Trust i/o port (usually 0x350 or 0x358)"
>>>>       depends on RADIO_TRUST=y
>>>> -     default "350"
>>>> +     default "0x350"
>>>>       help
>>>>         Enter the I/O port of your Trust FM radio card. If unsure, try the
>>>>         values "0x350" or "0x358".
>>>> @@ -278,7 +278,7 @@ config RADIO_TYPHOON
>>>>  config RADIO_TYPHOON_PORT
>>>>       hex "Typhoon I/O port (0x316 or 0x336)"
>>>>       depends on RADIO_TYPHOON=y
>>>> -     default "316"
>>>> +     default "0x316"
>>>>       help
>>>>         Enter the I/O port of your Typhoon or EcoRadio radio card.
>>>>
>>>> @@ -312,7 +312,7 @@ config RADIO_ZOLTRIX
>>>>  config RADIO_ZOLTRIX_PORT
>>>>       hex "ZOLTRIX I/O port (0x20c or 0x30c)"
>>>>       depends on RADIO_ZOLTRIX=y
>>>> -     default "20c"
>>>> +     default "0x20c"
>>>>       help
>>>>         Enter the I/O port of your Zoltrix radio card.
>>>>
>>>
>>>
>
>
