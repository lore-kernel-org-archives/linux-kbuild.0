Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:40050 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934754AbdK2Rja (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 12:39:30 -0500
Received: by mail-lf0-f54.google.com with SMTP id t197so4813998lfe.7
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 09:39:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171129000011.55235-2-samitolvanen@google.com>
References: <20171129000011.55235-1-samitolvanen@google.com> <20171129000011.55235-2-samitolvanen@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 29 Nov 2017 09:39:28 -0800
Message-ID: <CAKwvOdndEfdXuRCeSsr04pAt0d0tE_z72DUYc2Z9LCnXAQc4Hw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: add clang-version.sh
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

+# clang-version [-p] clang-command
+#
+# Prints the compiler version of `command' in a canonical 4-digit form

small nit: `command` should be `clang-command`, but its just a comment
(maybe the maintainer can make that change when/if applying).

The conditional at the end to see if $with_patchlevel using "x" is
odd, but this is what scripts/gcc-version.sh does and this patch does
work as expected.

Tested-by: Nick Desaulniers <ndesaulniers@google.com>
