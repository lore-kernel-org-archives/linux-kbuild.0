Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:48012 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbfKKBcH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Nov 2019 20:32:07 -0500
Date: Sun, 10 Nov 2019 17:32:03 -0800 (PST)
Message-Id: <20191110.173203.1243596361382467520.davem@davemloft.net>
Subject: Re: [PATCH] sparc: vdso: Fix build failure seen due to kbuild
 changes
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191111011106.18427-1-linux@roeck-us.net>
References: <20191111011106.18427-1-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux@roeck-us.net
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, maz@kernel.org

From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 10 Nov 2019 17:11:06 -0800

> sparc64:allmodconfig fails to build with the following error.
> 
> unrecognized e_machine 18 arch/sparc/vdso/vdso32/vclock_gettime.o
> arch/sparc/vdso/vdso32/vclock_gettime.o: failed
> make[2]: *** [arch/sparc/vdso/vdso32/vclock_gettime.o] Error 1
> make[2]: *** Deleting file 'arch/sparc/vdso/vdso32/vclock_gettime.o'
> make[2]: *** Waiting for unfinished jobs....
> 
> The problem bisects to commit a3de7a72c517 ("kbuild: change
> *FLAGS_<basetarget>.o to take the path relative to $(obj)").
> Duplicate the x86 specific defines from this commit to the sparc
> vdso Makefile to fix the problem.
> 
> Fixes: a3de7a72c517 ("kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)")
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: David S. Miller <davem@davemloft.net>
