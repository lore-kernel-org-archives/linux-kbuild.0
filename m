Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:52322 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751468AbdBLWKj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Feb 2017 17:10:39 -0500
From: Sven Joachim <svenjoac@gmx.de>
Subject: Re: deb-pkg target invokes clean
References: <CAEPqvoxvQHL=9bfTxE+GtOY225rYaeP5p3_7bNQoj4YG_kL=cQ@mail.gmail.com>
Date: Sun, 12 Feb 2017 23:10:34 +0100
In-Reply-To: <CAEPqvoxvQHL=9bfTxE+GtOY225rYaeP5p3_7bNQoj4YG_kL=cQ@mail.gmail.com>
        (Juraj's message of "Sun, 12 Feb 2017 22:11:37 +0100")
Message-ID: <87mvdrys9x.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Juraj <juraj.orsulic@fer.hr>
Cc: linux-kbuild@vger.kernel.org

On 2017-02-12 22:11 +0100, Juraj wrote:

> I noticed that the deb-pkg target in scripts/package/Makefile invokes
> make clean. Is this really necessary?

Yes, because (since Linux 4.3) "make deb-pkg" also generates a source
tarball, and you don't want spurious object files in that tarball.

> I disabled it so I could rebuild
> .deb packages faster after making small changes to the kernel source.

There's the bindeb-pkg target for that already. :-)

Cheers,
       Sven
