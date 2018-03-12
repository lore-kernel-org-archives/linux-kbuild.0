Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58891 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751248AbeCLPI7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Mar 2018 11:08:59 -0400
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: kconfig: Add help text to FB_I810_I2C
Date: Mon, 12 Mar 2018 16:08:46 +0100
Message-id: <4626326.T7PS2VtTaQ@amdc3058>
In-reply-to: <20180213140248.h4yyc77futu74xg7@huvuddator>
MIME-version: 1.0
Content-transfer-encoding: 7Bit
Content-type: text/plain; charset="us-ascii"
References: <20180131093434.20050-1-ulfalizer@gmail.com>
        <2836658.i9VlN9LAid@amdc3058> <20180213140248.h4yyc77futu74xg7@huvuddator>
        <CGME20180312150855epcas1p36b1377471a2a0d69362fa3cf57295209@epcas1p3.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, Paul Bolle <pebolle@tiscali.nl>, Arnd Bergmann <arnd@arndb.de>, Michal Simek <michal.simek@xilinx.com>, Hans de Goede <j.w.r.degoede@gmail.com>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org

On Tuesday, February 13, 2018 03:02:48 PM Ulf Magnusson wrote:
> The FB_I810_I2C symbol previously had a blank help text, which was
> removed in e9829ac4e5fd ("video: fbdev: kconfig: Remove blank help
> text").
> 
> Give it a proper help text, derived from commit 74f6ae84b23 ("[PATCH]
> i810fb: Add > i2c/DDC support").
> 
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>

Patch queued for 4.17, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

