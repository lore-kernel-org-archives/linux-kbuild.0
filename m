Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:33598 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932811AbcDYQBN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 12:01:13 -0400
Received: by mail-qg0-f45.google.com with SMTP id f92so31753191qgf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2016 09:01:12 -0700 (PDT)
Date: Mon, 25 Apr 2016 12:01:09 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH] kbuild: fix call to adjust_autoksyms.sh when output
 directory specified
In-Reply-To: <1461599708-1397-1-git-send-email-nicolas.ferre@atmel.com>
Message-ID: <alpine.LFD.2.20.1604251158260.5091@knanqh.ubzr>
References: <1461599708-1397-1-git-send-email-nicolas.ferre@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rusty Russell <rusty@rustcorp.com.au>

On Mon, 25 Apr 2016, Nicolas Ferre wrote:

> When a different output directory is specified during the build process (with
> O= or KBUILD_OUTPUT), the call to adjust_autoksyms.sh script fails with the
> following error:
> /bin/sh scripts/adjust_autoksyms.sh \
> 	  "make KBUILD_MODULES=1 -f ../Makefile autoksyms_recursive"
> 	  /bin/sh: scripts/adjust_autoksyms.sh: No such file or directory
> 	  make[2]: *** [vmlinux] Error 127
> 	  make[1]: *** [sub-make] Error 2
> 	  make: *** [__sub-make] Error 2
[...]

I posted a few fixes for this and some other issues already.

You may grab them all at once from this branch where I committed them on 
top of Michal's kbuild branch:

        git://git.linaro.org/people/nicolas.pitre/linux kbuild


Nicolas
