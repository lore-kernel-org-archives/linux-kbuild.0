Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:53503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbgBJFPE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Feb 2020 00:15:04 -0500
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: install is no longer PHONY?
Date: Mon, 10 Feb 2020 16:14:58 +1100
Message-ID: <874kvz10rx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Masahiro,

I noticed that "install" seems to be no longer PHONY, or at least if I
have a file/directory called install then the build doesn't run.

eg:
  $ touch install
  $ make install
  make: 'install' is up to date.
  $ rm install
  $ make install
    LDS     arch/powerpc/boot/zImage.lds
    WRAP    arch/powerpc/boot/zImage.pseries
    WRAP    arch/powerpc/boot/zImage.epapr

In the past the presence of an install file/directory didn't have any
affect.

It seems this changed in:
  d79424137a73 ("kbuild: do not update config when running install targets")

Was that expected?

cheers
