Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:35451 "EHLO
	mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752631AbcHBUl6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Aug 2016 16:41:58 -0400
MIME-Version: 1.0
In-Reply-To: <20160802190048.GA10652@sepie.suse.cz>
References: <20160802190048.GA10652@sepie.suse.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Aug 2016 16:41:42 -0400
Message-ID: <CA+55aFxG=K1b4kQQ20xKa7jDH6TR0x=hvf+YBU3hcjG=zXDHOw@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild changes for v4.8-rc1
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Emese Revfy <re.emese@gmail.com>, tautschn@amazon.co.uk, Wolfram Sang <wsa@the-dreams.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Aug 2, 2016 at 3:00 PM, Michal Marek <mmarek@suse.com> wrote:
>
> please merge these kbuild changes for v4.8-rc1:

Merged. However, there were two slightly different versions of this
commit in my tree:

> Kees Cook (2):
>       kbuild: Abort build on bad stack protector flag

differing by $ARCH vs $SRCARCH. There were a few other changes in that
area too, so I'd really like you to verify the end result.

(I haven't pushed out yet, it's still doing the test builds, so if you
don't see it yet, wait a bit and the merge should be out soon. Unless
the test build shows problems, in which case it might be longer ;^)

          Linus
