Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47817 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751445AbaJAVZH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Oct 2014 17:25:07 -0400
Message-ID: <542C7131.1090902@suse.cz>
Date: Wed, 01 Oct 2014 23:25:05 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] kbuild: handle C=... and M=... after entering into
 build directory
References: <1410260544-22657-1-git-send-email-yamada.m@jp.panasonic.com> <1410260544-22657-4-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1410260544-22657-4-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Dne 9.9.2014 13:02, Masahiro Yamada napsal(a):
>  sub-make: FORCE
>  	$(Q)$(MAKE) -C $(KBUILD_OUTPUT) KBUILD_SRC=$(CURDIR) \
> -	KBUILD_EXTMOD="$(KBUILD_EXTMOD)" -f $(CURDIR)/Makefile \
> -	$(filter-out _all sub-make,$(MAKECMDGOALS))
> +	-f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS))
>  
>  # Leave processing to above invocation of make
>  skip-makefile := 1
> @@ -188,6 +158,34 @@ ifeq ($(skip-makefile),)
>  # so that IDEs/editors are able to understand relative filenames.
>  MAKEFLAGS += --no-print-directory
>  
> +# Call a source code checker (by default, "sparse") as part of the
> +# C compilation.
> +#
> +# Use 'make C=1' to enable checking of only re-compiled files.
> +# Use 'make C=2' to enable checking of *all* source files, regardless
> +# of whether they are re-compiled or not.
> +#
> +# See the file "Documentation/sparse.txt" for more details, including
> +# where to get the "sparse" utility.
> +
> +ifeq ("$(origin C)", "command line")

I thought that the origin check would not work in the sub-make, because
the variables are part of the environment. But the sub-makes learn about
commandline variables from the MAKEFLAGS variable, so it works as
expected. Nice cleanup!

Michal
