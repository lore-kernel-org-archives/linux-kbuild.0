Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:33075 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933350AbeFLBaE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jun 2018 21:30:04 -0400
MIME-Version: 1.0
References: <20180612003224.3658-1-labbott@redhat.com>
In-Reply-To: <20180612003224.3658-1-labbott@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 11 Jun 2018 18:29:53 -0700
Message-ID: <CA+55aFwG-UwwHHuOWFnC3tphyEcyfx1zQMx8JuxmUGWo4YwD-Q@mail.gmail.com>
Subject: Re: [PATCHv4 0/3] Salted build ids via linker sections
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Andrew Lutomirski <luto@kernel.org>, mjw@fedoraproject.org, "H.J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, the arch/x86 maintainers <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, nickc@redhat.com, Cary Coutant <ccoutant@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Jun 11, 2018 at 5:32 PM Laura Abbott <labbott@redhat.com> wrote:
>
> v4 takes Linus' suggestion of using linker fill to insert the build id.

Heh. I was hoping somebody would come up with a way to avoid my crazy
"put a LONG into an aligned section to cause alignment filling" thing.

Because somebody will ask "what the heck is the meaning of that
LONG(0xffaa5500) thing"?

But since I couldn't come up with anything better myself, I guess I
can't complain.

> This is pretty small but I also know people can be picky so I'm open to opinions or suggestions here.

I'm not sure anybody will care about 32 bytes. Although maybe it could
be made to be just 8 bytes (four bytes to force padding, four bytes of
padding) and put somewhere where you'll have more padding anyway due
to being followed by a PAGE_ALIGNED section or something?

I don't think we care.

Anyway, I'll pull this if somebody sends it to me, it seems to be
fairly minimally invasive and apparently fixes an issue for distros.

                Linus
