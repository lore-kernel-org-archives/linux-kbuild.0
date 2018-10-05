Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:35952 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbeJEHOY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Oct 2018 03:14:24 -0400
Subject: Re: [ANN] init-kconfig - easy way to embrace Linux's kconfig
References: <20181004200249.GL5238@garbanzo.do-not-panic.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8487f1e3-248f-8736-90fb-5bbd87b35a44@infradead.org>
Date: Thu, 4 Oct 2018 17:18:07 -0700
MIME-Version: 1.0
In-Reply-To: <20181004200249.GL5238@garbanzo.do-not-panic.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Petr Vorel <pvorel@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Johannes Berg <johannes@sipsolutions.net>, Valentin Rothberg <valentinrothberg@gmail.com>, Vegard Nossum <vegard.nossum@oracle.com>, Felix Fietkau <nbd@nbd.name>, kconfig-sat@googlegroups.com, Ulf Magnusson <ulfalizer@gmail.com>

On 10/4/18 1:02 PM, Luis Chamberlain wrote:
> Every now and then a project is born, and they decide to use Linux's
> kconfig to enable configuration of their project. As it stands we *know*
> kconfig is now used in at least over 12 different projects [0]. I myself
> added kconfig to one as well years ago. Even research reveals that
> kconfig has become one of the leading industrial variability modeling
> languages [1] [2].
> 
> What is often difficult to do though is to start off using kconfig and
> integrating it into a project. Or updating / syncing to the latest
> kconfig from upstream Linux.
> 
> I had yet another need to use kconfig for another small project so
> decided to make a clean template others can use and help keep it in sync.
> This is a passive fork which aims to keep in sync with the Linux
> kernel's latest kconfig to make it easier to keep up to date and to
> enable new projects to use and embrace kconfig on their own.  The goal
> is *not* to fork kconfig and evolve it separately, but rather keep in
> sync with the evolution of kconfig on Linux to make it easier for
> projects to use kconfig and also update their own kconfig when needed.
> 
> This may also be useful if folks want to test R&D code on a smaller
> compartamentalized codebase.
> 
> If you find this useful and you'd like to help keep it in sync, send
> patches my way as the kernel's kconfig evolves. The code is up on
> gitlab [3].
> 
> Do we want to document this option on Linux in case folks want to try
> and embrace kconfig on their own for other projects?
>   
> [0] http://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
> [1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
> [2] http://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
> [3] https://gitlab.com/mcgrof/init-kconfig
> 
>   Luis
> 

Hi Luis,

Any crossover with Ulf's recent announcement?

https://lore.kernel.org/lkml/CAFkk2KQ-sC=bAd9fCkOVPNmZn8m+EZfpZtirE+J5VpvW120sxQ@mail.gmail.com/


thanx,
-- 
~Randy
