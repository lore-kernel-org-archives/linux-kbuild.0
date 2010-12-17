Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:39619 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754425Ab0LQNd3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Dec 2010 08:33:29 -0500
MIME-Version: 1.0
In-Reply-To: <AANLkTinyLQUN6fMwWQDxvPpfRTo-4kHPVsggPSoAGhv-@mail.gmail.com>
References: <AANLkTinyLQUN6fMwWQDxvPpfRTo-4kHPVsggPSoAGhv-@mail.gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 17 Dec 2010 14:33:11 +0100
Message-ID: <AANLkTin=vr14wPJottefmfsgfyYZbfcmchQerq+0oP5J@mail.gmail.com>
Subject: Re: make xconfig broken on 2.6.37-rc2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ameya Palande <2ameya@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

2010/11/17 Ameya Palande <2ameya@gmail.com>:
> Hi,
>
> When I try to do "make xconfig" on 2.6.37-rc2 it gives me following error:
>
>  HOSTCXX scripts/kconfig/qconf.o
> In file included from scripts/kconfig/qconf.cc:48:
> scripts/kconfig/qconf.moc:13: fatal error: private/qucomextra_p.h: No
> such file or directory
> compilation terminated.
> make[1]: *** [scripts/kconfig/qconf.o] Error 1
> make: *** [xconfig] Error 2
>
> My host is ubuntu 10.10 x86-32 with libqt3 and libqt4 both installed.

hi !
this is due to moc which points by default to /usr/bin/moc-qt3
just make it point to moc-qt4 :
sudo update-alternatives --config moc

then make distclean, make xconfig.

richard
