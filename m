Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35766 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751109AbdKTVEF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 16:04:05 -0500
Received: by mail-io0-f194.google.com with SMTP id i38so17179459iod.2
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Nov 2017 13:04:05 -0800 (PST)
Date: Mon, 20 Nov 2017 13:04:00 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 00/18] Add support for clang LTO
Message-ID: <20171120210400.GE89108@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171120152139.mfqthlbneeeiythr@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171120152139.mfqthlbneeeiythr@lakrids.cambridge.arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Mon, Nov 20, 2017 at 03:21:40PM +0000, Mark Rutland wrote:
> Would it be possible to split this into:
> 
> (1) (basic) arm64 clang support
> (2) gold support (no LTO)
> (3) LTO support
> 
> ... with any necessary workarounds added as-required to the relevant
> series?

Absolutely. I'll split the patches into more sensible sets.

Sami
