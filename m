Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:29864 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751291AbbHYJ71 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Aug 2015 05:59:27 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTM00I4JUF1NA70@mailout3.w1.samsung.com> for
 linux-kbuild@vger.kernel.org; Tue, 25 Aug 2015 10:59:25 +0100 (BST)
From: Pavel Fedin <p.fedin@samsung.com>
References: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
 <55D5BAA4.5050003@suse.com>
 <CAK7LNARtmsBOticVU1dgx1iAXq8m5Q-pi-GkGe6E08HcqeHZZw@mail.gmail.com>
 <00dc01d0df0a$3bda3e90$b38ebbb0$@samsung.com>
 <CAK7LNAQ31nrSZ9vjVGa3p_rr85E0V6xZSaA3xKt3JxYAMMtnLg@mail.gmail.com>
 <55DC3BE3.6010207@suse.com>
In-reply-to: <55DC3BE3.6010207@suse.com>
Subject: RE: [PATCH TRIVIAL v2] Avoid conflict with host definitions when
 cross-compiling
Date: Tue, 25 Aug 2015 12:59:24 +0300
Message-id: <011201d0df1c$b948aad0$2bda0070$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 7bit
Content-language: ru
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Michal Marek' <mmarek@suse.com>, 'Masahiro Yamada' <yamada.masahiro@socionext.com>
Cc: 'Linux Kbuild mailing list' <linux-kbuild@vger.kernel.org>

 Hello!

> While nowadays Linux is often the first OS ported to a new architecture
> and is cross compiled on another Linux system, I think portable code is
> a virtue on its own, _unless_ it requires having compatibility wrappers
> for half of the library calls and whatnot. It's hard to draw a line, but
> it'd say patches to enable build on Cygwin are OK (since it emulates a
> POSIX system quite well), whereas patches to enable build on native
> Windows, dealing with pathname lookup differences, .exe suffixes, adding
> a libc wrapper, etc, would be frowned upon.
> 
> Would you agree to such loosely defined criteria?

 I absolutely agree.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia

