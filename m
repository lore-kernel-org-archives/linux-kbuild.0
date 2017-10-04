Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f174.google.com ([209.85.128.174]:51709 "EHLO
        mail-wr0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751197AbdJDQJx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 12:09:53 -0400
Received: by mail-wr0-f174.google.com with SMTP id j14so9052664wre.8
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Oct 2017 09:09:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABXOdTdJADZ5=sFYsoUdDa519e3SXhTGP-_ZsMhzaT8J_VOD+A@mail.gmail.com>
References: <20171003204839.27551-1-dianders@chromium.org> <20171003204839.27551-2-dianders@chromium.org>
 <CAK7LNARAVPOQh5SpLGRN5z-me-FhQerP5HVfxstaEaJuinsA7A@mail.gmail.com> <CABXOdTdJADZ5=sFYsoUdDa519e3SXhTGP-_ZsMhzaT8J_VOD+A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Oct 2017 09:09:51 -0700
Message-ID: <CAD=FV=Xr3Ah8BoNkzoHbYD8ovhrRJbf6+2e3ucOa93Q6w+rvbA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] kbuild: Pass HOSTCC and similar to tools Makefiles
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Guenter Roeck <groeck@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Michal Marek <mmarek@suse.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi,

On Tue, Oct 3, 2017 at 9:07 PM, Guenter Roeck <groeck@google.com> wrote:
> On Tue, Oct 3, 2017 at 8:20 PM, Masahiro Yamada
>> CC:     for building tools that run on the target machine
>> HOSTCC: for building tools that run on the build machine
>>
>>
>> IMHO, this should be consistent to avoid confusion.
>>
>>
>> Grepping CROSS_COMPILE under tools/ directory,
>> I see many Makefile expect CC for the target system.
>>
>> For ex, tools/croup/Makefile
>>
>> CC = $(CROSS_COMPILE)gcc
>>
>>
>>
>> Why don't you fix tools/objtool/Makefile ?
>>
>>
>
> Interesting question. You are right, most tools are target tools, not
> host tools. Maybe it _would_ make sense to use HOSTCC/HOSTCFLAGS to
> build it. Copying Josh for input.

Ah, good point.  I'm not terribly familiar with the things under
tools, so when I saw "objtool" I assumed it was following a standard
pattern for tools.

I can submit a patch for objtool's Makefile.  ...or, if it makes more
sense, I can submit a patch to move "objtool" to the scripts
directory.  ...or I can butt out of it.  :)  Which would folks prefer?

-Doug
