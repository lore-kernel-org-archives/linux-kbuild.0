Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:52926 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753312AbdKIBMd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Nov 2017 20:12:33 -0500
Received: by mail-it0-f66.google.com with SMTP id j140so8791482itj.1
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Nov 2017 17:12:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1a23e5eb-66d7-2e86-e918-fd5eabb4c014@redhat.com>
References: <1510076320-69931-1-git-send-email-keescook@chromium.org> <1a23e5eb-66d7-2e86-e918-fd5eabb4c014@redhat.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 8 Nov 2017 17:12:31 -0800
Message-ID: <CAGXu5jKfFPmYeToO9tO6g_j9yAHs5WXmnzidUFnzJAHVsDQ-sQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Makefile: Introduce CONFIG_CC_STACKPROTECTOR_AUTO
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Nov 8, 2017 at 11:43 AM, Laura Abbott <labbott@redhat.com> wrote:
> On 11/07/2017 09:38 AM, Kees Cook wrote:
>>
>> As described in the final patch:
>>
>> Nearly all modern compilers support a stack-protector option, and nearly
>> all modern distributions enable the kernel stack-protector, so enabling
>> this by default in kernel builds would make sense. However, Kconfig does
>> not have knowledge of available compiler features, so it isn't safe to
>> force on, as this would unconditionally break builds for the compilers
>> or architectures that don't have support. Instead, this introduces a new
>> option, CONFIG_CC_STACKPROTECTOR_AUTO, which attempts to discover the best
>> possible stack-protector available, and will allow builds to proceed even
>> if the compiler doesn't support any stack-protector.
>>
>> This option is made the default so that kernels built with modern
>> compilers will be protected-by-default against stack buffer overflows,
>> avoiding things like the recent BlueBorne attack. Selection of a specific
>> stack-protector option remains available, including disabling it.
>>
>>
>> This has lived over the last several days without any unfixed 0day
>> failures.
>>
>> v2:
>> - under ..._AUTO, warn and continue on _all_ stack protector failure cases
>> - fix 32-bit boot regression due to lazy gz.
>> - set CONFIG_CC_STACKPROTECTOR_NONE for tiny.config.
>>
>> Thanks,
>>
>> -Kees
>>
>
> This passed a test build on all Fedora arches, including s390 and ppc.
> On x86 it picks up the strong option correctly.
>
> You're welcome to add
>
> Tested-by: Laura Abbott <labbott@redhat.com>

Awesome, thanks for testing!

-Kees

-- 
Kees Cook
Pixel Security
