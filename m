Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54080 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755043AbbHYJ4x (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Aug 2015 05:56:53 -0400
Subject: Re: [PATCH TRIVIAL v2] Avoid conflict with host definitions when
 cross-compiling
References: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
 <55D5BAA4.5050003@suse.com>
 <CAK7LNARtmsBOticVU1dgx1iAXq8m5Q-pi-GkGe6E08HcqeHZZw@mail.gmail.com>
 <00dc01d0df0a$3bda3e90$b38ebbb0$@samsung.com>
 <CAK7LNAQ31nrSZ9vjVGa3p_rr85E0V6xZSaA3xKt3JxYAMMtnLg@mail.gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <55DC3BE3.6010207@suse.com>
Date: Tue, 25 Aug 2015 11:56:51 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ31nrSZ9vjVGa3p_rr85E0V6xZSaA3xKt3JxYAMMtnLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Pavel Fedin <p.fedin@samsung.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 2015-08-25 10:18, Masahiro Yamada wrote:
> 2015-08-25 16:47 GMT+09:00 Pavel Fedin <p.fedin@samsung.com>:
>>  Hello!
>>
>>> I am not happy with getting weird code to work around issues on
>>> non-Linux systems.
>>
>>  What is your criteria of being weird? Why are four #undef's weird ?
> 
> 
> I am not criticizing your particular patch.
> 
> Once we decide to support building on other OSes,
> I fear more and more patches would come in
> to fix building issues.

While nowadays Linux is often the first OS ported to a new architecture
and is cross compiled on another Linux system, I think portable code is
a virtue on its own, _unless_ it requires having compatibility wrappers
for half of the library calls and whatnot. It's hard to draw a line, but
it'd say patches to enable build on Cygwin are OK (since it emulates a
POSIX system quite well), whereas patches to enable build on native
Windows, dealing with pathname lookup differences, .exe suffixes, adding
a libc wrapper, etc, would be frowned upon.

Would you agree to such loosely defined criteria?

Michal
