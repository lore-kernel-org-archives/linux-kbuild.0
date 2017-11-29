Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33359 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752357AbdK2QW2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 11:22:28 -0500
Received: by mail-io0-f195.google.com with SMTP id t196so4294321iof.0
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 08:22:28 -0800 (PST)
Date: Wed, 29 Nov 2017 08:22:23 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH 3/3] arm64: use -mno-implicit-float instead of
 -mgeneral-regs-only
Message-ID: <20171129162223.GA2959@samitolvanen.mtv.corp.google.com>
References: <20171129000011.55235-1-samitolvanen@google.com>
 <20171129000011.55235-4-samitolvanen@google.com>
 <CAKv+Gu99XM5jLcOTkqPJPj5oZnUCNv2c7C=5X2hFCM4-4_gwNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu99XM5jLcOTkqPJPj5oZnUCNv2c7C=5X2hFCM4-4_gwNg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Wed, Nov 29, 2017 at 12:15:14PM +0000, Ard Biesheuvel wrote:
> Do we still need these patches now that the AES code has been fixed?

With your AES patch that Herbert just applied, this patch is no longer
needed. Version macros in the first two patches will still be useful in
future though.

Sami
