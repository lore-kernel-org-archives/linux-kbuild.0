Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:48575 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750935AbaGPJoV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Jul 2014 05:44:21 -0400
Date: Wed, 16 Jul 2014 18:43:51 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH 3/6] samples: use uapiprogs support for seccomp
In-Reply-To: <1405276974-17323-3-git-send-email-sam@ravnborg.org>
References: <1405276974-17323-1-git-send-email-sam@ravnborg.org> <1405276974-17323-3-git-send-email-sam@ravnborg.org>
Message-Id: <20140716184351.AC2E.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, David Herrmann <dh.herrmann@googlemail.com>, Jiri Kosina <jkosina@suse.cz>

Hi Sam,


On Sun, 13 Jul 2014 20:42:51 +0200
Sam Ravnborg <sam@ravnborg.org> wrote:

> Reduce complexity of seccomp Makefile by introducing use of uapiprogs support.
> Build testet with i686 only.

tested ?

(Ditto in 4/6)



> --- a/samples/seccomp/Makefile
> +++ b/samples/seccomp/Makefile
> @@ -1,48 +1,4 @@
> -# kbuild trick to avoid linker error. Can be omitted if a module is built.
> -obj- := dummy.o
> +uapiprogs-$(CONFIG_SECCOMP_FILTER) := bpf-fancy dropper bpf-direct
>  
> -hostprogs-$(CONFIG_SECCOMP_FILTER) := bpf-fancy dropper bpf-direct
> +bpf-fancy-y := bpf-fancy.o bpf-helper.o
>  
> -HOSTCFLAGS_bpf-fancy.o += -I$(objtree)/usr/include
> -HOSTCFLAGS_bpf-fancy.o += -idirafter $(objtree)/include
> -HOSTCFLAGS_bpf-helper.o += -I$(objtree)/usr/include
> -HOSTCFLAGS_bpf-helper.o += -idirafter $(objtree)/include
> -bpf-fancy-objs := bpf-fancy.o bpf-helper.o
> -



I am interested in this series.

Forgive me if I am asking a stupid question..


How can I build hostprogs for the same host as the kernel?
(I mean, how can I override $(HOSTCC) for cross-compiling ?)


Best Regards
Masahiro Yamada

