Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.data-modul.de ([212.184.205.171]:19628 "HELO
	mailgw1.data-modul.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753707AbaHKOdW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Aug 2014 10:33:22 -0400
From: Silvio Fricke <silvio.fricke@gmail.com>
Subject: [RFC] [PATCH] pkg-config default search pathes
Date: Mon, 11 Aug 2014 16:22:34 +0200
Message-Id: <cover.1407766447.git.silvio.fricke@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E . MORIN" <yann.morin.1998@free.fr>
Cc: Silvio Fricke <silvio.fricke@gmail.com>, linux-kbuild@vger.kernel.org, Justin Lecher <jlec@gentoo.org>

Hi,

please review this patch.
I'm a little bit unsure if this patch is technicaly state-of-the-art because
kbuild does it right. The problem is that some cross-toolchains (on my box is
yocto installed) change the pkg-config search pathes to do some package-config
setups for cross compiling.
But the init of the toolchain manipulates PKG_CONFIG_SYSROOT_DIR and
PKG_CONFIG_PATH variables that a pkg-config call searches in the wrong place to
find the package and gives back the wrong values which we use to test the
availability of ncurses installation and this break the [x,g,menu]config.

Some recommendations for this?


Cheers and thx,
Silvio


Silvio Fricke (1):
  kconfig: menuconfig: pkg-config should base upon default configuration

 scripts/kconfig/lxdialog/check-lxdialog.sh | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.0.3

