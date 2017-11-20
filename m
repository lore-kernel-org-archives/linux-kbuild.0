Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:58260 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751155AbdKTOnM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 09:43:12 -0500
Date: Mon, 20 Nov 2017 14:43:06 +0000
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 06/18] arm64: kvm: use -fno-jump-tables with clang
Message-ID: <20171120144306.z5uyeyectmce6plu@lakrids.cambridge.arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-7-samitolvanen@google.com>
 <20171120144147.7iawjcw644zc4xes@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171120144147.7iawjcw644zc4xes@lakrids.cambridge.arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On Mon, Nov 20, 2017 at 02:41:47PM +0000, Mark Rutland wrote:
> On Wed, Nov 15, 2017 at 01:34:16PM -0800, Sami Tolvanen wrote:
> > Use -fno-jump-tables to make sure clang doesn't generate branches
> > to EL1 virtual addresses.
> 
> Are there any other reasons that clang might generate absolute
> references/relocations?
> 
> It would be nice if there was the option to disable that more generally,
> rather than disabling individual optimizations. Is there any PIC/PIE
> option that we could use?
> 
> We might need something simnilar for GCC, even if we're not seeing
> problems today.

... and likewise for the EFI stub, which needs to be
position-independent much like the hyp code.

Thanks,
Mark.
