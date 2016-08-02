Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:38000 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754032AbcHBWMW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Aug 2016 18:12:22 -0400
Received: by mail-wm0-f43.google.com with SMTP id o80so309918920wme.1
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Aug 2016 15:11:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+55aFxqBaGCRRuEA4LA2n0bVU4eZSdEHx8VOzQeCXE6vgQUUw@mail.gmail.com>
References: <20160802190048.GA10652@sepie.suse.cz> <CA+55aFxG=K1b4kQQ20xKa7jDH6TR0x=hvf+YBU3hcjG=zXDHOw@mail.gmail.com>
 <CAGXu5jK3Hy5eXL20uNCuJ8WNmChWoXictM74_n3Px=N1uki-cw@mail.gmail.com> <CA+55aFxqBaGCRRuEA4LA2n0bVU4eZSdEHx8VOzQeCXE6vgQUUw@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 2 Aug 2016 15:11:18 -0700
Message-ID: <CAGXu5jKoueDbBhkxA8_53PhP7y5fmKXVXki98vsteJ6xD2iWBQ@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild changes for v4.8-rc1
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.com>, Arnd Bergmann <arnd@arndb.de>, Emese Revfy <re.emese@gmail.com>, tautschn@amazon.co.uk, Wolfram Sang <wsa@the-dreams.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Aug 2, 2016 at 2:00 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Aug 2, 2016 at 4:55 PM, Kees Cook <keescook@chromium.org> wrote:
>>
>> The version with $SRCARCH is the correct version. (I think akpm may
>> have picked up the v1, but Michal requested some changes that resulted
>> in the v2 with the $SRCARCH correction.)
>
> That's what I assumed, and that's the version I picked. There were
> some other confusing changes in that area though, so I'd like the
> involved people to give my resolution a second look, just to make sure
> it's fine.

Awesome, yeah, it looks good and tests out correctly for me.

Thanks!

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
