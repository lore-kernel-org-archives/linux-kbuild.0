Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36958 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728231AbgFJPPF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jun 2020 11:15:05 -0400
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH 0/5] Improvements of the stackleak gcc plugin
References: <20200604134957.505389-1-alex.popov@linux.com>
 <202006091210.C139883AB@keescook>
From: Alexander Popov <alex.popov@linux.com>
Message-ID: <729988fe-5f92-645c-15a0-eda0f0afbbcb@linux.com>
Date: Wed, 10 Jun 2020 18:14:51 +0300
MIME-Version: 1.0
In-Reply-To: <202006091210.C139883AB@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org

On 09.06.2020 22:15, Kees Cook wrote:
> On Thu, Jun 04, 2020 at 04:49:52PM +0300, Alexander Popov wrote:
>> In this patch series I collected various improvements of the stackleak
>> gcc plugin.
> 
> Thanks!
> 
>> Alexander Popov (5):
>>   gcc-plugins/stackleak: Exclude alloca() from the instrumentation logic
>>   gcc-plugins/stackleak: Use asm instrumentation to avoid useless
>>     register saving
> 
> These look like they might need tweaks (noted in their separate
> replies).

Thanks for the review, Kees.

>>   gcc-plugins/stackleak: Add 'verbose' plugin parameter
>>   gcc-plugins/stackleak: Don't instrument itself
> 
> If you wanted to reorder the series and move these first, I could take
> these into my tree right away (they're logically separate from the other
> fixes).

Ok, I will put "don't instrument itself" at the beginning of v2.

The patch adding 'verbose' plugin parameter depends on the previous patches, so
I will not move it.

>>   gcc-plugins/stackleak: Don't instrument vgettimeofday.c in arm64 VDSO
> 
> This seems good -- though I'm curious about 32-bit ARM and the other
> HAVE_GCC_PLUGINS architectures with vDSOs (which appears to be all of
> them except um).

(going to reply in a separate email)

Best regards,
Alexander
