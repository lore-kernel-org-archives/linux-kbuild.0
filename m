Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:44486 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbeHYCox (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Aug 2018 22:44:53 -0400
Message-ID: <1535152080.2902.58.camel@codethink.co.uk>
Subject: Re: [PATCH 4.4 018/107] x86/paravirt: Make native_save_fl() extern
 inline
From: Ben Hutchings <ben.hutchings@codethink.co.uk>
Date: Sat, 25 Aug 2018 00:08:00 +0100
In-Reply-To: <20180723122413.797031305@linuxfoundation.org>
References: <20180723122413.003644357@linuxfoundation.org>
         <20180723122413.797031305@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: stable@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>, Tom Stellar <tstellar@redhat.com>, Sedat Dilek <sedat.dilek@gmail.com>, Juergen Gross <jgross@suse.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, acme@redhat.com, akataria@vmware.com, akpm@linux-foundation.org, andrea.parri@amarulasolutions.com, ard.biesheuvel@linaro.org, aryabinin@virtuozzo.com, astrachan@google.com, boris.ostrovsky@oracle.com, brijesh.singh@amd.com, caoj.fnst@cn.fujitsu.com, geert@linux-m68k.org, ghackmann@google.com, jan.kiszka@siemens.com, jarkko.sakkinen@linux.intel.com, joe@perches.com, jpoimboe@redhat.com, keescook@google.com, kirill.shutemov@linux.intel.com, kstewart@linuxfoundation.org, linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, manojgupta@google.com, mawilcox@microsoft.com, michal.lkml@markovi.net, mjg59@google.com, mka@chromium.org, pombredanne@nexb.com, rientjes@google.com, rostedt@goodmis.org, thomas.lendacky@amd.com, tweek@google.com, virtualization@lists.linux-foundation.org, will.deacon@arm.com, yamada.masahiro@socionext.com, Ingo Molnar <mingo@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, 2018-07-23 at 14:41 +0200, Greg Kroah-Hartman wrote:
> 4.4-stable review patch.  If anyone has any objections, please let me know.
> 
> ------------------
> 
> From: Nick Desaulniers <ndesaulniers@google.com>
> 
> commit d0a8d9378d16eb3c69bd8e6d23779fbdbee3a8c7 upstream.
> 
> native_save_fl() is marked static inline, but by using it as
> a function pointer in arch/x86/kernel/paravirt.c, it MUST be outlined.
> 
> paravirt's use of native_save_fl() also requires that no GPRs other than
> %rax are clobbered.
[...]

Shouldn't native_restore_fl() be changed similarly?  You added an out-
of-line definition, but it doesn't seem like it will actually be used.

Ben.

-- 
Ben Hutchings, Software Developer                         Codethink Ltd
https://www.codethink.co.uk/                 Dale House, 35 Dale Street
                                     Manchester, M1 2HF, United Kingdom
