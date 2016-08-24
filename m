Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42995 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932942AbcHXWhp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Aug 2016 18:37:45 -0400
Subject: Re: [PATCH v2] fixdep: faster CONFIG_ search
References: <20160824180305.GA22266@p183.telecom.by>
From: Michal Marek <mmarek@suse.com>
Message-ID: <57BE21AB.9020908@suse.com>
Date: Thu, 25 Aug 2016 00:37:31 +0200
MIME-Version: 1.0
In-Reply-To: <20160824180305.GA22266@p183.telecom.by>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

Dne 24.8.2016 v 20:03 Alexey Dobriyan napsal(a):
> Do you think kernel build is 100% dominated by gcc? You are wrong!
> One small utility called "fixdep" consistently manages to sneak into
> profile's first page (unless you have small monitor of course).
> 
> The choke point is this clever code:
> 
> 	for (; m < end; m++) {
> 		if (*m == INT_CONF) { p = (char *) m  ; goto conf; }
> 		if (*m == INT_ONFI) { p = (char *) m-1; goto conf; }
> 		if (*m == INT_NFIG) { p = (char *) m-2; goto conf; }
> 		if (*m == INT_FIG_) { p = (char *) m-3; goto conf; }
> 
> 4 branches per 4 characters is not fast.
> 
> Use strstr(3), so that SSE2 etc can be used.
> 
> With this patch, fixdep is so deep at the bottom, it is hard to find it.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---

Thanks, applied to kbuild.git#kbuild.

Michal

