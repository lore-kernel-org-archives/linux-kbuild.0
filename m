Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:50666 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389470AbeHAQcD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Aug 2018 12:32:03 -0400
Date: Wed, 1 Aug 2018 15:45:48 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: Can we fix samples/ dependency on headers please?
Message-ID: <20180801144548.GM30522@ZenIV.linux.org.uk>
References: <31061.1533131891@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31061.1533131891@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, arnd@arndb.de, sfr@canb.auug.org.au, nico@linaro.org, linux-kernel@vger.kernel.org

On Wed, Aug 01, 2018 at 02:58:11PM +0100, David Howells wrote:
> Hi,
> 
> I'm currently having to mark various userspace programs I've added to the
> samples/ directory as BROKEN in samples/Kconfig because the root Makefile
> mucks up the dependencies between building samples and headers_install.
> 
> The main culprit seems to be:
> 
> 	commit dd92478a15fa3bfd746ee08b4ef59401c1537804
> 	Author: Nicolas Pitre <nicolas.pitre@linaro.org>
> 	Date:   Sun Feb 28 22:00:00 2016 -0500
> 	kbuild: build sample modules along with the rest of the kernel
>  
> which make the samples build in parallel with the build, thereby voiding the
> explicit dependency:
> 
> 	Documentation/ samples/: headers_install
> 
> and thereby breaking:
> 
> 	commit ddea05fa148b4d8e66498e522a616d87f9cf81e3
> 	Author: Arnd Bergmann <arnd@arndb.de>
> 	Date:   Mon Jul 4 16:39:35 2016 +0200
> 	kbuild: make samples depend on headers_install

Breaking a commit 4 months before its creation is quite a feat...  Said that,
something along the lines of Arnd's commit is needed (build of samples/*
should happen against the kernel-supplied headers; it certainly should not
depend upon having make headers_install done on the same tree in previous
build.  The problem, AFAICS, is that dependency is for explicit samples/ in
the target list, not samples/<anything> being added there.  Worse, by the
time we get to those, we don't see top-level Makefile targets, so e.g.
adding explict
$(obj)/.test-fsmount.cmd: headers_install
won't work...
