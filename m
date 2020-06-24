Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qv1-f67.google.com ([209.85.219.67]:35624 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388776AbgFXM5H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 08:57:07 -0400
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH v2 2/5] ARM: vdso: Don't use gcc plugins for building
 vgettimeofday.c
References: <20200624123330.83226-1-alex.popov@linux.com>
 <20200624123330.83226-3-alex.popov@linux.com>
 <20200624125236.GF4332@42.do-not-panic.com>
From: Alexander Popov <alex.popov@linux.com>
Message-ID: <f8d52f40-221b-5219-ca16-9d889252547a@linux.com>
Date: Wed, 24 Jun 2020 15:56:54 +0300
MIME-Version: 1.0
In-Reply-To: <20200624125236.GF4332@42.do-not-panic.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>, Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org

On 24.06.2020 15:52, Luis Chamberlain wrote:
> On Wed, Jun 24, 2020 at 03:33:27PM +0300, Alexander Popov wrote:
>> Don't use gcc plugins for building arch/arm/vdso/vgettimeofday.c to
>> avoid unneeded instrumentation.
>>
>> Signed-off-by: Alexander Popov <alex.popov@linux.com>
> 
> But why is skipping it safe?

Hello Luis,

Kees and Will discussed that in detail in v1 of the series:
https://lore.kernel.org/lkml/20200610073046.GA15939@willie-the-truck/

Best regards,
Alexander
