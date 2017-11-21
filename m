Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:39166 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751804AbdKULyB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Nov 2017 06:54:01 -0500
Date: Tue, 21 Nov 2017 11:53:55 +0000
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 00/18] Add support for clang LTO
Message-ID: <20171121115354.uo45enssffajv4so@lakrids.cambridge.arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171120152139.mfqthlbneeeiythr@lakrids.cambridge.arm.com>
 <20171120210400.GE89108@samitolvanen.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171120210400.GE89108@samitolvanen.mtv.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Mon, Nov 20, 2017 at 01:04:00PM -0800, Sami Tolvanen wrote:
> On Mon, Nov 20, 2017 at 03:21:40PM +0000, Mark Rutland wrote:
> > Would it be possible to split this into:
> > 
> > (1) (basic) arm64 clang support
> > (2) gold support (no LTO)
> > (3) LTO support
> > 
> > ... with any necessary workarounds added as-required to the relevant
> > series?
> 
> Absolutely. I'll split the patches into more sensible sets.

Thanks, that's much appreciated!

Mark.
