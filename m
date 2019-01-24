Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:49243 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727358AbfAXDk0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Jan 2019 22:40:26 -0500
In-Reply-To: <1547176954-17739-2-git-send-email-yamada.masahiro@socionext.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [1/3] KVM: powerpc: remove -I. header search paths
Message-Id: <43lSbX4lX3z9sBn@ozlabs.org>
Date: Thu, 24 Jan 2019 14:40:24 +1100 (AEDT)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org

On Fri, 2019-01-11 at 03:22:31 UTC, Masahiro Yamada wrote:
> The header search path -I. in kernel Makefiles is very suspicious;
> it allows the compiler to search for headers in the top of $(srctree),
> where obviously no header file exists.
> 
> Commit 46f43c6ee022 ("KVM: powerpc: convert marker probes to event
> trace") first added these options, but they are completely useless.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c142e9741e61577c45f2441214c999f2

cheers
