Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f178.google.com ([209.85.220.178]:56305 "EHLO
	mail-vc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754029AbaIIQYG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Sep 2014 12:24:06 -0400
Received: by mail-vc0-f178.google.com with SMTP id hy4so2602963vcb.37
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Sep 2014 09:24:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1410258381-7088-3-git-send-email-yamada.m@jp.panasonic.com>
References: <1410258381-7088-1-git-send-email-yamada.m@jp.panasonic.com> <1410258381-7088-3-git-send-email-yamada.m@jp.panasonic.com>
From: Peter Foley <pefoley2@pefoley.com>
Date: Tue, 9 Sep 2014 12:23:45 -0400
Message-ID: <CAOFdcFOxDSJfT2J382c6X9ryWhtYdfZdBmhxDxrhEkxkiUwx4w@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: remove unnecessary variable initializaions
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>, Hartley Sweeten <hsweeten@visionengravers.com>, Ryan Mallon <rmallon@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Greg Ungerer <gerg@uclinux.org>, Ben Dooks <ben-linux@fluff.org>, Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org

On Tue, Sep 9, 2014 at 6:26 AM, Masahiro Yamada
<yamada.m@jp.panasonic.com> wrote:
> Clearing obj-y, obj-m, obj-n, obj- in each Makefile is
> a useless habit.
>
> They are non-exported variables; therefore they are always empty
> whenever descending into each subdirectory.
> (Moreorver, obj-y and obj-m are also set to empty at the beginning
> of scripts/Makefile.build)
>
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

Acked-by: Peter Foley <pefoley2@pefoley.com>
