Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:59486 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753160Ab1BPNqz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Feb 2011 08:46:55 -0500
Message-ID: <4D5BD54D.7070209@suse.cz>
Date: Wed, 16 Feb 2011 14:46:53 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: kbuild/kconfig for non-Linux projects
References: <AANLkTimpG+9nvad8WnjaORcyZR8Yu5AaYwbQDGOWDjYJ@mail.gmail.com>
In-Reply-To: <AANLkTimpG+9nvad8WnjaORcyZR8Yu5AaYwbQDGOWDjYJ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas De Schampheleire <patrickdepinguin+kbuild@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>

On 16.2.2011 10:08, Thomas De Schampheleire wrote:
> Hi,
> 
> I'm interested in using kbuild/kconfig for other projects than the
> Linux kernel. I notice that a lot of projects (e.g. Buildroot,
> Busybox, uClibc, OpenBricks, ...) are already using this framework,
> but it's unclear to me which steps are needed to do so.

You should talk to Arnaud Lacombe, who has done quite some work in this
direction on kconfig (portability and ability to easily "rebrand"
kconfig). Honestly, I don't know if kbuild is used outside of the kernel
and if it would make sense at all. It might be easier to write the
Makefiles yourself. It's not that large and most of it is linux-specific
anyway:

$ wc -l Makefile scripts/Makefile.* scripts/Kbuild.include
  1533 Makefile
   405 scripts/Makefile.build
   104 scripts/Makefile.clean
    72 scripts/Makefile.fwinst
   103 scripts/Makefile.headersinst
     3 scripts/Makefile.help
   170 scripts/Makefile.host
   244 scripts/Makefile.lib
    60 scripts/Makefile.modbuiltin
    35 scripts/Makefile.modinst
   153 scripts/Makefile.modpost
   262 scripts/Kbuild.include
  3144 total



> I found a related thread on this mailing list that seemed to have died out.
> http://www.mail-archive.com/kbuild-devel@lists.sourceforge.net/msg02487.html
> 
> I also found a code repository 'menuconfig' here, although I doubt
> that this is an official one:
> http://code.google.com/p/menuconfig/source/browse/trunk/
> 
> Specifically, I'd like to know:
> * are there 'official' sources to kbuild in some repository outside
> the linux kernel?

No, it is maintained as part of the kernel.


> * which steps are needed to use kbuild in a project other than the
> linux kernel? Is there some documentation available?
> * what is the license under which kbuild is distributed? In case it's
> GPL, does this impact the license of the software project using
> kbuild, i.e. does using kbuild imply the project being a derived work?

The license is GPLv2. Using kconfig as a separate tool to configure
options should probably be OK, I'm not so sure about using kbuild. You
should ask a lawyer. Or ask Kai Germaschewski and Sam Ravnborg if they
will sue you or not :-). Also see the first paragraph.

Michal
