Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56825 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756719Ab1EYMaE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 May 2011 08:30:04 -0400
Message-ID: <4DDCF64B.2030802@suse.cz>
Date: Wed, 25 May 2011 14:30:03 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: kernel build issue whith "make tar-pkg" with INSTALL_FW_PATH
 [patch included]
References: <20110524202935.CF171D602BD@dd12738.kasserver.com>
In-Reply-To: <20110524202935.CF171D602BD@dd12738.kasserver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Maximilian Pasternak <m.kbuild@bluescreen.de>
Cc: linux-kbuild@vger.kernel.org

On 24.5.2011 22:29, Maximilian Pasternak wrote:
> building a kernel package with
> | make tar-pkg INSTALL_FW_PATH=/somewhere
>
>
> Expected result:
> ----------------
> * tar-archive including the firmware in folder /somehere

I don't think that this should be supported, the firmware needs to be 
installed below /lib/firmware, which is where udev expects it.


> Makefile:
> | # Firmware install
> | INSTALL_FW_PATH=$(INSTALL_MOD_PATH)/lib/firmware
                       ^^^^^^^^^^^^^^^^
> | export INSTALL FW PATH
>   ...
> | firmware_install: FORCE
> | @mkdir -p $(objtree)/firmware
> | $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.fwinst obj=firmware
> __fw_install
>
> Here INSTALL_MOD_PATH is not considered but is needed for packageing.

Why do you think that INSTALL_MOD_PATH is not considered?


> Potential fix:
> --------------
>
> --- BEGIN PATCH -------------------------------------------------------
> diff -ur linux-2.6.38_orig/Makefile linux-2.6.38/Makefile
> --- linux-2.6.38_orig/Makefile 2011-03-13 18:24:19.000000000 +0200
> +++ linux-2.6.38/Makefile 2011-03-13 18:31:05.000000000 +0200
> @@ -1028,8 +1028,9 @@
>
> #
> ---------------------------------------------------------------------------
> # Firmware install
> -INSTALL_FW_PATH=$(INSTALL_MOD_PATH)/lib/firmware
> -export INSTALL_FW_PATH
> +INSTALL_FW_PATH=/lib/firmware
> +INSTALL_FW_TO_PATH=$(INSTALL_MOD_PATH)$(INSTALL_FW_PATH)
> +export INSTALL_FW_TO_PATH

You're changing the semantics of INSTALL_FW_PATH, breaking it for people 
who might have been using it. BTW, the patch is corrupt, spaces before 
context lines are missing and long lines are broken.

Michal
