Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ej1-f65.google.com ([209.85.218.65]:43621 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728843AbgFXNJ2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 09:09:28 -0400
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH v2 5/5] gcc-plugins/stackleak: Add 'verbose' plugin
 parameter
References: <20200624123330.83226-1-alex.popov@linux.com>
 <20200624123330.83226-6-alex.popov@linux.com>
 <20200624125305.GG4332@42.do-not-panic.com>
From: Alexander Popov <alex.popov@linux.com>
Message-ID: <d7b118c1-0369-9aef-bd34-afc9bafc7e7b@linux.com>
Date: Wed, 24 Jun 2020 16:09:20 +0300
MIME-Version: 1.0
In-Reply-To: <20200624125305.GG4332@42.do-not-panic.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>, Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org

On 24.06.2020 15:53, Luis Chamberlain wrote:
> On Wed, Jun 24, 2020 at 03:33:30PM +0300, Alexander Popov wrote:
>> Add 'verbose' plugin parameter for stackleak gcc plugin.
>> It can be used for printing additional info about the kernel code
>> instrumentation.
>>
>> For using it add the following to scripts/Makefile.gcc-plugins:
>>   gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK) \
>>     += -fplugin-arg-stackleak_plugin-verbose
> 
> Would be nice if we instead could pass an argument to make which lets
> us enable this.

This feature is useful only for debugging stackleak gcc plugin.

The cflag that enables it is similar to -fplugin-arg-structleak_plugin-verbose,
which is used for debugging the structleak plugin.

This debugging feature clutters the kernel build output, I don't think that many
people will use it. So IMO creating a separate argument for make is not really
needed.

Thanks!

Best regards,
Alexander
