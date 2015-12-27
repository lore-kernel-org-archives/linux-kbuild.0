Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:36133 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751290AbbL0Ry2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 27 Dec 2015 12:54:28 -0500
Received: by mail-wm0-f50.google.com with SMTP id p187so242210130wmp.1
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Dec 2015 09:54:27 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 27 Dec 2015 18:54:27 +0100
Message-ID: <CAOMGZ=FvbWy+WYCmsWmN+sGL_z8T=8XMsV3YCkHwP+Cs4WZu3w@mail.gmail.com>
Subject: New satconfig version (for 4.3.0)
From: Vegard Nossum <vegard.nossum@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kconfig-sat <kconfig-sat@googlegroups.com>, kbuild <linux-kbuild@vger.kernel.org>

Hi all,

I've rebased my satconfig branch onto v4.3 and fixed a couple of bugs
which now actually makes satconfig quite usable (depending on what you
feed it as input, of course).

Known bugs/TODO:

1. Actually call conf_write_autoconf() ourselves and figure out why it
changes a lot of config options compared to not calling it + running
yes "" | make silentoldconfig

2. Write a regression/test suite using isolated Kconfig fragments to
test individual features of the SAT translation (e.g. prompts,
defaults, choices, dependencies, etc.)

3. Figure out why yes "" | make silentoldconfig changes anything at all

In the meantime, if you want to give it a try, here's an example that
gets a fairly minimal UML kernel running:

git fetch git@github.com:vegard/linux-2.6.git v4.3+kconfig-sat
git checkout FETCH_HEAD

cat > .satconfig <<EOF
CONFIG_MODULES=n

# standard features
CONFIG_PRINTK=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_SCRIPT=y

# uml-specific
CONFIG_STDERR_CONSOLE=y
CONFIG_HOSTFS=y
CONFIG_BLK_DEV_MD=y
EOF

# Run the solver with above .satconfig file as input
make ARCH=um satconfig

# Build the kernel
make ARCH=um -j8

# Run it
./vmlinux rootfstype=hostfs rw init=/bin/bash

Let me know if you have any questions/comments or run into any problems.


Vegard
