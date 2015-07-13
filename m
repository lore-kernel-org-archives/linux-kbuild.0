Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37352 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751201AbbGMK7f (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Jul 2015 06:59:35 -0400
Date: Mon, 13 Jul 2015 20:59:33 +1000
From: Anton Blanchard <anton@samba.org>
Subject: Re: [PATCH v2] Makefile: Fix detection of clang when
 cross-compiling
Message-ID: <20150713205933.002f9396@kryten>
In-Reply-To: <559EFF2F.1070301@converseincode.com>
References: <1429306504-26122-1-git-send-email-paul@crapouillou.net>
	<20150422143320.GB19277@sepie.suse.cz>
	<559EFF2F.1070301@converseincode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Behan Webster <behanw@converseincode.com>
Cc: Michal Marek <mmarek@suse.cz>, Paul Cercueil <paul@crapouillou.net>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>

Hi,

>      > When the host's C compiler is clang, and when attempting to
>      > cross-compile Linux e.g. to MIPS with mipsel-linux-gcc, the
>      > Makefile would incorrectly detect the use of clang, which
>      > resulted in clang-specific flags being passed to
>      > mipsel-linux-gcc.
>      >
>      > This can be verified under Debian by installing the "clang"
>      > package, and then using it as the default compiler with:
>      > sudo update-alternatives --config cc
>      >
>      > This patch moves the detection of clang after the $(CC)
>      > variable is initialized to the name of the cross-compiler, so
>      > that the check applies
>      > to the cross-compiler and not the host's C compiler.
>      >
>      > v2: Move the detection of clang after the inclusion of the
>      > arch/*/Makefile (as they might set $(CROSS_COMPILE))
>      >
>      > Signed-off-by: Paul Cercueil <paul@crapouillou.net
>     <mailto:paul@crapouillou.net>>
> 
>     Applied to kbuild.git#kbuild. I will push it after v4.1-rc1
>     becomes available, though.
> 
> Drat. I wish I saw this earlier.
> 
> This breaks patches which check for the value of COMPILER in 
> arch/*/Makefile. This detection must be performed before the
> inclusion of the arch Makefile.
> 
> Can I move this to after the initialization of CC but before the
> include?
> 
> I'm not sure that being able to define the default compiler per arch
> is necessary. But I know I need to be able to add arch specific flags
> for clang.

I can confirm the patch breaks ppc64le clang builds.

Anton
