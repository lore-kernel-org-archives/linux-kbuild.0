Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:54470 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752668AbaINP6M (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 14 Sep 2014 11:58:12 -0400
Received: by mail-vc0-f170.google.com with SMTP id hy4so2565940vcb.1
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Sep 2014 08:58:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140914101821.3745.21235.stgit@localhost>
References: <20140914100545.3745.23394.stgit@localhost> <20140914101821.3745.21235.stgit@localhost>
From: Peter Foley <pefoley2@pefoley.com>
Date: Sun, 14 Sep 2014 11:57:51 -0400
Message-ID: <CAOFdcFP0gRDX66ius=VAN8xZZUeX9f93C7YwL52TrsJegTyy1g@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: Make targets names tree-wide unique on x86
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kirill Tkhai <tkhai@yandex.ru>
Cc: Michal Marek <mmarek@suse.cz>, arnd@arndb.de, linux-kbuild@vger.kernel.org, gregkh@linuxfoundation.org, LKML <linux-kernel@vger.kernel.org>, oleg@redhat.com, grant.likely@secretlab.ca, ebiederm@xmission.com, Andrew Morton <akpm@linux-foundation.org>, ktkhai@parallels.com, Sam Ravnborg <sam@ravnborg.org>

On Sun, Sep 14, 2014 at 6:18 AM, Kirill Tkhai <tkhai@yandex.ru> wrote:
> diff --git a/init/Makefile b/init/Makefile
> index 7bc47ee..566a9ff 100644
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -2,23 +2,28 @@
>  # Makefile for the linux kernel.
>  #
>
> -obj-y                          := main.o version.o mounts.o
> +obj-y                          := main.o version.o do_mounts.o
> +
>  ifneq ($(CONFIG_BLK_DEV_INITRD),y)
>  obj-y                          += noinitramfs.o
>  else
> -obj-$(CONFIG_BLK_DEV_INITRD)   += initramfs.o
> +obj-y                          += initramfs.o do_mounts_initrd.o
> +endif
> +
> +ifeq ($(CONFIG_BLK_DEV_RAM),y)
> +obj-y                          += do_mounts_rd.o
>  endif
> +
> +ifeq ($(CONFIG_BLK_DEV_MD),y)
> +obj-y                          += do_mounts_md.o
> +endif
> +
>  obj-$(CONFIG_GENERIC_CALIBRATE_DELAY) += calibrate.o
>
>  ifneq ($(CONFIG_ARCH_INIT_TASK),y)
>  obj-y                          += init_task.o
>  endif
>
> -mounts-y                       := do_mounts.o
> -mounts-$(CONFIG_BLK_DEV_RAM)   += do_mounts_rd.o
> -mounts-$(CONFIG_BLK_DEV_INITRD)        += do_mounts_initrd.o
> -mounts-$(CONFIG_BLK_DEV_MD)    += do_mounts_md.o
> -

Can't you keep the obj-$(CONFIG_*) syntax?
e.g.
obj-$(CONFIG_BLK_DEV_RAM) += do_mounts_rd.o
