Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx-rz-1.rrze.uni-erlangen.de ([131.188.11.20]:37384 "EHLO
	mx-rz-1.rrze.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750773AbcCJNHs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Mar 2016 08:07:48 -0500
In-Reply-To: 19064.1457367574@warthog.procyon.org.uk
From: Andreas Ziegler <andreas.ziegler@fau.de>
Subject: Re: Kconfig problem
Message-ID: <56E16F6A.10907@fau.de>
Date: Thu, 10 Mar 2016 13:58:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-kbuild@vger.kernel.org

Hi,

> Hi,
> 
> I'm having some problems with Kconfig - the dependency resolver seems to be
> getting things wrong.
> 
> I have an option:
> 
> 	config SYSTEM_TRUSTED_KEYRING
> 		bool "Provide system-wide ring of trusted keys"
> 		depends on KEYS
> 		depends on ASYMMETRIC_KEY_TYPE
> 
> which, as can be seen, depends on:
> 
> 	menuconfig ASYMMETRIC_KEY_TYPE
> 		tristate "Asymmetric (public-key cryptographic) key type"
> 		depends on KEYS
> 
> But I can set CONFIG_SYSTEM_TRUSTED_KEYRING=y and CONFIG_ASYMMETRIC_KEY_TYPE=m
> and the Kconfig processor is quite happy - but, of course, the kernel doesn't
> link.
> 
> Yes, I could set ASYMMETRIC_KEY_TYPE to be a bool, but if
> SYSTEM_TRUSTED_KEYRING is not set, there's no reason it couldn't be a module.
> 
> If I change the first option to:
> 
> 	config SYSTEM_TRUSTED_KEYRING
> 		bool "Provide system-wide ring of trusted keys"
> 		select KEYS
> 		select ASYMMETRIC_KEY_TYPE
> 
> then it complains that there's a dependency loop.
> [...]
> 
> If there's a dependency loop with select here, then there must be a dependency
> loop with depends on here too, since A selects B is a dependency of A on B,
> just as is A depends on B.
> 

no, selects are essentially defined as 'reverse dependencies' (see
Documentation/kbuild/kconfig-language.txt), which would translate to 'A selects
B is a dependency of B on A'. That way, if you modify the definition of
SYSTEM_TRUSTED_KEYRING like the following (there's no need to change the
dependency on KEYS, I think; even though there is a longer loop - the one you
posted in the original mail -, it's the same underlying problem):

config SYSTEM_TRUSTED_KEYRING
	bool "Provide system-wide ring of trusted keys"
	depends on KEYS
	select ASYMMETRIC_KEY_TYPE

then Kconfig sees the following loop (sorry for my ASCII drawing skills):

        select                                        select
        --------------- SYSTEM_TRUSTED_KEYRING <---------
        |                                               |
        v                                               |
ASYMMETRIC_KEY_TYPE                            KEXEC_BZIMAGE_VERIFY_SIG
        |                                               ^
        |                                               |
        ----------->  SIGNED_PE_FILE_VERIFICATION ------
        depends on                                    dep. on

In addition, it's important to be aware of the fact that selects do not care
about dependencies of the selected option (which I think makes them even harder
to understand...). select just forces the target option to a minimum value
(e.g., 'm' or 'y', if all selecting options are 'm', and 'y' if any selecting
option is 'y' itself).

In this particular case, the definition of KEXEC_BZIMAGE_VERIFY_SIG (in
arch/x86/Kconfig) additionally violates the rules from
Documentation/kbuild/kconfig-language.txt (Quote: "In general use select only
for non-visible symbols (no prompts anywhere) and for symbols with no
dependencies.), as SYSTEM_TRUSTED_KEYRING has a prompt _and_ depends on another
option, KEYS.

> Any thoughts on how to resolve this?
> 

Well, if you break the loop above (by changing the 'select' in
KEXEC_BZIMAGE_VERIFY_SIG to a 'depends on', which would make more sense
semantically), then selecting ASYMMETRIC_KEY_TYPE from SYSTEM_TRUSTED_KEYRING
would work and would enforce ASYMMETRIC_KEY_TYPE to be 'y' if
SYSTEM_TRUSTED_KEYRING is 'y', but that of course requires some arguing over
KEXEC_BZIMAGE_VERIFY_SIG.

To me it seems that people sometimes misuse 'select' to make the selection of
symbols "easier" for the user: If you use 'depends on', the user configuring the
kernel can only see the prompt if all dependencies are already fulfilled (which
might only be true a lot later in the configuration process, arch/x86/Kconfig is
evaluated a lot earlier than security/Kconfig - not a problem in menuconfig, but
e.g. in oldconfig). On the other hand, if you use 'select', Kconfig does show
the prompt and forces the selected symbol to be enabled.

Hope this clarifies things a bit...

Best regards,

Andreas

