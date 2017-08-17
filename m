Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:32924 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751129AbdHQAY2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Aug 2017 20:24:28 -0400
Received: by mail-it0-f68.google.com with SMTP id m34so3367160iti.0
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Aug 2017 17:24:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170816110855.6021-2-riku.voipio@linaro.org>
References: <20170816110855.6021-1-riku.voipio@linaro.org> <20170816110855.6021-2-riku.voipio@linaro.org>
From: Jim Davis <jim.epost@gmail.com>
Date: Wed, 16 Aug 2017 17:24:27 -0700
Message-ID: <CA+r1Zhi=cJTk7F31jP4xochL0UoF_qOm6EJcWwgQ+1ZSnmf75A@mail.gmail.com>
Subject: Re: [PATCH 2/2] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, debian-kernel@lists.debian.org

On Wed, Aug 16, 2017 at 4:08 AM,  <riku.voipio@linaro.org> wrote:
>
> deb-pkg and bindeb-pkg removing need for handrulled source/changes

handrolled?

A quick test on a Ubuntu 16.04 vm with these patches applied on top of
4.13-rc5 generated a few warnings that didn't appear before:

dpkg-architecture: warning: specified GNU system type i686-linux-gnu
does not match CC system type x86_64-linux-gnu, try setting a correct
CC environment variable
dpkg-buildpackage: warning: debian/rules is not executable; fixing that
make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent
make rule.
make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent
make rule.
make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent
make rule.
dpkg-genchanges: warning: package linux-firmware-image-4.13.0-rc5+ in
control file but not in files list
dpkg-genchanges: warning: package linux-image-4.13.0-rc5+-dbg in
control file but not in files list

I think that first warning is from running "make allnoconfig
bindeb-pkg", and allnoconfig sets CONFIG_X86_32=y

-- 
Jim
