Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:42177 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751097AbeDDNUh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Apr 2018 09:20:37 -0400
Subject: Re: [PATCH v2] tools: fix cross-compile var clobbering
References: <20180106201601.11074-1-martin@martingkelly.com>
 <20180107214028.23771-1-martin@martingkelly.com>
From: Jiri Slaby <jslaby@suse.cz>
Message-ID: <cc9e8b57-b2e0-91a5-aa9f-9488c78a9860@suse.cz>
Date: Wed, 4 Apr 2018 15:20:33 +0200
MIME-Version: 1.0
In-Reply-To: <20180107214028.23771-1-martin@martingkelly.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Kelly <martin@martingkelly.com>, linux-kbuild@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, Linus Walleij <linus.walleij@linaro.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Robert Moore <robert.moore@intel.com>, Lv Zheng <lv.zheng@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuahkh@osg.samsung.com>, Shuah Khan <shuah@kernel.org>, Mario Limonciello <mario.limonciello@dell.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On 01/07/2018, 10:40 PM, Martin Kelly wrote:
> From: Martin Kelly <martin@martingkelly.com>
...
> --- a/tools/power/acpi/Makefile.config
> +++ b/tools/power/acpi/Makefile.config
> @@ -56,9 +56,6 @@ INSTALL_SCRIPT = ${INSTALL_PROGRAM}
>  # to compile vs uClibc, that can be done here as well.
>  CROSS = #/usr/i386-linux-uclibc/usr/bin/i386-uclibc-
>  CROSS_COMPILE ?= $(CROSS)
> -CC = $(CROSS_COMPILE)gcc
> -LD = $(CROSS_COMPILE)gcc

This one makes difference -- acpi is special. This used to be:
LD = gcc

Now it is:
LD = ld

And due to that, we get:
ld: unrecognized option '-D_LINUX'

Should we do:
LD = $(CC)

or fix this elsewhere differently?

thanks,
-- 
js
suse labs
