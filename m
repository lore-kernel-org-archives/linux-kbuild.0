Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:44026 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752371Ab3FNOFB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jun 2013 10:05:01 -0400
Date: Fri, 14 Jun 2013 13:58:39 +0000
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH v5 0/4] deb-pkg: bring it a little closer to debian
 packaging
Message-ID: <20130614135839.GM23955@vostochny.stro.at>
References: <1371203217-19572-1-git-send-email-anisse@astier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1371203217-19572-1-git-send-email-anisse@astier.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>

On Fri, Jun 14, 2013 at 11:46:53AM +0200, Anisse Astier wrote:
> These little fixes should bring debian packaging closer to the way it's done in debian.
> 
> Changes in:
> v2:
>  - only build debug packages when CONFIG_DEBUG_INFO=y
>  - build debug package last.
>  - more verbose debug package description
>  - put package in section debug
> v3:
>  - remove duplicate code from v2
> v4:
>  - fixes thanks to Ben Hutchings' review
>  - use KCONFIG_CONFIG instead of .config
>  - use installed path specific to each architecture instead of hard-coded
>    /boot/vmlinuz-$version, based on
>    http://anonscm.debian.org/viewvc/kernel/dists/wheezy/linux/debian/rules.real?view=markup
> v5:
>  - fixes thanks to Ben Hutchings' review
>  - don't use $objtree as it's redundant in build scripts
>  - add symbolic links to vmlinux to work with other tools than perf
>  - pick-up reviewed-by from ml for patch 3 and 4
> 
> 
> Anisse Astier (4):
>   deb-pkg: use KCONFIG_CONFIG instead of .config file directly
>   deb-pkg: split debug symbols in their own package
>   deb-pkg: fix installed image path on parisc, mips and powerpc
>   deb-pkg: add a hook argument to match debian hooks parameters
> 
>  scripts/package/builddeb | 91 ++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 76 insertions(+), 15 deletions(-)

Thanks, whole series seems good to me,
Acked those that seem really worthwile.
Thanks for caring of parisc and stuff.

Rereading, I didn't see the motivation for the last change,
explained in the commit message?
IRC this distinction was done on purpose to allow distribution
specific linux images to run different hooks.

-- 
maks
