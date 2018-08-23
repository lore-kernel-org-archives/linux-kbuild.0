Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:36278 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbeHWXKY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Aug 2018 19:10:24 -0400
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v3] modules_install: make missing $DEPMOD a warning instead of an error
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <4449cd91-fae5-caf1-a917-82e0c5f0aba8@infradead.org>
Date: Thu, 23 Aug 2018 21:38:51 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A695D99-A693-4E81-A321-4DC599A8F36A@goldelico.com>
References: <4449cd91-fae5-caf1-a917-82e0c5f0aba8@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Chih-Wei Huang <cwhuang@linux.org.tw>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>

Hi Randy,

> Am 23.08.2018 um 20:13 schrieb Randy Dunlap <rdunlap@infradead.org>:
>=20
> From: Randy Dunlap <rdunlap@infradead.org>
>=20
> When $DEPMOD is not found, only print a warning instead of exiting
> with an error message and error status.
>=20
> Warning: 'make modules_install' requires /sbin/depmod. Please install =
it.
> This is probably in the kmod package.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: 934193a654c1 ("kbuild: verify that $DEPMOD is installed")
> Cc: stable@vger.kernel.org
> Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>
> Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Jessica Yu <jeyu@kernel.org>
> Cc: Chih-Wei Huang <cwhuang@linux.org.tw>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> v2: add missing "exit 0" and update the commit message (no Error).
> v3: add Fixes: and Cc: stable
>=20
> scripts/depmod.sh |    4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> --- lnx-418.orig/scripts/depmod.sh
> +++ lnx-418/scripts/depmod.sh
> @@ -15,9 +15,9 @@ if ! test -r System.map ; then
> fi
>=20
> if [ -z $(command -v $DEPMOD) ]; then
> -	echo "'make modules_install' requires $DEPMOD. Please install =
it." >&2
> +	echo "Warning: 'make modules_install' requires $DEPMOD. Please =
install it." >&2
> 	echo "This is probably in the kmod package." >&2
> -	exit 1
> +	exit 0
> fi
>=20
> # older versions of depmod require the version string to start with =
three
>=20

works for me.

  INSTALL sound/usb/snd-usb-audio.ko - due to target is PHONY
  INSTALL sound/usb/snd-usbmidi-lib.ko - due to target is PHONY
  DEPMOD  4.18.4-letux+ - due to target is PHONY
Warning: 'make modules_install' requires /sbin/depmod. Please install =
it.
This is probably in the kmod package.

and returns success status.

BR and thanks,
Nikolaus Schaller
