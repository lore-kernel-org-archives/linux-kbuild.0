Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:41965 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760195AbdKPQqN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 11:46:13 -0500
Received: by mail-io0-f179.google.com with SMTP id g73so5841807ioj.8
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 08:46:13 -0800 (PST)
Date: Thu, 16 Nov 2017 08:46:08 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 11/18] arm64: make mrs_s and msr_s macros work with LTO
Message-ID: <20171116164608.GG94341@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-12-samitolvanen@google.com>
 <20171116115433.GG9361@arm.com>
 <20171116130742.wijnukjetoupi4hc@yury-thinkpad>
 <20171116135650.GQ10515@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116135650.GQ10515@gate.crashing.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Yury Norov <ynorov@caviumnetworks.com>, Will Deacon <will.deacon@arm.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 16, 2017 at 07:56:50AM -0600, Segher Boessenkool wrote:
> The compiler is fine, the assembler is fine (and the linker has
> nothing to do with it).  Your code is not fine.

Would you care to elaborate? The current code assumes that macros are
visible in other inline assembly blocks, and LLVM developers seem to
feel this isn't correct behavior. This patch fixes the current code so
it works with both assemblers.

Sami
