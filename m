Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:44972 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936186AbdKPQzd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 11:55:33 -0500
Received: by mail-lf0-f44.google.com with SMTP id i14so3062082lfc.1
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 08:55:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171116105541.fqf3zgrqnbug7deq@yury-thinkpad>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-6-samitolvanen@google.com> <20171116105541.fqf3zgrqnbug7deq@yury-thinkpad>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 16 Nov 2017 08:55:30 -0800
Message-ID: <CAKwvOd=-n1ryFh+scD3WzQ1wJ9tKQAuy2Pi6fowd74iFeC6wPA@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] arm64: fix -m for GNU gold
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yury Norov <ynorov@caviumnetworks.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Matthias Kaehlcke <mka@chromium.org>

This and the ld-name patch can probably be taken separately from the
rest in the LTO series simply for enabling linking w/ gold.
