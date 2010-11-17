Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:38547 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934606Ab0KQMX5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Nov 2010 07:23:57 -0500
MIME-Version: 1.0
Date: Wed, 17 Nov 2010 14:23:56 +0200
Message-ID: <AANLkTinyLQUN6fMwWQDxvPpfRTo-4kHPVsggPSoAGhv-@mail.gmail.com>
Subject: make xconfig broken on 2.6.37-rc2
From: Ameya Palande <2ameya@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

Hi,

When I try to do "make xconfig" on 2.6.37-rc2 it gives me following error:

  HOSTCXX scripts/kconfig/qconf.o
In file included from scripts/kconfig/qconf.cc:48:
scripts/kconfig/qconf.moc:13: fatal error: private/qucomextra_p.h: No
such file or directory
compilation terminated.
make[1]: *** [scripts/kconfig/qconf.o] Error 1
make: *** [xconfig] Error 2

My host is ubuntu 10.10 x86-32 with libqt3 and libqt4 both installed.

Cheers,
Ameya.
