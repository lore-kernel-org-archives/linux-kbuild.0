Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:58894 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751245AbdKTPVp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 10:21:45 -0500
Date: Mon, 20 Nov 2017 15:21:40 +0000
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 00/18] Add support for clang LTO
Message-ID: <20171120152139.mfqthlbneeeiythr@lakrids.cambridge.arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>


Hi,

On Wed, Nov 15, 2017 at 01:34:10PM -0800, Sami Tolvanen wrote:
> This series adds build system support for compiling the kernel with clang
> Link Time Optimization (LTO), using GNU gold with the LLVMgold plug-in
> for linking. 

As a high-level comment, this path series is rather confusing for
maintainers, since it's a mixture of basic support, workarounds, and a
new feature, and the commit messages aren't that helpful for those of us
unfamiliar with clang.

It would be *very* helpful if this could be split into a few smaller
patch series that built atop of each other.

Would it be possible to split this into:

(1) (basic) arm64 clang support
(2) gold support (no LTO)
(3) LTO support

... with any necessary workarounds added as-required to the relevant
series?

I think (1) is just the clang-version, -mno-implicit-float, and KVM
patches, and that might stand a chance of getting in soon. IIUC that
fixes the outstanding issues with basic clang support, and would give us
all a common baseline for review, testing, and future debugging.

Thanks,
Mark.
