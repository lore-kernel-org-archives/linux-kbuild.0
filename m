Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57764 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755401AbcK2OXC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Nov 2016 09:23:02 -0500
Subject: Re: [PATCH v4] Fixes for compiling with clang
References: <20161126182006.24815-1-pefoley2@pefoley.com>
 <20161128064446.4892-1-pefoley2@pefoley.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <b4a882d3-6125-e7b7-6c60-901fabfc23d9@suse.com>
Date: Tue, 29 Nov 2016 15:22:53 +0100
MIME-Version: 1.0
In-Reply-To: <20161128064446.4892-1-pefoley2@pefoley.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Foley <pefoley2@pefoley.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Dne 28.11.2016 v 07:44 Peter Foley napsal(a):
> Fix reversed conditional checking if HOSTCC is clang.
> Suppress warnings about unsupported optimization options.
> Suppress warnings about unused functions, as they are generated for
> every module and are therefore far too spammy.
> Disable clang's integrated assembler which is incompatible with kernel
> asm constructs.
> 
> Changes from v1:
> * Move the $(cc-name) conditional below the definition of $(CC)
> Changes from v2:
> * Actually commit the changes in v2.
> Changes from v3:
> * HOSTCC is not guaranteed to be the same as CC, adjust accordingly.
> 
> Signed-off-by: Peter Foley <pefoley2@pefoley.com>
> ---
>  Makefile | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 694111b43cf8..9c4803a74117 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -301,12 +301,12 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
>  
>  HOSTCC       = gcc
>  HOSTCXX      = g++
> -HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
> +HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89 \
> +               -Wno-unused-value -Wno-unused-parameter -Wno-missing-field-initializers
>  HOSTCXXFLAGS = -O2

This adds new -Wno-* options also for the gcc case, is there a reason
for this? Also, the -Wno-missing-field-initializers option is not
available in some old gccs, so we would need a HOSTCC equivalent of
cc-disable-warning.

Michal
