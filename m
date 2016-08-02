Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:36491 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754093AbcHBVvO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Aug 2016 17:51:14 -0400
Received: by mail-wm0-f52.google.com with SMTP id q128so425403491wma.1
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Aug 2016 14:50:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+55aFxG=K1b4kQQ20xKa7jDH6TR0x=hvf+YBU3hcjG=zXDHOw@mail.gmail.com>
References: <20160802190048.GA10652@sepie.suse.cz> <CA+55aFxG=K1b4kQQ20xKa7jDH6TR0x=hvf+YBU3hcjG=zXDHOw@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 2 Aug 2016 13:55:22 -0700
Message-ID: <CAGXu5jK3Hy5eXL20uNCuJ8WNmChWoXictM74_n3Px=N1uki-cw@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild changes for v4.8-rc1
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.com>, Arnd Bergmann <arnd@arndb.de>, Emese Revfy <re.emese@gmail.com>, tautschn@amazon.co.uk, Wolfram Sang <wsa@the-dreams.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Aug 2, 2016 at 1:41 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Aug 2, 2016 at 3:00 PM, Michal Marek <mmarek@suse.com> wrote:
>>
>> please merge these kbuild changes for v4.8-rc1:
>
> Merged. However, there were two slightly different versions of this
> commit in my tree:
>
>> Kees Cook (2):
>>       kbuild: Abort build on bad stack protector flag
>
> differing by $ARCH vs $SRCARCH. There were a few other changes in that
> area too, so I'd really like you to verify the end result.

The version with $SRCARCH is the correct version. (I think akpm may
have picked up the v1, but Michal requested some changes that resulted
in the v2 with the $SRCARCH correction.)

-- 
Kees Cook
Chrome OS & Brillo Security
