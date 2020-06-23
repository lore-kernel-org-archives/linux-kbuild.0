Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:40477 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731158AbgFWKQn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jun 2020 06:16:43 -0400
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH 5/5] gcc-plugins/stackleak: Don't instrument
 vgettimeofday.c in arm64 VDSO
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-6-alex.popov@linux.com>
 <20200604135806.GA3170@willie-the-truck> <202006091149.6C78419@keescook>
 <20200610073046.GA15939@willie-the-truck>
From: Alexander Popov <alex.popov@linux.com>
Message-ID: <02f576e5-6512-99ca-0de0-a4239c6063ca@linux.com>
Date: Tue, 23 Jun 2020 13:16:28 +0300
MIME-Version: 1.0
In-Reply-To: <20200610073046.GA15939@willie-the-truck>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will@kernel.org>, Kees Cook <keescook@chromium.org>
Cc: Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org

On 10.06.2020 10:30, Will Deacon wrote:
> On Tue, Jun 09, 2020 at 12:09:27PM -0700, Kees Cook wrote:
>> arm_ssp_per_task_plugin.c
>> 	32-bit ARM only (but likely needs disabling for 32-bit ARM vDSO?)

I tested: on 32-bit arm vDSO is built with plugin flags. I will filter them out
in a separate patch in v2 of the series.

> On arm64, the 32-bit toolchain is picked up via CC_COMPAT -- does that still
> get the plugins?
I tested it with this command:
  make  ARCH=arm64 CROSS_COMPILE_COMPAT=arm-linux-gnueabi-
CROSS_COMPILE=aarch64-linux-gnu- V=1

I see that COMPAT_VDSO is built without plugin flags. So it's ok.

Best regards,
Alexander
