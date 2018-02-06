Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f170.google.com ([209.85.128.170]:37416 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752444AbeBFL6d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Feb 2018 06:58:33 -0500
Received: by mail-wr0-f170.google.com with SMTP id a43so1623346wrc.4
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Feb 2018 03:58:33 -0800 (PST)
Date: Tue, 6 Feb 2018 12:58:31 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH] kconfig: Minimize 'Selected by' and 'Implied by'
Message-ID: <20180206115830.35zffame6ywhhy3x@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20180204113712.8983-1-rosca.eugeniu@gmail.com>
 <20180204155053.GA32437@x230>
 <20180204215751.GB2905@example.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180204215751.GB2905@example.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ulf Magnusson <ulfalizer@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, linux-kbuild@vger.kernel.org, Eugeniu Rosca <rosca.eugeniu@gmail.com>

Hi Eugeniu,

> > Applying your patch, running
> > $ ARCH=arm64 make defconfig && ARCH=arm64 make menuconfig
> > and searching for USB prints "Selected by:" with nothing actually selected.

> I think the behavior is correct. All expressions that select USB
> translate/evaluate to =n. CONFIG_USB is enabled in the arm64 defconfig.
Oh, sorry, I got that, that was the version with filtering.

> Thanks,
> Eugeniu.


Kind regards,
Petr
