Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f180.google.com ([209.85.128.180]:34098 "EHLO
        mail-wr0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750862AbeCNHXV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Mar 2018 03:23:21 -0400
Date: Wed, 14 Mar 2018 08:23:16 +0100
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v3 2/2] kbuild: Don't mess with the .cache.mk when root
Message-ID: <20180314072316.zc7qe2reox3htw3z@gmail.com>
References: <20180313061109.72629-1-dianders@chromium.org>
 <20180313061109.72629-3-dianders@chromium.org>
 <20180313061603.jsgiumet23uqi6hl@gmail.com>
 <CAD=FV=UEuWww=H=TY=E8JvEmrobDNi5+rbTXvTAmZ2brpK+sdg@mail.gmail.com>
 <CAKwvOdnPSMSOenPiPqBpDf=hf5q5uQ5MF0pOLAea5T5_VPhmaA@mail.gmail.com>
 <CAD=FV=UvT-BrpZcz4RV=cRW4Nf9rBkYvc2JgcQr465NMYjAvJw@mail.gmail.com>
 <CA+55aFzTT5fzz__pY2HhxK=GPnJ8vtpgtok672AAXfSGg+ztuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+55aFzTT5fzz__pY2HhxK=GPnJ8vtpgtok672AAXfSGg+ztuQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Doug Anderson <dianders@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mathieu Malaterre <malat@debian.org>, Dave Hansen <dave.hansen@intel.com>, Yang Shi <yang.s@alibaba-inc.com>, Guenter Roeck <linux@roeck-us.net>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> If Ingo wants to build as root, maybe we could even make him set some
> environment flag to avoid errors.

I only build as root infrequently, but I think PeterZ does it more frequently?

Distro package builds are also often done as root.

I don't mind warnings, etc. - I only objected to the workaround of silently 
turning off a build optimization when root.

Thanks,

	Ingo
