Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53600 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725843AbeKUAJW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Nov 2018 19:09:22 -0500
Date: Tue, 20 Nov 2018 14:40:07 +0100
From: Jean Delvare <jdelvare@suse.de>
Subject: Backed up kernels
Message-ID: <20181120144007.016e4998@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, Martin Wilck <martin.wilck@suse.com>, LKML <linux-kernel@vger.kernel.org>

Hi Masahiro, Michal,

When I run "make install", if a kernel by the same version number +
flavor string already exists, a backup is created with ".old" appended.
Over time, this adds many entries to my boot menu, makes some package
updates take much longer (e.g. when all initrds must be regenerated),
and ultimately confuses grub2, which fails to find the matching modules
directory under /lib/modules.

You could argue that grub2 could be fixed to find the right modules
directory, but in fact there is no guarantee that the modules built for
the new kernel are fully compatible with the old kernel. Keeping a
backup copy of the old modules is also not possible, because both
kernels have the same $(uname -r) and therefore the modules of both
kernels must live under the same /lib/modules/$(uname -r), which
collides.

Given that, is there really any practical value in saving a backup of
old kernels? I'm doing kernel development for 15 years and I can't
remember ever booting one of these ".old" kernels. If my latest
development kernel doesn't work for any reason, I will just boot back
to the distribution kernel.

Therefore I am asking, can we change "make install" so that it does NOT
create a backup copy of an existing kernel?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
