Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:46914 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgBRTVz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 14:21:55 -0500
Received: by mail-vs1-f65.google.com with SMTP id t12so13455467vso.13
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 11:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20200210131925.145463-1-samitolvanen@google.com>
 <CAK7LNAS7UchtP_+2m4AB-hJ=nMwsM-qpkJ+VHU1JGJrn8K1KPg@mail.gmail.com>
 <CABCJKuemBAeySJQY6yxhzbxK=XGBtVSt+6J6WXpO=RoiVXH7GQ@mail.gmail.com> <CAK7LNARyYqmSByD3jQr+TPe1RHEj9CxqRE880AqxA5SU3yUk5A@mail.gmail.com>
In-Reply-To: <CAK7LNARyYqmSByD3jQr+TPe1RHEj9CxqRE880AqxA5SU3yUk5A@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 18 Feb 2020 11:21:42 -0800
Message-ID: <CABCJKudcVo95FcYGJ4223dqVEnkQnQJLx7fVaj1jF21n+sYEcg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove duplicate dependencies from .mod files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Masahiro,

On Sat, Feb 15, 2020 at 8:28 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> masahiro@grover:~/workspace/linux-kbuild$ llvm-nm
> drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' | sort -u |
> wc
>     572     572   11478

Thank you for testing this!

> Does ACK do this differently?

Yes, the difference is that we use LTO and after looking into this a
bit more, it turns out that when the individual files in the thin
archive are LLVM bitcode, llvm-nm behaves differently and prints out
the symbols for each file separately.

$ llvm-nm drivers/gpu/drm/nouveau/nouveau.o
...
nvif/client.o:
---------------- W __cfi_check
---------------- W __cfi_check_fail
                 U __cfi_slowpath_diag
                 U __ubsan_handle_cfi_check_fail
---------------- T nvif_client_fini
---------------- T nvif_client_init
---------------- T nvif_client_ioctl
---------------- T nvif_client_resume
---------------- T nvif_client_suspend
                 U nvif_object_fini
                 U nvif_object_init
                 U strncpy

nvif/device.o:
---------------- W __cfi_check
---------------- W __cfi_check_fail
                 U __ubsan_handle_cfi_check_fail
                 U kfree
---------------- T nvif_device_fini
---------------- T nvif_device_init
---------------- T nvif_device_time
                 U nvif_object_fini
                 U nvif_object_init
                 U nvif_object_mthd
                 U nvif_user_fini
...

While this output format still works for us, it does generate a lot of
duplicates. Anyway, I think we can come back to this when LTO is
closer to getting upstreamed.

Sami
