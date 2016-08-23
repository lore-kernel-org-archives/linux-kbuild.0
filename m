Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42257 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756365AbcHWV3u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Aug 2016 17:29:50 -0400
Subject: Re: [PATCH] fixdep: faster CONFIG_ search
References: <20160823184724.GA11707@p183.telecom.by>
From: Michal Marek <mmarek@suse.com>
Message-ID: <57BCC041.8060204@suse.com>
Date: Tue, 23 Aug 2016 23:29:37 +0200
MIME-Version: 1.0
In-Reply-To: <20160823184724.GA11707@p183.telecom.by>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

Dne 23.8.2016 v 20:47 Alexey Dobriyan napsal(a):
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

It should be noted that the previous code also matched nested CONFIG_*
strings, like CONFIG_PROC inside CONFIG_IKCONFIG_PROC. But these are
pointless, so your patch is removing a few false matches.


> With this patch, fixdep is so deep at the bottom, it is hard to find it.

Nice.


> -		if (*m == INT_CONF) { p = (char *) m  ; goto conf; }
> -		if (*m == INT_ONFI) { p = (char *) m-1; goto conf; }
> -		if (*m == INT_NFIG) { p = (char *) m-2; goto conf; }
> -		if (*m == INT_FIG_) { p = (char *) m-3; goto conf; }

Please also remove the INT_* definitions and the test at startup.


> +	map = malloc(st.st_size + 1);
> +	if (!map) {
> +		perror("fixdep: malloc");
>  		close(fd);
>  		return;
>  	}
> +	if (read(fd, map, st.st_size) != st.st_size) {
> +		perror("fixdep: read");
> +		close(fd);
> +		return;
> +	}

I wanted to suggest memmem() instead of strstr() to avoid the extra
copy, but that would make use depend on glibc (this _might_ have been
the reason to use the manual string search, in fact). So let's leave
this as.

Michal
