Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:58368 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751213AbdKTOr0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 09:47:26 -0500
Date: Mon, 20 Nov 2017 14:47:20 +0000
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 09/18] arm64: explicitly pass
 --no-fix-cortex-a53-843419 to GNU gold
Message-ID: <20171120144720.bf27bpuwq4huhkdp@lakrids.cambridge.arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-10-samitolvanen@google.com>
 <20171116114722.GD9361@arm.com>
 <20171116163549.GD94341@samitolvanen.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116163549.GD94341@samitolvanen.mtv.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Will Deacon <will.deacon@arm.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 16, 2017 at 08:35:49AM -0800, Sami Tolvanen wrote:
> On Thu, Nov 16, 2017 at 11:47:23AM +0000, Will Deacon wrote:
> > But if ARM64_ERRATUM_843419 is enabled, we'll go ahead and generate
> > broken code?
> 
> This bug has been fixed in all current versions of GNU gold, but of
> course, if someone is using a broken linker, it will generate broken
> code. We can't do anything about that in the kernel.

However, we could instead check ld-version, produce a warning, and abort
the build in such cases.

Which would be better than silently producing a kernel that won't work
correctly.

Thanks,
Mark.
