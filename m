Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727081AbgDWLuP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 07:50:15 -0400
MIME-Version: 1.0
References: <20200423073929.127521-1-masahiroy@kernel.org> <20200423073929.127521-15-masahiroy@kernel.org>
In-Reply-To: <20200423073929.127521-15-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Apr 2020 13:50:02 +0200
Message-ID: <CANiq72nUa8uoXtSThqq7t9oAmZnGSE9a1_d+ZoRAagpKDo4DRg@mail.gmail.com>
Subject: Re: [PATCH 14/16] samples: auxdisplay: use 'userprogs' syntax
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Masahiro,

On Thu, Apr 23, 2020 at 9:41 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Kbuild now supports the 'userprogs' syntax to describe the build rules
> of userspace programs for the target architecture (i.e. the same
> architecture as the kernel).
>
> Add the entry to samples/Makefile to put this into the build bot
> coverage.
>
> I also added the CONFIG option guarded by 'depends on CC_CAN_LINK'
> because $(CC) may not necessarily provide libc.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for this! Looks nice. I guess you take all patches for the
samples/ changes through your tree?

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel
