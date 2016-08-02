Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53816 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756865AbcHBU7R (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Aug 2016 16:59:17 -0400
Subject: Re: [GIT PULL] kbuild changes for v4.8-rc1
References: <20160802190048.GA10652@sepie.suse.cz>
 <CA+55aFxG=K1b4kQQ20xKa7jDH6TR0x=hvf+YBU3hcjG=zXDHOw@mail.gmail.com>
 <CAGXu5jK3Hy5eXL20uNCuJ8WNmChWoXictM74_n3Px=N1uki-cw@mail.gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <57A10999.9020009@suse.com>
Date: Tue, 2 Aug 2016 22:59:05 +0200
MIME-Version: 1.0
In-Reply-To: <CAGXu5jK3Hy5eXL20uNCuJ8WNmChWoXictM74_n3Px=N1uki-cw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Emese Revfy <re.emese@gmail.com>, tautschn@amazon.co.uk, Wolfram Sang <wsa@the-dreams.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Dne 2.8.2016 v 22:55 Kees Cook napsal(a):
> On Tue, Aug 2, 2016 at 1:41 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>> On Tue, Aug 2, 2016 at 3:00 PM, Michal Marek <mmarek@suse.com> wrote:
>>>
>>> please merge these kbuild changes for v4.8-rc1:
>>
>> Merged. However, there were two slightly different versions of this
>> commit in my tree:
>>
>>> Kees Cook (2):
>>>       kbuild: Abort build on bad stack protector flag
>>
>> differing by $ARCH vs $SRCARCH. There were a few other changes in that
>> area too, so I'd really like you to verify the end result.
> 
> The version with $SRCARCH is the correct version. (I think akpm may
> have picked up the v1, but Michal requested some changes that resulted
> in the v2 with the $SRCARCH correction.)

Right, it should be $SRCARCH. But if you accidentally pushed the wrong
version, sky is not going to fall. It's just that make
ARCH=(i386|x86_64|um) will not do the compiler check, until a fix patch
is merged.

Michal
