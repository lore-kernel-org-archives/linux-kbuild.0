Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:56752 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752631AbcD1Vcl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Apr 2016 17:32:41 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] kbuild: fix ksym_dep_filter when multiple EXPORT_SYMBOL() on the same line
Date: Thu, 28 Apr 2016 23:32:33 +0200
Message-ID: <3457892.00DyBUGcjQ@wuerfel>
In-Reply-To: <alpine.LFD.2.20.1604281718520.5091@knanqh.ubzr>
References: <alpine.LFD.2.20.1604281718520.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Thursday 28 April 2016 17:29:42 Nicolas Pitre wrote:
> In kernel/cgroup.c there is:
> 
>     #define SUBSYS(_x)                                             \
>         DEFINE_STATIC_KEY_TRUE(_x ## _cgrp_subsys_enabled_key);    \
>         DEFINE_STATIC_KEY_TRUE(_x ## _cgrp_subsys_on_dfl_key);     \
>         EXPORT_SYMBOL_GPL(_x ## _cgrp_subsys_enabled_key);         \
>         EXPORT_SYMBOL_GPL(_x ## _cgrp_subsys_on_dfl_key);
> 
> The expansion of this macro causes multiple EXPORT_SYMBOL_GPL() instances
> to appear on the same preprocessor line output, confusing the sed script
> expecting only one of them per line.  Unfortunately this can't be fixed
> nicely in the sed script as sed's regexp can't do non greedy matching.
> 
> Fix this by turning any semicolon into a line break before filtering.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>

Tested-by: Arnd Bergmann <arnd@arndb.de>
