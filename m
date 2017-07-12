Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:21788 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753285AbdGLQ3l (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Jul 2017 12:29:41 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [RFC PATCH] x86: enable dead code and data elimination (LTO)
References: <20170709031333.29443-1-npiggin@gmail.com>
        <20170709090551.bm2c55ctt3togim7@gmail.com>
        <CAK7LNAR-VF2o3-qcCXnkath_B74KQodh_vezPRErGPhZSao2VA@mail.gmail.com>
        <alpine.LFD.2.20.1707090946090.1959@knanqh.ubzr>
        <20170710121329.77dd3364@roar.ozlabs.ibm.com>
Date: Wed, 12 Jul 2017 09:29:40 -0700
In-Reply-To: <20170710121329.77dd3364@roar.ozlabs.ibm.com> (Nicholas Piggin's
        message of "Mon, 10 Jul 2017 12:13:29 +1000")
Message-ID: <87a849aaa3.fsf@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: npiggin@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Nicholas Piggin <npiggin@gmail.com> writes:
>> 
>> I think we should aim for gc-sections to be used by default and have LTO 
>> as a possible option only.
>
> I agree after it starts getting implemented and debugged by small
> system users, we could make it default in the interest of sharing
> testing and reducing combinations.

From what i understand the main drawback in the past was
is that various linker versions become very slow with thousands of
sections.

So it may cost you built time. For a special small build it's probably
ok, but you wouldn't want to make it default.

Also usually it's only useful without modules because if you
use modules EXPORT_SYMBOL pulls in a lot of unused functions.

BTW I'm still maintaining a "real LTO" patchkit here, which
has some users (mainly for binary size), but also gives some
performance. Should probably resubmit it again. The main
issue was that the old single link patch is still not forward
ported.

https://git.kernel.org/pub/scm/linux/kernel/git/ak/linux-misc.git/log/?h=lto-411-2

-Andi
