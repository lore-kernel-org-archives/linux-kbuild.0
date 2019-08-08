Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:59231 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732375AbfHHNNN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 09:13:13 -0400
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
 <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com>
 <20190731194419.GB4084@kunai>
 <f4a78e93-6aaa-bc72-cf94-06fc2574451c@redhat.com>
 <CAMuHMdUA-hjVqSP_c0cB=76cfrucF6xxRi3ymVoEsJ2hbkfT=A@mail.gmail.com>
 <51451f89-9193-2be6-e724-e9ca44a25f52@redhat.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <620e0aec-e3d8-7289-6525-b720013e8dfa@metux.net>
Date: Thu, 8 Aug 2019 15:12:47 +0200
MIME-Version: 1.0
In-Reply-To: <51451f89-9193-2be6-e724-e9ca44a25f52@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown <broonie@kernel.org>

On 06.08.19 19:12, Javier Martinez Canillas wrote:

> Right, we could add a macro for that. Although it should probably be called
> I2C_OF_MODULE_DEVICE_TABLE() or something like that since is specific to OF.

At that point it should be completely noop when OF is disabled, so we
also can get rid of many ifdef's.

I've got some patch somewhere for introducing a MODULE_OF_TABLE() macro
as replacement for many MODULE_DEVICE_TABLE(of, ...) cases, which noops
when CONFIG_OF is disabled. (and similar ones for other table types).

by the way: haven't followed whole discussion, just picked up some
proposed table changes ... does that require userland upgrades ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
