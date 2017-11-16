Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:39692 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936091AbdKPQnL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 11:43:11 -0500
Received: by mail-it0-f67.google.com with SMTP id y15so718191ita.4
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 08:43:10 -0800 (PST)
Date: Thu, 16 Nov 2017 08:43:06 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 11/18] arm64: make mrs_s and msr_s macros work with LTO
Message-ID: <20171116164306.GF94341@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-12-samitolvanen@google.com>
 <20171116115433.GG9361@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116115433.GG9361@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 16, 2017 at 11:54:33AM +0000, Will Deacon wrote:
> What limitations? Can you elaborate please? Is this a fix?

The commit message in v1 was more informative, I'll change this back for v3:

--

Clang's integrated assembler does not allow assembly macros defined
in one inline asm block using the .macro directive to be used across
separate asm blocks. LLVM developers consider this a feature and not a
bug, recommending code refactoring:

https://bugs.llvm.org/show_bug.cgi?id=19749

As binutils doesn't allow macros to be redefined, this change adds C
preprocessor macros that define the assembly macros globally for binutils
and locally for clang's integrated assembler.

Sami
