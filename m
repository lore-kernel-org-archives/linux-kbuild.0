Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:2532 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728327AbfHHNYX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 09:24:23 -0400
Date: Thu, 8 Aug 2019 16:24:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
Message-ID: <20190808132417.GU30120@smile.fi.intel.com>
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
 <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com>
 <20190731194419.GB4084@kunai>
 <f4a78e93-6aaa-bc72-cf94-06fc2574451c@redhat.com>
 <CAMuHMdUA-hjVqSP_c0cB=76cfrucF6xxRi3ymVoEsJ2hbkfT=A@mail.gmail.com>
 <51451f89-9193-2be6-e724-e9ca44a25f52@redhat.com>
 <620e0aec-e3d8-7289-6525-b720013e8dfa@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <620e0aec-e3d8-7289-6525-b720013e8dfa@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Javier Martinez Canillas <javierm@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa@the-dreams.de>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>

On Thu, Aug 08, 2019 at 03:12:47PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 06.08.19 19:12, Javier Martinez Canillas wrote:
> 
> > Right, we could add a macro for that. Although it should probably be called
> > I2C_OF_MODULE_DEVICE_TABLE() or something like that since is specific to OF.
> 
> At that point it should be completely noop when OF is disabled, so we
> also can get rid of many ifdef's.

Why?

> I've got some patch somewhere for introducing a MODULE_OF_TABLE() macro
> as replacement for many MODULE_DEVICE_TABLE(of, ...) cases, which noops
> when CONFIG_OF is disabled. (and similar ones for other table types).

It's simple wrong to have #ifdef CONFIG_OF without counterpart of_match_ptr().
And taking into consideration that ID table itself doesn't depend to OF at all,
why not simple drop that #ifdef and of_match_ptr() all together?


-- 
With Best Regards,
Andy Shevchenko
