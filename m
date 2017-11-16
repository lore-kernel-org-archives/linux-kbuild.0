Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:40535 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934979AbdKPQZW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 11:25:22 -0500
Received: by mail-it0-f68.google.com with SMTP id 72so634959itl.5
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 08:25:22 -0800 (PST)
Date: Thu, 16 Nov 2017 08:25:18 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 06/18] arm64: kvm: use -fno-jump-tables with clang
Message-ID: <20171116162518.GB94341@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-7-samitolvanen@google.com>
 <20171116114616.GC9361@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116114616.GC9361@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 16, 2017 at 11:46:17AM +0000, Will Deacon wrote:
> Can you elaborate a bit more on exactly what you saw failing here,
> please?

Mark noticed that clang built kernels fail to boot when the kernel
starts at EL2:

  http://lkml.iu.edu/hypermail/linux/kernel/1711.0/02817.html

Turns out starting with LLVM r308050, the compiler decides to use
a jump table in __init_stage2_translation, and generates code that
branches into an EL1 virtual address.

> Whilst it's obviously broken to jump to EL1 from EL2 w/o VHE, the
> commit message is a bit cryptic.

I agree, I'll add a more descriptive commit message for v3.

Sami
