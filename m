Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:40438 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935962AbdKPQlH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 11:41:07 -0500
Received: by mail-it0-f65.google.com with SMTP id 72so700209itl.5
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 08:41:07 -0800 (PST)
Date: Thu, 16 Nov 2017 08:41:01 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 10/18] arm64: add a workaround for GNU gold with
 ARM64_MODULE_PLTS
Message-ID: <20171116164101.GE94341@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-11-samitolvanen@google.com>
 <20171116115012.GE9361@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116115012.GE9361@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 16, 2017 at 11:50:12AM +0000, Will Deacon wrote:
> Why don't we just not do LTO if the toolchain is busted?

Because LTO can not only potentially improve performance, especially
when combined with PGO (Profile Guided Optimization), but it also
makes it possible to enable features like Control Flow Integrity that
can make kernel vulnerabilities more difficult to exploit:

  https://clang.llvm.org/docs/ControlFlowIntegrity.html

> This feels like it will end up being a game of whack-a-mole as code
> could be introduced that tickles known bugs on older toolchains.

I'm not sure this is much different from dealing with older versions
of the existing toolchain. Otherwise, we wouldn't need cc-version or
other similar macros, for example.

Sami
