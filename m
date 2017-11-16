Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:50036 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936061AbdKPQol (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 11:44:41 -0500
Received: by mail-lf0-f68.google.com with SMTP id w21so30887974lfc.6
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 08:44:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171116164306.GF94341@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-12-samitolvanen@google.com> <20171116115433.GG9361@arm.com>
 <20171116164306.GF94341@samitolvanen.mtv.corp.google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 16 Nov 2017 08:44:38 -0800
Message-ID: <CAKwvOdkKA7PhRx-D0ofZgydbcga87FB1C4Q0A4fosK-BN-Raiw@mail.gmail.com>
Subject: Re: [PATCH v2 11/18] arm64: make mrs_s and msr_s macros work with LTO
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Will Deacon <will.deacon@arm.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

I need this patch to assemble the kernel for arm64 with clang regardless of LTO.
