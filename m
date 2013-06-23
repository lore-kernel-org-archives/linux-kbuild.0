Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53866 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752373Ab3FWU3X (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 23 Jun 2013 16:29:23 -0400
Message-ID: <51C75A9F.4080401@suse.cz>
Date: Sun, 23 Jun 2013 22:29:19 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v6] kbuild: fix error when building from src rpm
References: <20130607162533.19157.25779.stgit@phlsvslse11.ph.intel.com>
In-Reply-To: <20130607162533.19157.25779.stgit@phlsvslse11.ph.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Marciniszyn <mike.marciniszyn@intel.com>
Cc: linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

Hi Mike, sorry for the late feedback.

Dne 7.6.2013 18:25, Mike Marciniszyn napsal(a):
> The following issue can be reproduced with Linus' tree on
> and x86_64 server.
> 
>> + cp /home/user/rpmbuild-test/BUILDROOT/kernel-3.9.2.x86_64/boot/vmlinuz-3.9.2
>> cp: missing destination file operand after
>> /home/user/rpmbuild-test/BUILDROOT/kernel-3.9.2-1.x86_64/boot/vmlinuz-3.9.2'
>> Try `cp --help' for more information.
>> error: Bad exit status from /var/tmp/rpm-tmp.R4o0iI (%install)
> 
> Here are the commands to reproduce:
> 
> make defconfig
> make rpm-pkg
> 
> Use the resulting src rpm to build as follows:
> 
> mkdir ~/rpmbuild-test
> cd ~/rpmbuild-test
> rpmbuild --rebuild --define "_topdir `pwd`" -vv ~/rpmbuild/SRPMS/kernel-3.10.0_rc1+-1.src.rpm
> 
> The issue is because the %install script uses $KBUILD_IMAGE and it hasn't
> been set since it is only available in the kbuild system and not in the
> %install script.
> 
> This patch adds a Makefile target to emit the image_name that can be used
> and modifies the mkspec to use the dynamic name in %install.
> 
> Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
> ---
>  Makefile               |    6 ++++++
>  scripts/package/mkspec |    1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index cd11e88..5b2217c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1275,6 +1275,12 @@ clean: $(clean-dirs)
>  		-o -name modules.builtin -o -name '.tmp_*.o.*' \
>  		-o -name '*.gcno' \) -type f -print | xargs rm -f
>  
> +# For probing for image name
> +# ---------------------------------------------------------------------------
> +.PHONY += image_name

The variable name is without the leading dot.


> +image_name: FORCE
> +	@echo $(KBUILD_IMAGE)

There is no need for FORCE, after you properly mark the target as phony.
Also, please move it next to the similar 'kernelrelease' and
'kernelversion' targets.

Michal
