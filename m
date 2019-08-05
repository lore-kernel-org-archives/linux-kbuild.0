Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41967 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728922AbfHEWZo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Aug 2019 18:25:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id c2so82676030wrm.8
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Aug 2019 15:25:43 -0700 (PDT)
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
 <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com>
 <20190731194419.GB4084@kunai>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <f4a78e93-6aaa-bc72-cf94-06fc2574451c@redhat.com>
Date: Tue, 6 Aug 2019 00:25:34 +0200
MIME-Version: 1.0
In-Reply-To: <20190731194419.GB4084@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown <broonie@kernel.org>

Hello Wolfram,

On 7/31/19 9:44 PM, Wolfram Sang wrote:
> Hi Javier,
> 
> thank you for providing the extra information.
> 
> (And Kieran, thanks for the patch!)
> 
>> The other option is to remove i2c_of_match_device() and don't make OF match
>> to fallback to i2c_of_match_device_sysfs(). This is what happens in the ACPI
>> case, since i2c_device_match() just calls acpi_driver_match_device() directly
>> and doesn't have a wrapper function that fallbacks to sysfs matching.
>>
>> In this case an I2C device ID table would be required if the devices have to
>> be instantiated through sysfs. That way the I2C table would be used both for
>> auto-loading and also to match the device when it doesn't have an of_node.
> 
> That would probably mean that only a minority of drivers will not add an I2C
> device ID table because it is easy to add an you get the sysfs feature?
>

I believe so yes.
 
> Then we are back again with the situation that most drivers will have
> multiple tables. With the minor change that the I2C device id table is
> not required anymore by the core, but it will be just very useful to
> have? Or?
>

Yes, it won't be needed anymore if you are only instantiating all your devices
from your firmware interface (e.g: OF, ACPI).

>> If the former is the correct way to solve this then the patch looks good to me.
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> For this actual patch from Kieran, I'd like to hear an opinion from the
> people maintaining modpost. The aproach looks okay to me, yet I can't
> tell how "easy" we are with adding new types like 'i2c_of'.
>

As Masahiro-san mentioned, this approach will still require to add a new macro
MODULE_DEVICE_TABLE(i2c_of, bar_of_match) so the OF device table is used twice.

One to expose the "of:N*T*Cfoo,bar" and another one to expose it as "i2c:bar".

I expect that many developers would miss adding this macro for new drivers that
are DT-only and so sysfs instantiation would not work there. So whatever is the
approach taken we should clearly document all this so drivers authors are aware.

> Thanks everyone,
> 
>    Wolfram
> 

Best regards,
-- 
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat
