Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:42891 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753625Ab2GKNOK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Jul 2012 09:14:10 -0400
Received: by ghrr11 with SMTP id r11so1167865ghr.19
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jul 2012 06:14:09 -0700 (PDT)
MIME-Version: 1.0
Reply-To: martin-eric.racine@iki.fi
Date: Wed, 11 Jul 2012 16:14:08 +0300
Message-ID: <CAPZXPQfE7M0Jzsns4zKrKu0x55_AWEUpzydm1dUOshhZo_ki=A@mail.gmail.com>
Subject: 'make deb-pkg' generates a linux-headers-(version) that skips some files
From: =?UTF-8?Q?Martin=2D=C3=89ric_Racine?= <martin-eric.racine@iki.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org

Greetings,

As a part of the debugging process for (
http://bugs.debian.org/677533/ ), I was asked to build myself a kernel
from HEAD, followed by standalone modules from an external tree,
following this procedure:

git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
cd linux
git fetch origin
git reset --hard origin/master
cp /boot/config-$(uname -r) .config
scripts/config --disable DEBUG_INFO
make localmodconfig
make deb-pkg
sudo dpkg -i ../linux-image-3.5.0*.deb ../linux-headers-3.5.0*.deb
cd ..
wget http://moinejf.free.fr/gspca-2.15.18.tar.gz
tar -zxf gspca-2.15.18.tar.gz
cd gspca-2.15.18
make
sudo make install

Compilation of the standalone modules failed, because the
linux-headers package produced by 'make deb-pkg' failed to include
(arch/x86/Makefile_32.cpu), which had to be copied by hand to complete
the build.

I'm not sure whether this is due to an oversight or whether this is a
regression, much even less whether this is an upstream LKML issue or a
Debian issue, so I'm CC'ing both lists.

Hopefully, someone can figure out what went wrong and fix it.

Cheers!
Martin-Éric
