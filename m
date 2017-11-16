Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:50230 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751310AbdKPLyZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 06:54:25 -0500
Date: Thu, 16 Nov 2017 11:54:33 +0000
From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v2 11/18] arm64: make mrs_s and msr_s macros work with LTO
Message-ID: <20171116115433.GG9361@arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-12-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171115213428.22559-12-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Wed, Nov 15, 2017 at 01:34:21PM -0800, Sami Tolvanen wrote:
> From: Alex Matveev <alxmtvv@gmail.com>
> 
> Use UNDEFINE_MRS_S and UNDEFINE_MSR_S to define corresponding macros
> in-place and workaround gcc and clang limitations on redefining macros
> across different assembler blocks.

What limitations? Can you elaborate please? Is this a fix?

Will
