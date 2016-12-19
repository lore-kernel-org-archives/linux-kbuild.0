Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50028 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1761994AbcLSK5b (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Dec 2016 05:57:31 -0500
Subject: Re: default 0 if KASAN expression not working in kbuild
References: <e8e7205e-17f4-1d2c-f6d1-bd741b65e032@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <8c63bae0-79fb-4594-125a-7e5d76e0c603@suse.com>
Date: Mon, 19 Dec 2016 11:57:23 +0100
MIME-Version: 1.0
In-Reply-To: <e8e7205e-17f4-1d2c-f6d1-bd741b65e032@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nikolay Borisov <n.borisov.lkml@gmail.com>, linux-kbuild@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, yann.morin.1998@free.fr

On 2016-12-15 19:09, Nikolay Borisov wrote:
> Hello,
> 
> I was doing some kasan-related debugging and when I enabled it I started
> getting warnings for large stackframes. So CONFIG_FRAME_WARN has :
> 
> int "Warn for stack frames larger than (needs gcc 4.4)"
>     range 0 8192
>     default 0 if KASAN
>     default 2048 if GCC_PLUGIN_LATENT_ENTROPY
>     default 1024 if !64BIT
>     default 2048 if 64BIT
> 
> This means that frame_warns should effectively be disabled when kasan is
> enabled. However in my case this is not the situation.
> http://sprunge.us/FiGf here is the config file. It does have
> CONFIG_KASAN=y and CONFIG_FRAME_WARN=1024 . And even this is erroneous
> since it's a 64bit kernel, so it should be 2k. I haven't manually set
> the limit to 1k either.

I guess the problem is that it's an option with a propt, so deviating
from the default value is legitimate. And most likely the
value is computed during menuconfig startup and a subsequent change of
CONFIG_KASAN does not change it (because 2048 or 1048 are also valid).

Michal
