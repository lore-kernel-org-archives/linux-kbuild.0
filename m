Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39026 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932087Ab3HMUcG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Aug 2013 16:32:06 -0400
Message-ID: <520A97C1.6000708@suse.cz>
Date: Tue, 13 Aug 2013 22:32:01 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: 32bit allyesconfig on 64bit system broke
References: <20130809225736.GG19750@two.firstfloor.org>
In-Reply-To: <20130809225736.GG19750@two.firstfloor.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kbuild@vger.kernel.org

Dne 10.8.2013 00:57, Andi Kleen napsal(a):
> 
> % linux32 make allyesconfig
> % head .config
> % head .config
> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86 3.11.0-rc4 Kernel Configuration
> #
> CONFIG_64BIT=y
> CONFIG_X86_64=y
> CONFIG_X86=y
> 
> This used to work to give me a 32bit allyesconfig.
> How am I supposed to do this now?

This changed in ffee0de (x86: Default to ARCH=x86 to avoid overriding
CONFIG_64BIT). The default $ARCH value on both ix86 and x86_64
buildhosts is "x86" and CONFIG_64BIT is therefore a user-selectable
knob. You can do

  make ARCH=i386 allyesconfig

to force 32bit. Or the generic way:

  echo '# CONFIG_64BIT is not set' >base.config
  KCONFIG_ALLCONFIG=base.config linux32 make allyesconfig

Michal
