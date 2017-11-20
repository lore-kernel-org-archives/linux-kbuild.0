Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33937 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751123AbdKTVBr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 16:01:47 -0500
Received: by mail-it0-f68.google.com with SMTP id m11so5410052iti.1
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Nov 2017 13:01:47 -0800 (PST)
Date: Mon, 20 Nov 2017 13:01:43 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 16/18] arm64: crypto: disable LTO for aes-ce-cipher.c
Message-ID: <20171120210143.GD89108@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-17-samitolvanen@google.com>
 <20171120152014.hftuded4zxwn2r7m@lakrids.cambridge.arm.com>
 <CAKv+Gu-hnoeLqNsHbrLXv3xu7qsYB6REiwMtQYW_0CPwZ7jF4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu-hnoeLqNsHbrLXv3xu7qsYB6REiwMtQYW_0CPwZ7jF4g@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Mon, Nov 20, 2017 at 03:25:31PM +0000, Ard Biesheuvel wrote:
> However, under LTO this all changes, and it is no longer guaranteed
> that the NEON registers are only touched between the kernel mode
> neon begin/end calls.

LTO operates on LLVM IR, so disabling LTO for this file should make
sure there won't be any unsafe optimizations. Are there other places
in the kernel that might have this issue?

> So the correct way to fix this would be to move the asm into its own
> .S file, and call it from between the kernel_mode_neon_begin/end
> calls. That should also fix your compat issue.

Sure, that would also work.
 
Sami
