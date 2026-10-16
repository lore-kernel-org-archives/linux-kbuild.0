Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812543403FF;
	Fri, 16 Oct 2026 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160528; cv=none; b=F30io15B5v1qDzbyuVdb5fMZfbvnE+bw7PUG+14WvcCLI6jqXduNR0loESwbEqv686T+YTLJmybIZ8iBPZo46Bx7mOAGBnJTAo2j/hgnllJeq51ApqOerwTgrTb38pvR7FDDso4JK+9q1YiOacdUrFQ7BeYsEY8O/sDquIEyOZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160528; c=relaxed/simple;
	bh=t8dMX8i60cqgxm3Kkq/I2tAcGNfMb28GLsRh5wzRTAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTmzkKKuxPNlavceFo6siltwn+dFjlzUNvW/xIuqSjbCy//MVdLpyqz4upiNtIxLu52PBbdQYv3y7lPb8SDhhuPk4qznASVoYdO8liOzV0guSKHl0oIYz/qwvVE4j8qKbhX99Q4b0UIL7ucwzXS96I7/dnYTb9UKr8hypWzbLBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=oASl/Bd5; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="oASl/Bd5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1792160523; bh=t8dMX8i60cqgxm3Kkq/I2tAcGNfMb28GLsRh5wzRTAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oASl/Bd5G3k5f5ECCNh9GXixRgeWk0nSMr8IPbGX0b+zvmbf9u2n53hNv9A03Zezx
	 BIb4tfIYjZVmrvodRFd9MgLDWW5I7YPCcenLipGo/Saek2js03/TqCPeDoDR3oAB9Z
	 x8cl33DDCIAzH/kLkPNPT6BM/aQe5qlHs1DctMEnYS1IF0k61UCXthCCsCgLE0YGOp
	 +/qdFOwcXLF8yFryP9599jtFZRHr5C7JxqY81LyzvzrLlkzG+1zT9ujVV9WG6LRMvr
	 rgXt3jj9p5WksnYl5LjKhEPfDT638r7ESUcLT4ReRaHm5u7ksgyamc1xovGQnd/eVi
	 OBeI7rw/4lmzA==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ad2330a-c83a-7f0000032729-7f000001ddb4-1
	for <multiple-recipients>; Fri, 16 Oct 2026 16:22:02 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 16 Oct 2026 16:22:02 +0200 (CEST)
Date: Fri, 16 Oct 2026 16:22:01 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: =?utf-8?B?QWRyacOhbiBHYXJjw61h?= Casado <adriangarciacasado42@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: depmod: fallback to
 /boot/System.map-KERNELRELEASE
Message-ID: <20261016-lyrical-original-woodlouse-3cfb2c@l-nschier-aarch64>
References: <20261016111106.221542-1-adriangarciacasado42@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261016111106.221542-1-adriangarciacasado42@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1792160522-C3FE1515-4143D72E/0/0
X-purgate-type: clean
X-purgate-size: 2480
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 23C7CA0432  external: no

On Fri, Oct 16, 2026 at 01:11:06PM +0200, Adrián García Casado wrote:
> When installing external modules (M=...) against packaged kernel headers
> such as linux-headers built via 'make bindeb-pkg', ${objtree}/System.map
> is absent because System.map is located in:
> /boot/System.map-${KERNELRELEASE}
> 
> Currently, scripts/depmod.sh only checks ${objtree}/System.map and skips
> running depmod with a warning, leaving newly installed out-of-tree
> modules unindexed in modules.dep.
> 
> Fall back to ${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE} when
> ${objtree}/System.map is not readable so that depmod runs properly
> during external module installation.
> 
> Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
> ---
>  scripts/depmod.sh | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/depmod.sh b/scripts/depmod.sh
> index 3c34fecac..d6d1b9547 100755
> --- a/scripts/depmod.sh
> +++ b/scripts/depmod.sh
> @@ -12,9 +12,14 @@ KERNELRELEASE=$1
>  
>  : ${DEPMOD:=depmod}
>  
> -if ! test -r "${objtree}/System.map" ; then
> -	echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
> -	exit 0
> +system_map="${objtree}/System.map"
> +if ! test -r "${system_map}" ; then
> +	if test -r "${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE}" ; then
> +		system_map="${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE}"
> +	else
> +		echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
> +		exit 0
> +	fi
>  fi
>  
>  # legacy behavior: "depmod" in /sbin, no /sbin in PATH
> @@ -25,7 +30,7 @@ if [ -z $(command -v $DEPMOD) ]; then
>  	exit 0
>  fi
>  
> -set -- -ae -F "${objtree}/System.map"
> +set -- -ae -F "${system_map}"
>  if test -n "$INSTALL_MOD_PATH"; then
>  	set -- "$@" -b "$INSTALL_MOD_PATH"
>  fi
> -- 
> 2.39.5
> 

Thanks for report and patch.

For the record, this is what I can find in Debian's Linux packages:

Debian puts a dummy System.map to /lib/modules/$(KERNELVER)/System.map 
(linux-image-$(KVER)-$(DEBVER)-$(ARCH).deb) and the real System.map is 
only available in linux-image-$(KVER)-$(DEBVER)-$(ARCH)-dbg package 
at /usr/lib/debug/lib/modules/$(KVER)-$(ARCH)/System.map.

So, do we need a valid System.map for out-of-tree modules?

At a first glance, you patch looks good to me.  But lets way some days 
for other feedback.

Kind regards,
Nicolas
