Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:50010 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933118AbdKPLrO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 06:47:14 -0500
Date: Thu, 16 Nov 2017 11:47:23 +0000
From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v2 09/18] arm64: explicitly pass
 --no-fix-cortex-a53-843419 to GNU gold
Message-ID: <20171116114722.GD9361@arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-10-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171115213428.22559-10-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Wed, Nov 15, 2017 at 01:34:19PM -0800, Sami Tolvanen wrote:
> Some versions of GNU gold are known to produce broken code with
> --fix-cortex-a53-843419 as explained in this bug:
> 
>   https://sourceware.org/bugzilla/show_bug.cgi?id=21491
> 
> If ARM64_ERRATUM_843419 is disabled and we're using GNU gold, pass
> --no-fix-cortex-a53-843419 to the linker to ensure the erratum fix is not
> used even if the linker is configured to enable it by default.

But if ARM64_ERRATUM_843419 is enabled, we'll go ahead and generate broken
code?

Will
