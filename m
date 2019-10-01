Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.domeneshop.no ([194.63.252.55]:60619 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfJAK6L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Oct 2019 06:58:11 -0400
Subject: Re: [PATCH] drm/tiny: Kconfig: Remove always-y THERMAL dep. from
 TINYDRM_REPAPER
References: <20190927174218.GA32085@huvuddator>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <c3b41a7b-ef3b-7960-13a1-d4b8dd6f15b6@tronnes.org>
Date: Tue, 1 Oct 2019 12:58:00 +0200
MIME-Version: 1.0
In-Reply-To: <20190927174218.GA32085@huvuddator>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com
Cc: airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org, david@lechnology.com, hdegoede@redhat.com, eric@anholt.net, tglx@linutronix.de, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org



Den 27.09.2019 19.42, skrev Ulf Magnusson:
> Commit 554b3529fe01 ("thermal/drivers/core: Remove the module Kconfig's
> option") changed the type of THERMAL from tristate to bool, so
> THERMAL || !THERMAL is now always y. Remove the redundant dependency.
> 
> Discovered through Kconfiglib detecting a dependency loop. The C tools
> simplify the expression to y before running dependency loop detection,
> and so don't see it. Changing the type of THERMAL back to tristate makes
> the C tools detect the same loop.
> 
> Not sure if running dep. loop detection after simplification can be
> called a bug. Fixing this nit unbreaks Kconfiglib on the kernel at
> least.
> 
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---

Thanks, applied to drm-misc-next.

Noralf.
