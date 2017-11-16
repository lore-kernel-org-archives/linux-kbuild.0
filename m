Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:50094 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933732AbdKPLuE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 06:50:04 -0500
Date: Thu, 16 Nov 2017 11:50:12 +0000
From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v2 10/18] arm64: add a workaround for GNU gold with
 ARM64_MODULE_PLTS
Message-ID: <20171116115012.GE9361@arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-11-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171115213428.22559-11-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Wed, Nov 15, 2017 at 01:34:20PM -0800, Sami Tolvanen wrote:
> CONFIG_CLANG_LTO depends on GNU gold and due to a known bug, the
> linker crashes when ARM64_MODULE_PLTS is enabled:
> 
>   https://sourceware.org/bugzilla/show_bug.cgi?id=14592
> 
> To work around the problem, this change removes NOLOAD from .plt
> and .init.plt, which allows us to link modules with ld.gold.

Why don't we just not do LTO if the toolchain is busted? This feels like
it will end up being a game of whack-a-mole as code could be introduced
that tickles known bugs on older toolchains.

Will
