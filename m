Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59020 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751916Ab2DBVbZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Apr 2012 17:31:25 -0400
Message-ID: <4F7A1AA6.8000702@suse.cz>
Date: Mon, 02 Apr 2012 23:31:18 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Fix build failure on cygwin.
References: <1333375535-6589-1-git-send-email-andree@andree.sk>
In-Reply-To: <1333375535-6589-1-git-send-email-andree@andree.sk>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrej Krutak <andree@andree.sk>
Cc: linux-kbuild@vger.kernel.org, Jon Loeliger <jdl@jdl.com>

Adding Jon Loeliger (dtc maintainer) to CC.


Dne 2.4.2012 16:05, Andrej Krutak napsal(a):
> The _B macro is defined by cygwin in ctype.h.
> Move the inclusion to avoid build failure.

But nothing prevents the other system headers from including <ctype.h>
earlier :-(. A more robust fix would be to rename the macro to something
that does not clash (fdt_b??). But that's up to Jon.

Michal

> 
> Signed-off-by: Andrej Krutak <andree@andree.sk>
> ---
>  scripts/dtc/dtc.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/dtc/dtc.h b/scripts/dtc/dtc.h
> index f37c97e..7aa3cc6 100644
> --- a/scripts/dtc/dtc.h
> +++ b/scripts/dtc/dtc.h
> @@ -27,13 +27,13 @@
>  #include <stdint.h>
>  #include <stdarg.h>
>  #include <assert.h>
> -#include <ctype.h>
>  #include <errno.h>
>  #include <unistd.h>
>  
>  #include <libfdt_env.h>
>  #include <fdt.h>
>  
> +#include <ctype.h>
>  #include "util.h"
>  
>  #ifdef DEBUG

