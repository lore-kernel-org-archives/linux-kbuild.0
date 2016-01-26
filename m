Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:36917 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965930AbcAZNmX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jan 2016 08:42:23 -0500
Date: Tue, 26 Jan 2016 13:42:14 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC] scripts: make extract-vmlinux support ARM vmlinuz
Message-ID: <20160126134214.GN10826@n2100.arm.linux.org.uk>
References: <1453810236-2082-1-git-send-email-rogershimizu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453810236-2082-1-git-send-email-rogershimizu@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roger Shimizu <rogershimizu@gmail.com>
Cc: Michal Marek <mmarek@suse.com>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2016 at 09:10:36PM +0900, Roger Shimizu wrote:
> vmlinuz on ARM seems is not an ELF, so scripts/extract-vmlinux
> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
> index 5061abcc2540..d569eb8c8efe 100755
> --- a/scripts/extract-vmlinux
> +++ b/scripts/extract-vmlinux
> @@ -15,7 +15,15 @@ check_vmlinux()
>  	# Use readelf to check if it's a valid ELF
>  	# TODO: find a better to way to check that it's really vmlinux
>  	#       and not just an elf
> -	readelf -h $1 > /dev/null 2>&1 || return 1
> +	case "$2" in
> +	0|"")
> +		readelf -h $1 > /dev/null 2>&1 || return 1
> +		;;
> +	1|*)
> +	# For ARCH like ARM, vmlinux is not ELF, so we only do the check
> +	# when $2 is 0 or NULL

This comment seems to be misleading - I think you mean "vmlinuz" there,
or maybe "zImage" as the file is named in the kernel build tree to make
it clear what you're referring to.  "vmlinuz" is the name chosen by
distro installers.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
