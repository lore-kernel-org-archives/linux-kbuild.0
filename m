Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39027 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfLCH2T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Dec 2019 02:28:19 -0500
Date: Tue, 3 Dec 2019 12:58:02 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [RFC scripts] Modules info in one liner script
Message-ID: <20191203072802.GA224932@ArchLinux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, rdunlap@infradead.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Masahiro/Michal/Randy.

This is very trivial and one line script to extract out the running
kernel modules with descriptions, like below

filename:
/lib/modules/5.4.1-arch1-1ArchLinux-5.4.1/kernel/drivers/ata/libata.ko.xz
description:    Library module for ATA devices
depends:        scsi_mod
filename:
/lib/modules/5.4.1-arch1-1ArchLinux-5.4.1/kernel/drivers/usb/host/xhci-pci.ko.xz
description:    xHCI PCI Host Controller Driver
depends:        xhci-hcd
filename:
/lib/modules/5.4.1-arch1-1ArchLinux-5.4.1/kernel/drivers/usb/host/xhci-hcd.ko.xz
description:    'eXtensible' Host Controller (xHC) Driver
depends:
filename:
/lib/modules/5.4.1-arch1-1ArchLinux-5.4.1/kernel/drivers/scsi/scsi_mod.ko.xz
description:    SCSI core
depends:
filename:
/lib/modules/5.4.1-arch1-1ArchLinux-5.4.1/kernel/arch/x86/crypto/crc32c-intel.ko.xz
description:    CRC32c (Castagnoli) optimization using Intel Hardware.
depends:
filename:
/lib/modules/5.4.1-arch1-1ArchLinux-5.4.1/kernel/drivers/usb/host/ehci-pci.ko.xz
description:    EHCI PCI platform driver
depends:        ehci-hcd
filename:
/lib/modules/5.4.1-arch1-1ArchLinux-5.4.1/kernel/drivers/usb/host/ehci-hcd.ko.xz
description:    USB 2.0 'Enhanced' Host Controller (EHCI) Driver


and the code to do this :

 awk '{print $1}' "/proc/modules" | xargs modinfo | awk
 '/^(filename|desc|depends)/'

 Can we put in a script called "kernel_modules_info.sh"
 under scripts dir??

 Kindly let me know your thoughts.

 Thanks,
 Bhaskar


--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3mDn4ACgkQsjqdtxFL
KRUkXwgAmIiDFEZql6FvNcZsP5QNpnORHt97Ui6Ev4v/JveigLr62ROuaWi+4Y0U
qrnUtVWN+3OZMuktdFNoiP+9EbVZA7XWbp6SVGJHdUmrHG4nPvV3DcZtKaaWHieL
Bfh/seBe6PTmbYEYn11o3unDmBROLyVthYPd4B8tj4AMbqny+dH9iJszVkuuA3kf
0QMBCyc72hB4bfGjAn7ujkXF7bOaEZe4SKImqNnV+gdAj7VBdR15CHptLO3VicWu
r0YWa/X+wCWKGdHwPHBDyFtTlJnda93wzhCCf9Q3z0i8V3Pof9rP/ch+ZKeipsaF
ogpMRUPCGLhebP7dmeDtSJaAlscsiA==
=Ogyh
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
