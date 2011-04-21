Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:48158 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752836Ab1DUVN3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Apr 2011 17:13:29 -0400
Subject: Re: [PATCH] kbuild: fix W=1 with gcc 4.3.2
From: Eric Dumazet <eric.dumazet@gmail.com>
In-Reply-To: <20110421210852.GA6196@merkur.ravnborg.org>
References: <20110421210852.GA6196@merkur.ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 21 Apr 2011 23:13:23 +0200
Message-ID: <1303420403.2784.25.camel@edumazet-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Dave Jones <davej@redhat.com>

Le jeudi 21 avril 2011 à 23:08 +0200, Sam Ravnborg a écrit :
> Building a kernel using W=1 with gcc 4.3.2 failed like this:
> 
>     cc1: error: unrecognized command line option "-Wpacked-bitfield-compat"
> 
> Make use of this option dependent on the compiler.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Dave Jones <davej@redhat.com>
> ---
> I do not see this a stable material - people running stable kernels
> have less value of W=1.
> 
> And the amount of warnings are outright silly. We should really
> divide this up a bit so W=1 is semi usefull.
> 
> 	Sam
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index d5f925a..b280284 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -73,7 +73,7 @@ KBUILD_EXTRA_WARNINGS += -Wnested-externs
>  KBUILD_EXTRA_WARNINGS += -Wold-style-definition
>  KBUILD_EXTRA_WARNINGS += $(call cc-option, -Woverlength-strings,)
>  KBUILD_EXTRA_WARNINGS += -Wpacked
> -KBUILD_EXTRA_WARNINGS += -Wpacked-bitfield-compat
> +KBUILD_EXTRA_WARNINGS += $(call cc-option, -Wpacked-bitfield-compat)
>  KBUILD_EXTRA_WARNINGS += -Wpadded
>  KBUILD_EXTRA_WARNINGS += -Wpointer-arith
>  KBUILD_EXTRA_WARNINGS += -Wredundant-decls
> --

Please add same fix for gcc-4.1.2

cc1: error: unrecognized command line option "-Wlogical-op"





