Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:47086 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753639AbdK3Res (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 12:34:48 -0500
Received: by mail-it0-f66.google.com with SMTP id t1so9231827ite.5
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 09:34:48 -0800 (PST)
Date: Thu, 30 Nov 2017 09:34:43 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH 2/3] kbuild: add cc-if-name-version and compiler-specific
 variants
Message-ID: <20171130173443.GA90451@samitolvanen.mtv.corp.google.com>
References: <20171129000011.55235-1-samitolvanen@google.com>
 <20171129000011.55235-3-samitolvanen@google.com>
 <CAK7LNAQg4+eyR-mggswxvkBSxrdwFTQ3A733cSs4965UzO0qgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQg4+eyR-mggswxvkBSxrdwFTQ3A733cSs4965UzO0qgQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 30, 2017 at 09:21:49PM +0900, Masahiro Yamada wrote:
> BTW, did this patch work in your test?

Yes, but it looks like /bin/sh is symlinked to bash on my system. I can
reproduce the issue with dash.

> As for the macro names, maybe
> 
> __cc-ifversion, __cc-if-fullversion for consistency?

> I think you can do like follows to avoid code duplication.
> 
> # backward compatibility
> cc-ifversion = $(gcc-ifversion)
> cc-if-fullversion = $(gcc-if-fullversion)

Sure, both changes sound good to me. I'll fix these in v2.

Sami
