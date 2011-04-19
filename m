Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:56113 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751889Ab1DSG6J (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Apr 2011 02:58:09 -0400
Message-ID: <4DAD327B.4030904@suse.cz>
Date: Tue, 19 Apr 2011 08:58:03 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: LOCALVERSION in setlocalversion
References: <BANLkTikYuYVvXiHvi_kr2H7n29k=veThtw@mail.gmail.com>
In-Reply-To: <BANLkTikYuYVvXiHvi_kr2H7n29k=veThtw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 19.4.2011 08:42, Haojian Zhuang wrote:
> In scripts/setlocalversion under linux kernel tree, the scripts seems
> a little strange.
[...]
>         # append a plus sign if the repository is not in a clean
>         # annotated or signed tagged state (as git describe only
>         # looks at signed or annotated tags - git tag -a/-s) and
>         # LOCALVERSION= is not specified
>         if test "${LOCALVERSION+set}" != "set"; then
>                 scm=$(scm_version --short)
>                 res="$res${scm:++}"
>         fi
> fi
> 
> LOCALVERSION isn't assigned in any place. Only CONFIG_LOCALVERSION
> can be assigned in .config file.
> Why do we need to check LOCALVERSION at here?

It can be set on the commandline:

make LOCALVERSION=something

Michal
