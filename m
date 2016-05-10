Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53798 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753233AbcEJPY5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2016 11:24:57 -0400
Date: Tue, 10 May 2016 17:24:56 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH] kbuild: fix ksym_dep_filter when multiple
	EXPORT_SYMBOL() on the same line
Message-ID: <20160510152456.GB13314@pobox.suse.cz>
References: <alpine.LFD.2.20.1604281718520.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1604281718520.5091@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org

On Thu, Apr 28, 2016 at 05:29:42PM -0400, Nicolas Pitre wrote:
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

Applied to kbuild.git#kbuild.

Michal
