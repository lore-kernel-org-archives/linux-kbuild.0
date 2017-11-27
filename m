Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:38542 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752784AbdK0Sdc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 13:33:32 -0500
MIME-Version: 1.0
In-Reply-To: <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
References: <20171114123834.xsjiy2ynvott4gae@brain> <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Mon, 27 Nov 2017 11:33:30 -0700
Message-ID: <CA+r1ZhjYJ0AgwMSp2aA73VHH14W93sEQOeJvtT=YJSzC5V3LfA@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package: snap-pkg target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Pisati <paolo.pisati@canonical.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Mon, Nov 27, 2017 at 4:07 AM, Paolo Pisati
<paolo.pisati@canonical.com> wrote:
> Following in footsteps of other targets like 'deb-pkg, 'rpm-pkg' and 'tar-pkg',
> this patch adds a 'snap-pkg' target for the creation of a Linux kernel snap
> package using the kbuild infrastructure.

With this patch applied to the 4.14 kernel source, and running make
snap-pkg on a Ubuntu 16.04 VM with the latest 16.04 kernel config
file, I ran into

Traceback (most recent call last):
  File "/usr/lib/python3.5/shutil.py", line 538, in move
    os.rename(src, real_dst)
FileNotFoundError: [Errno 2] No such file or directory:
'/home/jim/linux/snap/parts/kernel/install/lib/firmware' ->
'/home/jim/linux/snap/parts/kernel/install/firmware'

What did I miss?

-- 
Jim
