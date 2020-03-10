Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:35325 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726252AbgCJMA1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 08:00:27 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/Makefile: Mark phony targets as PHONY
In-Reply-To: <CAK7LNAQfREwzk4NwE5PzxOXGLcsk2BtjYNKvKx8g4_vxHmNHdw@mail.gmail.com>
References: <20200219000434.15872-1-mpe@ellerman.id.au> <48YT3Y2QBsz9sSs@ozlabs.org> <CAK7LNAQfREwzk4NwE5PzxOXGLcsk2BtjYNKvKx8g4_vxHmNHdw@mail.gmail.com>
Date: Tue, 10 Mar 2020 23:00:21 +1100
Message-ID: <87r1y0ifmy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Michael Ellerman <patch-notifications@ellerman.id.au>
Cc: linuxppc-dev@ozlabs.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Fri, Mar 6, 2020 at 9:27 AM Michael Ellerman
> <patch-notifications@ellerman.id.au> wrote:
>>
>> On Wed, 2020-02-19 at 00:04:34 UTC, Michael Ellerman wrote:
>> > Some of our phony targets are not marked as such. This can lead to
>> > confusing errors, eg:
>> >
>> >   $ make clean
>> >   $ touch install
>> >   $ make install
>> >   make: 'install' is up to date.
>> >   $
>> >
>> > Fix it by adding them to the PHONY variable which is marked phony in
>> > the top-level Makefile, or in scripts/Makefile.build for the boot
>> > Makefile.
>> >
>> > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
>> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>
>> Applied to powerpc next.
>>
>> https://git.kernel.org/powerpc/c/d42c6d0f8d004c3661dde3c376ed637e9f292c22
>>
>
> You do not have to double your Signed-off-by.

Oops :/

My scripts don't cope with applying my own patches very well. Will try
to fix it.

cheers
