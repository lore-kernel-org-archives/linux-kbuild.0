Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx28.mail.ru ([94.100.176.42]:1480 "EHLO mx28.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750717AbZBNI0I (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 Feb 2009 03:26:08 -0500
Received: from mx40.mail.ru (mx40.mail.ru [94.100.176.54])
	by mx28.mail.ru (mPOP.Fallback_MX) with ESMTP id 50134797A63
	for <linux-kbuild@vger.kernel.org>; Sat, 14 Feb 2009 11:04:09 +0300 (MSK)
From: Andrey Borzenkov <arvidjaar@mail.ru>
Subject: Unable to make xconfig with Qt 4.5
Date: Sat, 14 Feb 2009 11:03:23 +0300
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3752896.iQ7sLfzbjd";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200902141103.32358.arvidjaar@mail.ru>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, cooker@mandrivalinux.org

--nextPart3752896.iQ7sLfzbjd
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

It seems that distribution started to ship Qt 4.5 with KDE4. I am lucky=20
one running Mandriva cooker:

{pts/2}% LC_ALL=3DC make -C ~/src/linux-git O=3D$HOME/build/linux-2.6.29=20
xconfig
make: Entering directory `/home/bor/src/linux-git'                         =
=20
  GEN     /home/bor/build/linux-2.6.29/Makefile                            =
=20
Package qt-mt was not found in the pkg-config search path.                 =
=20
Perhaps you should add the directory containing `qt-mt.pc'                 =
=20
to the PKG_CONFIG_PATH environment variable                                =
=20
No package 'qt-mt' found                                                   =
=20
Package qt-mt was not found in the pkg-config search path.                 =
=20
Perhaps you should add the directory containing `qt-mt.pc'                 =
=20
to the PKG_CONFIG_PATH environment variable                                =
=20
No package 'qt-mt' found                                                   =
=20
Package qt-mt was not found in the pkg-config search path.                 =
=20
Perhaps you should add the directory containing `qt-mt.pc'                 =
=20
to the PKG_CONFIG_PATH environment variable                                =
=20
No package 'qt-mt' found                                                   =
=20
Package qt-mt was not found in the pkg-config search path.                 =
=20
Perhaps you should add the directory containing `qt-mt.pc'                 =
=20
to the PKG_CONFIG_PATH environment variable                                =
=20
No package 'qt-mt' found                                                   =
=20
  HOSTCXX scripts/kconfig/qconf.o                                          =
=20
/home/bor/src/linux-git/scripts/kconfig/qconf.cc:6:26: error:=20
qapplication.h: No such file or directory                                  =
                      =20
/home/bor/src/linux-git/scripts/kconfig/qconf.cc:7:25: error:=20
qmainwindow.h: No such file or directory                                   =
                      =20

List of packages available in qt4 devel:

{pts/3}% rpm -ql libqt4-devel-4.5.0-0.rc1.4mdv2009.1 | grep pkgc
/usr/lib/pkgconfig/Qt3Support.pc
/usr/lib/pkgconfig/QtAssistantClient.pc
/usr/lib/pkgconfig/QtCLucene.pc
/usr/lib/pkgconfig/QtCore.pc
/usr/lib/pkgconfig/QtDBus.pc
/usr/lib/pkgconfig/QtDesigner.pc
/usr/lib/pkgconfig/QtDesignerComponents.pc
/usr/lib/pkgconfig/QtGui.pc
/usr/lib/pkgconfig/QtHelp.pc
/usr/lib/pkgconfig/QtNetwork.pc
/usr/lib/pkgconfig/QtOpenGL.pc
/usr/lib/pkgconfig/QtScript.pc
/usr/lib/pkgconfig/QtScriptTools.pc
/usr/lib/pkgconfig/QtSql.pc
/usr/lib/pkgconfig/QtSvg.pc
/usr/lib/pkgconfig/QtTest.pc
/usr/lib/pkgconfig/QtUiTools.pc
/usr/lib/pkgconfig/QtWebKit.pc
/usr/lib/pkgconfig/QtXml.pc
/usr/lib/pkgconfig/QtXmlPatterns.pc

this was straight update so either this is local packaging issue or Qt=20
4.5 change package structure.

--nextPart3752896.iQ7sLfzbjd
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmWes0ACgkQR6LMutpd94wvcQCgioCk4rrs8MWj8JcS91FL7OfB
0UIAoIk+CrZ6ozU7thJf7eFQ/ZEJoPE/
=/2dd
-----END PGP SIGNATURE-----

--nextPart3752896.iQ7sLfzbjd--
