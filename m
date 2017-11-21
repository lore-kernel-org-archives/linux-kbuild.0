Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:38732 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751570AbdKULPM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Nov 2017 06:15:12 -0500
Date: Tue, 21 Nov 2017 11:15:06 +0000
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 09/18] arm64: explicitly pass
 --no-fix-cortex-a53-843419 to GNU gold
Message-ID: <20171121111506.qmlhtupzyrvfpgjl@lakrids.cambridge.arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-10-samitolvanen@google.com>
 <20171116114722.GD9361@arm.com>
 <20171116163549.GD94341@samitolvanen.mtv.corp.google.com>
 <20171120144720.bf27bpuwq4huhkdp@lakrids.cambridge.arm.com>
 <20171120203549.GB89108@samitolvanen.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171120203549.GB89108@samitolvanen.mtv.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Will Deacon <will.deacon@arm.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Mon, Nov 20, 2017 at 12:35:49PM -0800, Sami Tolvanen wrote:
> On Mon, Nov 20, 2017 at 02:47:20PM +0000, Mark Rutland wrote:
> > However, we could instead check ld-version, produce a warning, and
> > abort the build in such cases.
> 
> I believe the version number of gold didn't change in binutils 2.28.1,
> where this was fixed, but we could certainly warn about older versions
> of gold.

If that's the case, can we mandate gold version > 2.28.1?

The latest version seems to be 2.29.1, so there's at least one
(hopefully) working release.

That might rule out a few working gold binaries, but it would save on
unwelcome surprises.

Thanks,
Mark.
