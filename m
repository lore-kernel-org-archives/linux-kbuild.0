Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:35755 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933346AbeFUQYH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jun 2018 12:24:07 -0400
Received: by mail-qk0-f195.google.com with SMTP id d130-v6so2081329qkc.2
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jun 2018 09:24:07 -0700 (PDT)
Date: Thu, 21 Jun 2018 12:24:04 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCHv4 4/4] ARM: versatile: support configuring versatile
 machine for no-MMU
In-Reply-To: <CAMuHMdUyCEq0U_CJindwcSEF+0dR-SJc1v8zGT-CcUqVkdOeVw@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1806211212010.16670@knanqh.ubzr>
References: <20180618141905.7789-1-gerg@linux-m68k.org> <20180618141905.7789-5-gerg@linux-m68k.org> <CAMuHMdUyCEq0U_CJindwcSEF+0dR-SJc1v8zGT-CcUqVkdOeVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Russell King <linux@armlinux.org.uk>, Vladimir Murzin <vladimir.murzin@arm.com>, Chris Brandt <Chris.Brandt@renesas.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org

[ adding linux-kbuild for their input ]

On Thu, 21 Jun 2018, Geert Uytterhoeven wrote:

> I'm afraid adding (duplicating) machine entries for nommu support is not a
> sustainable solutions. Any machine can run a nommu kernel, in theory.
> 
> I'm aware of the objection "but you cannot build a nommu kernel that can
> boot on multiple systems".  That's true (unless RAM/FLASH addresses are the
> same). So don't do that.
> 
> All of the above is true for XIP, too, hence applies with s/nommu/XIP/.
> One more reason not to have this duplication.
> 
> The current "ARM multiplatform" has actually two meanings:
>   1. It groups platforms that follow the "ARM multiplatform" framework,
>   2. It allows to build a single kernel that can be booted on multiple
>      platforms.
> To avoid the duplication, I think 2 should be relaxed when specialized
> options like XIP or NOMMU are selected.
> 
> I've just sent a patch to do that.

Your patch isn't wrong per se.  But it is not enough. The issue here 
would be easily fixed with some kconfig extension so that:

- If XIP or NOMMU is selected then only one target in the multiplatform 
  set can be selected, basically turning it into a choice menu.

- If more than one multiplatform targets is selected then XIP and NOMMU 
  can no longere be selected.

I don't know how this could be expressed but the implementation might 
not be that hard.


Nicolas
