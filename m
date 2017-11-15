Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:51719 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932790AbdKOWGS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 17:06:18 -0500
Received: by mail-pg0-f66.google.com with SMTP id p9so18987209pgc.8
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 14:06:18 -0800 (PST)
Date: Wed, 15 Nov 2017 14:06:14 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 03/18] kbuild: move gcc-version.sh to cc-version.sh
 and add clang support
Message-ID: <20171115220614.GA27176@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-4-samitolvanen@google.com>
 <CAGXu5jL0B18ijuFxySBzcOtju3DL-UZfb39mWLxww5SJ5P3Feg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXu5jL0B18ijuFxySBzcOtju3DL-UZfb39mWLxww5SJ5P3Feg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, linux-arm-kernel@lists.infradead.org, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Wed, Nov 15, 2017 at 01:48:52PM -0800, Kees Cook wrote:
> It might make sense to split this patch: do the move and refactoring,
> then add clang support.

Sure.

> Though, won't this confuse some tests? A lot of cc-version tests are
> expecting only gcc, yes?

There's already a chance of this happening with cc-version. Currently,
gcc-version.sh returns 0402 for clang 5.0, which probably doesn't have
the same issues as gcc 4.2 did.

While I didn't see anything new that would break on platforms that
clang can currently compile, you're correct, we should probably have a
macro that also checks for the compiler, or have separate macros for
different compilers.

I'll address these in v3.

Sami
