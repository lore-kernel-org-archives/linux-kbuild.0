Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35802 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbgFJPwc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jun 2020 11:52:32 -0400
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH 3/5] gcc-plugins/stackleak: Add 'verbose' plugin parameter
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-4-alex.popov@linux.com>
 <202006091147.193047096C@keescook>
From: Alexander Popov <alex.popov@linux.com>
Message-ID: <fb051386-4913-9442-f051-23ed25802c9e@linux.com>
Date: Wed, 10 Jun 2020 18:52:10 +0300
MIME-Version: 1.0
In-Reply-To: <202006091147.193047096C@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org

On 09.06.2020 21:47, Kees Cook wrote:
> On Thu, Jun 04, 2020 at 04:49:55PM +0300, Alexander Popov wrote:
>> Add 'verbose' plugin parameter for stackleak gcc plugin.
>> It can be used for printing additional info about the kernel code
>> instrumentation.
>>
>> For using it add the following to scripts/Makefile.gcc-plugins:
>>   gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK) \
>>     += -fplugin-arg-stackleak_plugin-verbose
>>
>> Signed-off-by: Alexander Popov <alex.popov@linux.com>
> 
> Acked-by: Kees Cook <keescook@chromium.org>

I see that I will change this patch after leaving alloca() support.
I'm going to add debug printing about functions that call alloca().
I have to omit your 'acked-by' for the changed patch, right?

Best regards,
Alexander
