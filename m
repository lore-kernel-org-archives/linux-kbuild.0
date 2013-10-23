Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42008 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751525Ab3JWOnS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Oct 2013 10:43:18 -0400
Date: Wed, 23 Oct 2013 16:43:17 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [patch 2/2] ./Makefile: enable -Werror=implicit-int and
 -Werror=strict-prototypes by default
Message-ID: <20131023144317.GA27239@sepie.suse.cz>
References: <20130913215141.43D1931C1EA@corp2gmr1-1.hot.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130913215141.43D1931C1EA@corp2gmr1-1.hot.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org, slyfox@gentoo.org
Cc: linux-kbuild@vger.kernel.org, geert@linux-m68k.org

On Fri, Sep 13, 2013 at 02:51:40PM -0700, akpm@linux-foundation.org wrote:
> From: Sergei Trofimovich <slyfox@gentoo.org>
> Subject: ./Makefile: enable -Werror=implicit-int and -Werror=strict-prototypes by default
> 
> The common error found in forward-ported/backported patches is missing
> headers.  One recent example (files and function names are mangled):
> 
>     void foo(){}
>     EXPORT_SYMBOL(foo);
> 
> gave only warning
> 
>     foo.c:12345678:5: warning: function declaration isn't a prototype [-Wstrict-prototypes]
>     void foo(){}
>          ^
> 
>     foo.c:12345679:5: warning: data definition has no type or storage class [enabled by default]
>     EXPORT_SYMBOL(foo);
>     foo.c:12345679:5: warning: type defaults to 'int' in declaration of 'EXORT_SYMBOL' [-Werror=implicit-int]
> 
> Now it's a fatal error. Tested on x86_64 allyesconfig.
> 
> [akpm@linux-foundation.org: fix typos in comments]
> Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> Cc: Michal Marek <mmarek@suse.cz>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---

Added to kbuild.git#kbuild.

Michal
