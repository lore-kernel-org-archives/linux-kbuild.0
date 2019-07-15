Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:49769 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729513AbfGOS4q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 14:56:46 -0400
Subject: Re: [PATCH 4/4] debian: add generic rule file
References: <1562664759-16009-1-git-send-email-info@metux.net>
 <1562664759-16009-4-git-send-email-info@metux.net>
 <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <5af9db32-2cf5-10ba-261c-e08852d0814f@metux.net>
Date: Mon, 15 Jul 2019 20:56:25 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Robo Bot <apw@canonical.com>, Joe Perches <joe@perches.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-riscv@lists.infradead.org, clang-built-linux <clang-built-linux@googlegroups.com>

On 15.07.19 14:28, Masahiro Yamada wrote:

>> The rule file contains a rule for creating debian/control and
>> other metadata - this is done similar to the 'deb-pkg' make rule,
>> scripts/packaging/mkdebian.
> 
> I saw a similar patch submission before, and negative feedback about it.

Do you recall what negative feedback exactly ?

> Debian maintains its own debian/rules, and it is fine.

Not for me, I don't use it - given up trying to make anything useful
out of it. It's extremly complex, practically undebuggable and doesn't
even work w/o lots of external preparations.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
