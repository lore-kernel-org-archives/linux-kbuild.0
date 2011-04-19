Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:45544 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791Ab1DSGmk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Apr 2011 02:42:40 -0400
MIME-Version: 1.0
Date: Tue, 19 Apr 2011 14:42:39 +0800
Message-ID: <BANLkTikYuYVvXiHvi_kr2H7n29k=veThtw@mail.gmail.com>
Subject: LOCALVERSION in setlocalversion
From: Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

In scripts/setlocalversion under linux kernel tree, the scripts seems
a little strange.

# scm version string if not at a tagged commit
if test "$CONFIG_LOCALVERSION_AUTO" = "y"; then
        # full scm version string
        res="$res$(scm_version)"
else
        # append a plus sign if the repository is not in a clean
        # annotated or signed tagged state (as git describe only
        # looks at signed or annotated tags - git tag -a/-s) and
        # LOCALVERSION= is not specified
        if test "${LOCALVERSION+set}" != "set"; then
                scm=$(scm_version --short)
                res="$res${scm:++}"
        fi
fi

LOCALVERSION isn't assigned in any place. Only CONFIG_LOCALVERSION
can be assigned in .config file.
Why do we need to check LOCALVERSION at here?

Thanks
Haojian
