Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34701 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751599AbdKPViS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 16:38:18 -0500
Received: by mail-pg0-f66.google.com with SMTP id 4so331658pge.1
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 13:38:17 -0800 (PST)
Date: Thu, 16 Nov 2017 13:38:14 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 00/18] Add support for clang LTO
Message-ID: <20171116213814.GB10616@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171116205300.5p3vjjqouw3prr3t@yury-thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116205300.5p3vjjqouw3prr3t@yury-thinkpad>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yury Norov <ynorov@caviumnetworks.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 16, 2017 at 11:53:00PM +0300, Yury Norov wrote:
> I would suggest you to add the patch that checks their versions and
> disables LTO if needed.

Sure, sounds reasonable. I'll add this in the next version.

Sami
