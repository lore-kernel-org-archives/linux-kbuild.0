Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.data-modul.de ([212.184.205.171]:38042 "HELO
	mailgw1.data-modul.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751142AbaHRLFa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Aug 2014 07:05:30 -0400
From: Silvio Fricke <silvio.fricke@gmail.com>
Subject: [PATCH v2] pkg-config default search paths
Date: Mon, 18 Aug 2014 13:05:09 +0200
Message-Id: <1408359910-17394-1-git-send-email-silvio.fricke@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E . MORIN" <yann.morin.1998@free.fr>
Cc: Silvio Fricke <silvio.fricke@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


Hi,

some cross-toolchains change the pkg-config search pathes to do some
package-config setups for cross compiling. The init of the toolchain
manipulates PKG_CONFIG_SYSROOT_DIR and PKG_CONFIG_PATH environment variables.
A pkg-config call from kconfig searches now on the wrong place to find the
ncurses and relevant packages and gives back the wrong values for the ncurses
installation and this break the [x,g,menu]config.

Yann, please include this patch to your maintainer repository.

V2:
no changes to v1 [1], only "RFC" removed

[1] http://thread.gmane.org/gmane.linux.kbuild.devel/11993

Cheers,
Silvio


Silvio Fricke (1):
  kconfig: menuconfig: pkg-config should base upon default configuration

 scripts/kconfig/lxdialog/check-lxdialog.sh | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.0.4

