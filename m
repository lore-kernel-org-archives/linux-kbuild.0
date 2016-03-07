Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51244 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752930AbcCGQTg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Mar 2016 11:19:36 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id A40BE335E84
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Mar 2016 16:19:35 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
Subject: Kconfig problem
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <19063.1457367574.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: 8BIT
Date: Mon, 07 Mar 2016 16:19:34 +0000
Message-ID: <19064.1457367574@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: dhowells@redhat.com

Hi,

I'm having some problems with Kconfig - the dependency resolver seems to be
getting things wrong.

I have an option:

	config SYSTEM_TRUSTED_KEYRING
		bool "Provide system-wide ring of trusted keys"
		depends on KEYS
		depends on ASYMMETRIC_KEY_TYPE

which, as can be seen, depends on:

	menuconfig ASYMMETRIC_KEY_TYPE
		tristate "Asymmetric (public-key cryptographic) key type"
		depends on KEYS

But I can set CONFIG_SYSTEM_TRUSTED_KEYRING=y and CONFIG_ASYMMETRIC_KEY_TYPE=m
and the Kconfig processor is quite happy - but, of course, the kernel doesn't
link.

Yes, I could set ASYMMETRIC_KEY_TYPE to be a bool, but if
SYSTEM_TRUSTED_KEYRING is not set, there's no reason it couldn't be a module.

If I change the first option to:

	config SYSTEM_TRUSTED_KEYRING
		bool "Provide system-wide ring of trusted keys"
		select KEYS
		select ASYMMETRIC_KEY_TYPE

then it complains that there's a dependency loop.

	scripts/kconfig/conf  --silentoldconfig Kconfig
	crypto/Kconfig:15:error: recursive dependency detected!
	For a resolution refer to Documentation/kbuild/kconfig-language.txt
	subsection "Kconfig recursive dependency limitations"
	crypto/Kconfig:15:	symbol CRYPTO is selected by TRUSTED_KEYS
	For a resolution refer to Documentation/kbuild/kconfig-language.txt
	subsection "Kconfig recursive dependency limitations"
	security/keys/Kconfig:51:	symbol TRUSTED_KEYS depends on KEYS
	For a resolution refer to Documentation/kbuild/kconfig-language.txt
	subsection "Kconfig recursive dependency limitations"
	security/keys/Kconfig:5:	symbol KEYS is selected by SYSTEM_TRUSTED_KEYRING
	For a resolution refer to Documentation/kbuild/kconfig-language.txt
	subsection "Kconfig recursive dependency limitations"
	certs/Kconfig:17:	symbol SYSTEM_TRUSTED_KEYRING is selected by KEXEC_BZIMAGE_VERIFY_SIG
	For a resolution refer to Documentation/kbuild/kconfig-language.txt
	subsection "Kconfig recursive dependency limitations"
	arch/x86/Kconfig:1815:	symbol KEXEC_BZIMAGE_VERIFY_SIG depends on KEXEC_VERIFY_SIG
	For a resolution refer to Documentation/kbuild/kconfig-language.txt
	subsection "Kconfig recursive dependency limitations"
	arch/x86/Kconfig:1804:	symbol KEXEC_VERIFY_SIG depends on KEXEC_FILE
	For a resolution refer to Documentation/kbuild/kconfig-language.txt
	subsection "Kconfig recursive dependency limitations"
	arch/x86/Kconfig:1791:	symbol KEXEC_FILE depends on CRYPTO
	warning: (EXT4_ENCRYPTION && F2FS_FS_ENCRYPTION && EVM) selects ENCRYPTED_KEYS which has unmet direct dependencies (KEYS)
	warning: (MAC802154 && EXT4_ENCRYPTION && F2FS_FS_ENCRYPTION) selects CRYPTO_CTR which has unmet direct dependencies (CRYPTO)
	warning: (MODULE_SIG_SHA224 && MODULE_SIG_SHA256 && BT && LUSTRE_FS && EXT4_ENCRYPTION && F2FS_FS_ENCRYPTION && CIFS && ENCRYPTED_KEYS) selects CRYPTO_SHA256 which has unmet direct dependencies (CRYPTO)


If there's a dependency loop with select here, then there must be a dependency
loop with depends on here too, since A selects B is a dependency of A on B,
just as is A depends on B.

Any thoughts on how to resolve this?

David
