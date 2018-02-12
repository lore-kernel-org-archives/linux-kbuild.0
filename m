Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:33548 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752274AbeBLQ4f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Feb 2018 11:56:35 -0500
Received: by mail-ua0-f193.google.com with SMTP id p12so9852088uad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Feb 2018 08:56:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1518452362.6606.102.camel@infradead.org>
References: <20180210080556.mycqsjhxbaguwhay@huvuddator> <20180210085519.737ckf4bcl57h4g2@huvuddator>
 <CAGXu5jKQgxxC2RQL0dxLKFVED2v-LiWKjtXY3DDpfwAXbnxM4Q@mail.gmail.com>
 <CA+55aFz-SJ970iqDsR8-Ke4z6WvB4n9RXAeen8pG=+YJWubETw@mail.gmail.com>
 <CAGXu5jLo0iuMsH89vj3nr8sv+1YvXfXgoPeBdxHwZm5i=DWoOA@mail.gmail.com>
 <CA+55aFxdx3FYE6YGifRR=BSG9QzXwgThj5z7RmV5P5+RpNXSiQ@mail.gmail.com>
 <CA+55aFyPyYyG-riaBQU5cGp_sC=r8mf9Mg6L=DUEH6EyQfWYwA@mail.gmail.com>
 <20180211103432.pf2ot6nd7nbhdhsy@huvuddator> <CAGXu5jLtFcvbazxUvL_=6uT+a8m0JQEB7v0OE41Z-PMoX_fWpA@mail.gmail.com>
 <CA+55aFz3gUKQMr-X-b=ytLPX0AjGUaXNtLSUQ0_xZwZuDU33RQ@mail.gmail.com>
 <20180212082635.GA25314@hirez.programming.kicks-ass.net> <1518452362.6606.102.camel@infradead.org>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 12 Feb 2018 08:56:31 -0800
Message-ID: <CAGXu5jLdH7wkrnB9YnRLf+vQsQyfHehUywkXqsBuy6WmVLH3OA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] kconfig: support new special property shell=
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Pavel Machek <pavel@ucw.cz>, linux-s390 <linux-s390@vger.kernel.org>, Jiri Kosina <jkosina@suse.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tejun Heo <tj@kernel.org>, Ingo Molnar <mingo@kernel.org>, "Van De Ven, Arjan" <arjan.van.de.ven@intel.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>

On Mon, Feb 12, 2018 at 8:19 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Mon, 2018-02-12 at 09:26 +0100, Peter Zijlstra wrote:
>> On Sun, Feb 11, 2018 at 10:13:44AM -0800, Linus Torvalds wrote:
>>
>> > That actually sounds like we could just
>> >
>> >  (a) make gcc 4.5 be the minimum required version
>> >
>> >  (b) actually error out if we find a bad compiler
>>
>> So the unofficial plan was to enforce asm-goto and -fentry support by
>> hard failure to build, which would get us at gcc-4.6 and then remove all
>> the fallback cruft needed for those features -- for x86. If we want to
>> do this tree wide, that's obviously OK with me too ;-)
>
> This would also kill clang support, right?

That would be bad: Android exclusively builds with clang.

-Kees

-- 
Kees Cook
Pixel Security
