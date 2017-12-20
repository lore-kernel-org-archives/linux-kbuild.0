Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:41040 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755755AbdLTRLt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Dec 2017 12:11:49 -0500
Received: by mail-vk0-f66.google.com with SMTP id v70so6174522vkd.8
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Dec 2017 09:11:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9b9d3322-9028-8100-225a-dd50f70de9be@intel.com>
References: <20171016171246.15712-1-dianders@chromium.org> <20171016171246.15712-3-dianders@chromium.org>
 <9b9d3322-9028-8100-225a-dd50f70de9be@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Dec 2017 09:11:47 -0800
Message-ID: <CAD=FV=UeWFRsVadUfc+74EvYGNfQ4OnRDnC_CxZ9RvnbFA=0QA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] kbuild: Cache a few more calls to the compiler
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Guenter Roeck <groeck@chromium.org>, Simon Glass <sjg@chromium.org>, Brian Norris <briannorris@chromium.org>, Ingo Molnar <mingo@kernel.org>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi,

On Tue, Dec 19, 2017 at 5:18 PM, Dave Hansen <dave.hansen@intel.com> wrote:
> I'm seeing some build breakage that I bisected to commit 4e56207130eda:
>
>>   CC      kernel/bounds.s
>> In file included from /home/davehans/linux.git/include/asm-generic/bug.h:15:0,
>>                  from /home/davehans/linux.git/arch/x86/include/asm/bug.h:81,
>>                  from /home/davehans/linux.git/include/linux/bug.h:4,
>>                  from /home/davehans/linux.git/include/linux/page-flags.h:9,
>>                  from /home/davehans/linux.git/kernel/bounds.c:9:
>> /home/davehans/linux.git/include/linux/kernel.h:5:20: fatal error: stdarg.h: No such file or directory
>>  #include <stdarg.h>
>>                     ^
>> compilation terminated.
>
> It's odd because I'm pretty sure I've done 4.15-rc compiles on this
> system before without issues.  I suspect something in my config
> (attached) is triggering this.
>
> Does this look familiar to anyone?
>
> gcc -v
> Using built-in specs.
> COLLECT_GCC=/usr/bin/gcc
> COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-redhat-linux/6.4.1/lto-wrapper
> Target: x86_64-redhat-linux
> Configured with: ../configure --enable-bootstrap
> --enable-languages=c,c++,objc,obj-c++,fortran,ada,go,lto --prefix=/usr
> --mandir=/usr/share/man --infodir=/usr/share/info
> --with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-shared
> --enable-threads=posix --enable-checking=release --enable-multilib
> --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions
> --enable-gnu-unique-object --enable-linker-build-id
> --with-linker-hash-style=gnu --enable-plugin --enable-initfini-array
> --disable-libgcj --with-isl --enable-libmpx
> --enable-gnu-indirect-function --with-tune=generic --with-arch_32=i686
> --build=x86_64-redhat-linux
> Thread model: posix
> gcc version 6.4.1 20170727 (Red Hat 6.4.1-1) (GCC)

Yes, it appears to be related to upgrading your compiler without doing
a "make clean".  Discussion can be found at
<https://lkml.org/lkml/2017/12/16/315>, or search for the subject

  [BUG] Build error for 4.15-rc3 kernel caused by patch "kbuild: Add a
cache for generated variables"

-Doug
