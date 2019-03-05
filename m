Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:33700 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbfCERAS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Mar 2019 12:00:18 -0500
Date: Tue, 5 Mar 2019 17:59:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 3/3] objtool: move tools/objtool/ to scripts/objtool/
Message-ID: <20190305165947.GN32477@hirez.programming.kicks-ass.net>
References: <1551764896-8453-1-git-send-email-yamada.masahiro@socionext.com>
 <1551764896-8453-3-git-send-email-yamada.masahiro@socionext.com>
 <20190305144625.bjmkr6ebufbly5ba@treble>
 <CAK7LNAS=K2Hp+idOsHQBCYwk5YndzSdHL=GmJZRxsF6De3isNA@mail.gmail.com>
 <20190305163609.gz2cvpj7bxrnzdvm@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190305163609.gz2cvpj7bxrnzdvm@treble>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, Robin Meijboom <robin@meijboom.info>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Tue, Mar 05, 2019 at 10:36:09AM -0600, Josh Poimboeuf wrote:
> Anyway I would like to hear what Ingo and Peter think about moving it.

Pain :-)
