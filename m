Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:54453 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751716AbdKHTnS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Nov 2017 14:43:18 -0500
Received: by mail-ot0-f193.google.com with SMTP id w8so3300469otw.11
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Nov 2017 11:43:18 -0800 (PST)
Subject: Re: [PATCH v2 0/3] Makefile: Introduce CONFIG_CC_STACKPROTECTOR_AUTO
References: <1510076320-69931-1-git-send-email-keescook@chromium.org>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <1a23e5eb-66d7-2e86-e918-fd5eabb4c014@redhat.com>
Date: Wed, 8 Nov 2017 11:43:14 -0800
MIME-Version: 1.0
In-Reply-To: <1510076320-69931-1-git-send-email-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/07/2017 09:38 AM, Kees Cook wrote:
> As described in the final patch:
> 
> Nearly all modern compilers support a stack-protector option, and nearly
> all modern distributions enable the kernel stack-protector, so enabling
> this by default in kernel builds would make sense. However, Kconfig does
> not have knowledge of available compiler features, so it isn't safe to
> force on, as this would unconditionally break builds for the compilers
> or architectures that don't have support. Instead, this introduces a new
> option, CONFIG_CC_STACKPROTECTOR_AUTO, which attempts to discover the best
> possible stack-protector available, and will allow builds to proceed even
> if the compiler doesn't support any stack-protector.
> 
> This option is made the default so that kernels built with modern
> compilers will be protected-by-default against stack buffer overflows,
> avoiding things like the recent BlueBorne attack. Selection of a specific
> stack-protector option remains available, including disabling it.
> 
> 
> This has lived over the last several days without any unfixed 0day failures.
> 
> v2:
> - under ..._AUTO, warn and continue on _all_ stack protector failure cases
> - fix 32-bit boot regression due to lazy gz.
> - set CONFIG_CC_STACKPROTECTOR_NONE for tiny.config.
> 
> Thanks,
> 
> -Kees
> 

This passed a test build on all Fedora arches, including s390 and ppc.
On x86 it picks up the strong option correctly.

You're welcome to add

Tested-by: Laura Abbott <labbott@redhat.com>

Thanks,
Laura
