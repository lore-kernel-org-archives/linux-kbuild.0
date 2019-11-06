Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fieldses.org ([173.255.197.46]:33414 "EHLO fieldses.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbfKFEbU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 23:31:20 -0500
Date: Tue, 5 Nov 2019 23:31:20 -0500
From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191106043120.GB6355@fieldses.org>
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
 <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org>
 <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Bhaskar Chowdhury <unixbhaskar@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Nov 06, 2019 at 11:53:28AM +0900, Masahiro Yamada wrote:
> BTW.
> Bruce,
> Does the current script expect RHEL or something?
> I do not see 'new-kernel-pkg' on my Ubuntu machine.

I test on Fedora.  Looks like on recent Fedora that's only provided by
an rpm "grubby-deprecated", which is an inauspicious name....

I think maybe you're supposed to use "grubby" itself now.  Do you have
that?

> It would still work with 'new-kernel-pkg: command not found'
> warning.
> 
> We could bypass it if we like.
> 
> command -v new-kernel-pkg && new-kernel-pkg --remove $f

Looks like it's what updates the grub configuration, which is probably a
nice thing to do if you can.

--b.
