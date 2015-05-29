Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:35281 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752875AbbE2RQo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 May 2015 13:16:44 -0400
Received: by lbbuc2 with SMTP id uc2so52746142lbb.2
        for <linux-kbuild@vger.kernel.org>; Fri, 29 May 2015 10:16:43 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 29 May 2015 10:16:42 -0700
Message-ID: <CA+r1ZhieLs6vb6RUZGeVp_crCu-LyYT9DOoAuynBT2xDEh=UCg@mail.gmail.com>
Subject: make binrpm-pkg problem with Fedora 22
From: Jim Davis <jim.epost@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On a new Fedora 22 install,  running 'make binrpm-pkg' in the v4.1-rc5
kernel source tree fails with

rpm --define "_builddir ." --target \
    x86_64 -bb ./binkernel.spec
rpm --target: unknown option
scripts/package/Makefile:60: recipe for target 'binrpm-pkg' failed

From that makefile,

# Do we have rpmbuild, otherwise fall back to the older rpm
RPM := $(shell if [ -x "/usr/bin/rpmbuild" ]; then echo rpmbuild; \
                   else echo rpm; fi)

but it looks like the rpmbuild functionality has been taken out of
(plain) rpm now.

Jim
