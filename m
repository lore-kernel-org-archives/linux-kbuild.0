Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:42941 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965928AbdKPW5f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 17:57:35 -0500
Received: by mail-io0-f195.google.com with SMTP id u42so6933038ioi.9
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 14:57:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
References: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 16 Nov 2017 14:57:33 -0800
Message-ID: <CAGXu5j+j0TZ+QUMf09eifTwOwmgA=3AbA3e2PJQehKF61hMcRA@mail.gmail.com>
Subject: Re: [PATCH 0/7] Support for automatic checkpatch running in the kernel
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Knut Omang <knut.omang@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?B?w4VzbXVuZCDDmHN0dm9sZA==?= <asmund.ostvold@oracle.com>, =?UTF-8?B?SMOla29uIEJ1Z2dl?= <haakon.bugge@oracle.com>, John Haxby <john.haxby@oracle.com>, linux-doc@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Joe Perches <joe@perches.com>

On Thu, Nov 16, 2017 at 9:01 AM, Knut Omang <knut.omang@oracle.com> wrote:
> The most important checkpatch feature added is the --ignore-cfg feature, which
> takes a file argument and parses that file according to this minimal language:
>
>        # comments
>        line_len <n>
>        except checkpatch_type [files ...]
>        pervasive checkpatch_type1 [checkpatch_type2 ...]
>
> With "make P=2" checkpatch is called with "--file" and "--ignore_cfg
> checkpatch.cfg" which causes it to look for a file named 'checkpatch.cfg' in the
> same directory as the source file. If that file exists, checkpatch will be run
> with an implicit --strict and with the @ignore list expanded with content from
> the configuration file.  If it does not exist, make will simply silently ignore
> the file.

Will these configurations be cascading? (For example, all of net/ uses
a different comment style, so having that recorded in a single file
would be nice.)


-- 
Kees Cook
Pixel Security
