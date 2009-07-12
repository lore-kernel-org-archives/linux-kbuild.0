Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vw0-f199.google.com ([209.85.212.199]:34900 "EHLO
	mail-vw0-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753912AbZGLROZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Jul 2009 13:14:25 -0400
MIME-Version: 1.0
Reply-To: crquan@gmail.com
In-Reply-To: <19033.46146.685018.240686@pilspetsen.it.uu.se>
References: <1247386308-19628-1-git-send-email-crq@kernel.org>
	 <1247386308-19628-2-git-send-email-crq@kernel.org>
	 <19033.46146.685018.240686@pilspetsen.it.uu.se>
Date: Sun, 12 Jul 2009 17:14:23 +0000
Message-ID: <91b13c310907121014r4ab3d37p9477030bb0e3b7d2@mail.gmail.com>
Subject: Re: [PATCH 1/6] add symbol value to help find the real depend
From: Cheng Renquan <crq@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On Sun, Jul 12, 2009 at 10:00 AM, Mikael Pettersson<mikpe@it.uu.se> wrote:
[...]
> I like this concept, but I'd like to see it supported with make oldconfig.

'make oldconfig' uses the same 'scripts/kconfig/conf' program as the
'make config' does, which is supported already in this series of
patches,

> Let's say I copy a .config from kernel X into kernel Y (Y>X) and make oldconfig.
> Sometimes the new kernel will enable some previously disabled option, and
> it would be very useful to see WHY.
>
> To take a concrete example, in my 2.6.30 .config I had:
>
> CONFIG_DRM=m
> CONFIG_DRM_RADEON=m
> # CONFIG_FB is not set
>
> which when oldconfig'd in 2.6.31-rc changed to
>
> CONFIG_DRM=m
> CONFIG_DRM_RADEON=m
> CONFIG_FB=m
> (+ some more FB stuff)
>
> In this case it would have been nice to get an explanation that DRM_RADEON
> was responsible for (wrongly, IMO) selecting FB. Something like
>
> # CONFIG_FB was selected by CONFIG_DRM_RADEON
> CONFIG_FB=m
>
> These comments should only be emitted for options added by select that
> previously were absent or 'is not set'.

The conf system is not so smart to find the recent changes (you may
try scripts/diffconfig to diff two .config),

Anyway, if you don't like CONFIG_FB and have no idea why it is
selected, you can navigate to CONFIG_FB in
menuconfig/gconfig/xconfig/config, and find out the real dependency
reason from its help message,

>
> /Mikael
>

--
Cheng Renquan (程任全), from Shenzhen, China
