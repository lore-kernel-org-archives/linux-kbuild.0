Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:37807 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750783AbdK2RTN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 12:19:13 -0500
Received: by mail-lf0-f46.google.com with SMTP id a12so4762025lfe.4
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 09:19:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171129000011.55235-3-samitolvanen@google.com>
References: <20171129000011.55235-1-samitolvanen@google.com> <20171129000011.55235-3-samitolvanen@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 29 Nov 2017 09:19:11 -0800
Message-ID: <CAKwvOdkNBozCM0k+ENkMOPXC45BJYZzBWZwTAoJ8GAL8di-e=A@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: add cc-if-name-version and compiler-specific variants
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

We could use something like this to warn people trying to build the
kernel with clang-3.8 for instance.
