Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:41247 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758005Ab3BIQem (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 9 Feb 2013 11:34:42 -0500
Received: by mail-ob0-f180.google.com with SMTP id ef5so4775640obb.39
        for <linux-kbuild@vger.kernel.org>; Sat, 09 Feb 2013 08:34:41 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 9 Feb 2013 10:34:41 -0600
Message-ID: <CAD=GYpa5OTy8Jd4Pevgabvc0J+mx6Ba+_K8iAsGPwD3Bc7hknw@mail.gmail.com>
Subject: How to share variables with a sub-make command in a Kbuild Makefile?
From: Joel A Fernandes <agnel.joel@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,
I am trying to create a patch that involves a call to a submake and
sharing a variable with it.

The the top level Makefile is arch/arm/Makefile and has something like:
dtbs: scripts
   $(Q)$(MAKE) -e $(build)=$(boot)/dts MACHINE=$(MACHINE) dtbs
   # Make use of share-var modified by the submake
   echo $(share-var)

In the sub-make Makefile, I want to modify a variable and have it
reflect in the top Makefile
dtbs: $(addprefix $(obj)/, $(dtb-y))
   $(Q)rm -f $(obj)/../*.dtb
   share-var += "new stuff"

I tried exporting share-var from the top-level Makefile but it doesn't work.
Is there an easy way to do this?
How does the kernel do it with obj-y variables where it recursively
has the variable updated?

The reason I need this variable in the top-level Makefile is because
there are other targets in the top-level Makefile (arch/arm/Makefile)
that need access to this variable for its purpose.

Thanks in advance,
  Joel Fernandes
