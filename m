Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:60529 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760758Ab3BIQmM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 9 Feb 2013 11:42:12 -0500
Received: by mail-ob0-f174.google.com with SMTP id 16so4904432obc.33
        for <linux-kbuild@vger.kernel.org>; Sat, 09 Feb 2013 08:42:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAD=GYpa5OTy8Jd4Pevgabvc0J+mx6Ba+_K8iAsGPwD3Bc7hknw@mail.gmail.com>
References: <CAD=GYpa5OTy8Jd4Pevgabvc0J+mx6Ba+_K8iAsGPwD3Bc7hknw@mail.gmail.com>
Date: Sat, 9 Feb 2013 10:42:11 -0600
Message-ID: <CAD=GYpaRRUS5wH9HssVoNH=Ctxd9+ov6VAhxGhA57Q71C9zA2Q@mail.gmail.com>
Subject: Re: How to share variables with a sub-make command in a Kbuild Makefile?
From: Joel A Fernandes <agnel.joel@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Per the Mailing list FAQ, I would like to indicate that I prefer to be
CC'd on replies, thanks.

Thanks,
  Joel Fernandes

On Sat, Feb 9, 2013 at 10:34 AM, Joel A Fernandes <agnel.joel@gmail.com> wrote:
> Hi,
> I am trying to create a patch that involves a call to a submake and
> sharing a variable with it.
>
> The the top level Makefile is arch/arm/Makefile and has something like:
> dtbs: scripts
>    $(Q)$(MAKE) -e $(build)=$(boot)/dts MACHINE=$(MACHINE) dtbs
>    # Make use of share-var modified by the submake
>    echo $(share-var)
>
> In the sub-make Makefile, I want to modify a variable and have it
> reflect in the top Makefile
> dtbs: $(addprefix $(obj)/, $(dtb-y))
>    $(Q)rm -f $(obj)/../*.dtb
>    share-var += "new stuff"
>
> I tried exporting share-var from the top-level Makefile but it doesn't work.
> Is there an easy way to do this?
> How does the kernel do it with obj-y variables where it recursively
> has the variable updated?
>
> The reason I need this variable in the top-level Makefile is because
> there are other targets in the top-level Makefile (arch/arm/Makefile)
> that need access to this variable for its purpose.
>
> Thanks in advance,
>   Joel Fernandes
