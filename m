Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:50046 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754761Ab1BPJIJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Feb 2011 04:08:09 -0500
Received: by qwa26 with SMTP id 26so1045588qwa.19
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Feb 2011 01:08:08 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 16 Feb 2011 10:08:08 +0100
Message-ID: <AANLkTimpG+9nvad8WnjaORcyZR8Yu5AaYwbQDGOWDjYJ@mail.gmail.com>
Subject: kbuild/kconfig for non-Linux projects
From: Thomas De Schampheleire <patrickdepinguin+kbuild@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

I'm interested in using kbuild/kconfig for other projects than the
Linux kernel. I notice that a lot of projects (e.g. Buildroot,
Busybox, uClibc, OpenBricks, ...) are already using this framework,
but it's unclear to me which steps are needed to do so.

I found a related thread on this mailing list that seemed to have died out.
http://www.mail-archive.com/kbuild-devel@lists.sourceforge.net/msg02487.html

I also found a code repository 'menuconfig' here, although I doubt
that this is an official one:
http://code.google.com/p/menuconfig/source/browse/trunk/

Specifically, I'd like to know:
* are there 'official' sources to kbuild in some repository outside
the linux kernel?
* which steps are needed to use kbuild in a project other than the
linux kernel? Is there some documentation available?
* what is the license under which kbuild is distributed? In case it's
GPL, does this impact the license of the software project using
kbuild, i.e. does using kbuild imply the project being a derived work?

Thanks,
Thomas
