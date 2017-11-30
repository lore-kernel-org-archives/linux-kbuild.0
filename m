Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:37605 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750885AbdK3RjD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 12:39:03 -0500
Received: by mail-it0-f65.google.com with SMTP id d137so9367531itc.2
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 09:39:03 -0800 (PST)
Date: Thu, 30 Nov 2017 09:38:59 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH 1/7] kbuild: add ld-name macro and support for GNU gold
Message-ID: <20171130173859.GB90451@samitolvanen.mtv.corp.google.com>
References: <20171129234442.655-1-samitolvanen@google.com>
 <20171129234442.655-2-samitolvanen@google.com>
 <CAKwvOdme29UPfaV1CCbMXRM=LzZJ-asytEjGm_F7ARN0WrMsEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdme29UPfaV1CCbMXRM=LzZJ-asytEjGm_F7ARN0WrMsEg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>

On Wed, Nov 29, 2017 at 04:32:52PM -0800, Nick Desaulniers wrote:
> Right, but you're still only ever using one linker per build, correct?

Correct. LDFLAGS_GOLD makes it move convenient to add gold specific flags
without explicit $(ld-name) checks everywhere, but I'm fine with removing
it in v2.

Sami
