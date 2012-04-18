Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:34201 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752524Ab2DRRFH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Apr 2012 13:05:07 -0400
Received: by wibhq7 with SMTP id hq7so910730wib.1
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Apr 2012 10:05:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4F8E93A7.1070307@imgtec.com>
References: <4F8E93A7.1070307@imgtec.com>
Date: Wed, 18 Apr 2012 13:05:06 -0400
Message-ID: <CACqU3MWsZRhuZ4WrK5UQE4ZBUBT9tcR=dnmHKvm5GGjgF+U3yA@mail.gmail.com>
Subject: Re: [BUG] savedefconfig results in different .config
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-kbuild@vger.kernel.org, Will <will.newton@imgtec.com>

Hi,

On Wed, Apr 18, 2012 at 6:12 AM, James Hogan <james.hogan@imgtec.com> wrote:
> Hi,
>
> Is it a bug in kbuild if I have a .config produced by make menuconfig,
> use savedefconfig to create a compact config file, and the defconfig
> produces a different .config to the original .config file?
>
> I've attached a simple Kconfig patch based on v3.4-rc3 to help reproduce
> it (easier than finding another example of it), and an initial .config:
>
> $ git apply defconfig_problem.patch
> $ cp defconfig_problem_in.config .config
> $ make oldconfig
> $ make savedefconfig
> $ cp defconfig arch/x86/configs/my_defconfig
> $ make my_defconfig
>
> finally:
>
> $ diff -U0 .config defconfig_problem_in.config
> --- .config     2012-04-18 11:04:59.631964466 +0100
> +++ defconfig_problem_in.config 2012-04-18 10:43:44.423896052 +0100
> @@ -1685 +1685 @@
> -CONFIG_USB_GADGET_DWC_OTG=m
> +CONFIG_USB_GADGET_DWC_OTG=y
>
I would assume there is something wrong with kconfig. That would not
surprise me. That said, for the sake of asking, which tree are you
playing with ? There is no such USB_GADGET_DWC_OTG in Linus' tree:

% git describe
v3.4-rc3
% git grep USB_GADGET_DWC_OTG
%

Thanks,
 - Arnaud

> CONFIG_USB_GADGET_DWC_OTG is part of a tristate choice, and it doesn't
> happen if CONFIG_USB_DWC_OTG=n (which depends on CONFIG_USB_GADGET_DWC_OTG).
>
> Is it a bug or is something wrong with the dependencies in the Kconfig
> files?
>
> Thanks
> James
