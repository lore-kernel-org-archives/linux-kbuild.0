Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54946 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751187Ab2J3NqW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Oct 2012 09:46:22 -0400
Message-ID: <508FDA2B.9000001@suse.cz>
Date: Tue, 30 Oct 2012 14:46:19 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] [KBUILD] Put the CROSS_COMPILE and ARCH variables in
 the build directory makefile
References: <20120930232005.GB30637@obsidianresearch.com>
In-Reply-To: <20120930232005.GB30637@obsidianresearch.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: linux-kbuild@vger.kernel.org

On 1.10.2012 01:20, Jason Gunthorpe wrote:
> To make cross building a little simpler. The usage with mini-config would
> be something like:
> 
> $ mkdir build
> $ make ARCH=arm CROSS_COMPILE=arm-v5te-linux-gnueabi- \
>        KCONFIG_ALLCONFIG=mini.config O=build allnoconfig
> $ make -C build/

Are you sure this is not going to suffer from the same issues as
5755433? See

commit 2331d1a6cd3d6e580bc88b9a160066d9e1177fe1
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Sun Oct 11 23:22:58 2009 +0200

    kbuild: revert "save ARCH & CROSS_COMPILE ..."

    Revert commit 575543347b5baed0ca927cb90ba8807396fe9cc9

    It caused following issues:

    - On architectures where ARCH= setting is used to select between
      32 and 64 bit this was no longer possible without "make mrproper"
    - If ARCH was changed then kbuild refused to run "make mrproper"
      because ARCH had changed
    - When CROSS_COMPILE was changed people were asked to run "make
mrproper"
      but kbuild refused to run "make mrproper" because CROSS_COMPILE
changed.
    - Spaces in CROSS_COMPILE was not 'supported'
    - If an non-existing ARCH= was used kbuild could get stuck

    Lessons learned:
    . Despite being simple and straghtforward people uses very different
      approaches when building the kernel.

    . CROSS_COMPILE is sometimes used for ccache despite cache being
      only a CC frontend so one would have expected CC to be
      used for this purpose.

    . And obviously this was not tested widely enough.

Michal
