Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33181 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbgFKXpJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jun 2020 19:45:09 -0400
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH 2/5] gcc-plugins/stackleak: Use asm instrumentation to
 avoid useless register saving
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-3-alex.popov@linux.com>
 <202006091143.AD1A662@keescook>
 <757cbafb-1e13-8989-e30d-33c557d33cc4@linux.com>
 <202006101302.AC218FA1@keescook>
From: Alexander Popov <alex.popov@linux.com>
Message-ID: <ee1a5921-c151-33a9-bdac-c5d039a94bdc@linux.com>
Date: Fri, 12 Jun 2020 02:45:00 +0300
MIME-Version: 1.0
In-Reply-To: <202006101302.AC218FA1@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org

On 10.06.2020 23:03, Kees Cook wrote:
> On Wed, Jun 10, 2020 at 06:47:14PM +0300, Alexander Popov wrote:
>> On 09.06.2020 21:46, Kees Cook wrote:
>> The inline asm statement that is used for instrumentation is arch-specific.
>> Trying to add
>>   asm volatile("call stackleak_track_stack")
>> in gcc plugin on aarch64 makes gcc break spectacularly.
> 
> Ah! Thank you, that eluded my eyes. :)
> 
>> I pass the target arch name to the plugin and check it explicitly to avoid that.
>>
>> Moreover, I'm going to create a gcc enhancement request for supporting
>> no_caller_saved_registers attribute on aarch64.
> 
> For arm64 right now it looks like the plugin will just remain
> "inefficient" in these cleanup, as before, yes?

Yes, for arm64 the instrumentation didn't change in this patch series.
I checked the disasm and see the similar issue with useless register saving.

I'm going to add asm instrumentation for arm64 when (I hope) the
no_caller_saved_registers attribute becomes available for that platform.

Best regards,
Alexander
