Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERQtv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 May 2020 12:49:51 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2544C061A0C
        for <linux-kbuild@vger.kernel.org>; Mon, 18 May 2020 09:49:50 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u15so10629039ljd.3
        for <linux-kbuild@vger.kernel.org>; Mon, 18 May 2020 09:49:50 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id f2sm5947989ljg.98.2020.05.18.09.49.47
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 09:49:47 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 82so8691886lfh.2
        for <linux-kbuild@vger.kernel.org>; Mon, 18 May 2020 09:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200518145723.65b89375@canb.auug.org.au> <968394.1589817650@warthog.procyon.org.uk>
In-Reply-To: <968394.1589817650@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 18 May 2020 09:49:29 -0700
Message-ID: <CAHk-=wj6J-iqrCr_7oLDCbS8qXQ69EF=nPLWmvBiDmgdNWZ6KA@mail.gmail.com>
Subject: Re: How should we handle a bool depending on a tristate?
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>

On Mon, May 18, 2020 at 9:01 AM David Howells <dhowells@redhat.com> wrote:
>
>
> Blech.  Yeah.  "depends on" doesn't work either.  The problem actually lies
> within the Kconfig framework.  It doesn't know how to handle a bool depending
> on a tristate.

No problem with Kconfig. It knows exactly how to let a bool depend on
a tristate.

It's just that there are two different kinds of dependencies.

For example, the dependency can be a hard and absolute dependency
(linking doesn't work, or whatever), and then obviously built-in code
cannot be enabled if the thing it depends on is a loadable module.

But the dependency can also be a conceptual one: "This option doesn't
make sense unless that option is set". Then a bool can make sense even
if the other config is a modular one.

And Kconfig can deal with either situation just fine.

Do

    depends on XYZ = y

or

    depends on XYZ != n

to clarify the choice. One requires a hard dependency, the other
requires that the  option just be enabled.

Now, if you just do "depends on XYZ", it allows a bool to be enabled
even for just a module (ie that second case). That makes sense for a
lot of "allow this feature in the module" kind of options, where it
would be pointless to even ask about a boolean feature if the parent
module isn't even enabled.

But that "depends on XYZ=y" is not uncommon. It basically says "this
option makes sense only when built in". Either because it requires it
for linking, or just because it doesn't work or make sense without it.

                     Linus
