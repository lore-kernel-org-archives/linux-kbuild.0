Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411D03314AE;
	Fri, 31 Jul 2026 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785526590; cv=none; b=lO300uoV3JwPi1xCDRB5x3Yp4HqSO6wHZf175GGKprQ9y1csCNf/EUcvNiM8WHkWZrE7LZFPjfUJd3UnI/MCSEk5Uldx3MU24gUzLrTNcd81Fy9Ynzn1m3cTjIhawzy4nCsYFODCAketrX3jKjVQaS57y4S+ebhgXxEYm7Qw8JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785526590; c=relaxed/simple;
	bh=QNV5A2UXKlk8CbB+i7b7XolK33UGzsvQwIcvYdo/ZKs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=DxjEulxLbwDTluD70iVWR2h/ezZ+GtpocIqTEOHF8BejaphWpcyqOxxFRLz4G8WKpl5Hw1AFncBAz45dZkR8XsQV5Lj1hRV/pyVRfNXON1SEpu9rOaVTmb0WIOE29JVUml2pDkv5DqE6PuAVtNBJ3StoHxiIvzx1SXp2oK5Fc9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgVJUJYV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgVJUJYV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46671F00AC4;
	Fri, 31 Jul 2026 19:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785526588;
	bh=TYe75eE/VoVNu1aNr+DZWxE9tNnF3J5Pen/XQ4HPV+4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kgVJUJYVMb8GbvXwPnP2UivIbzImAxMEtMYSO7wm2b9vkGfXKuFeChnhGF0TgfSkC
	 KxMoFKONBdeMy1qAs5zCp3nzmKRIdFhZxsNtObbDqmE++h2YM4mLvwa8J+4b8jlTxM
	 gNb46mbdZoKQwcBjdurHBDCrdXOyOpB13x2wSnL5Ugq7XLBigMqe8+me9GVUc/mYCE
	 dqq1y/u8KH/tg5HpWHsJ9ZfNwQPwihX+0DN7vPK0QTLmV6YztHw88VaKZrKrZpmWEI
	 +BeySdu6gIrerIpiqa/9G2ildlz37SdAUf7CsrzN35lCYv6E15WrcAoXqq2OjbVok+
	 yRB2WT5PxndnQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh
 to scripts/
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Askar Safin <safinaskar@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
In-Reply-To: <20260720-move-gen_init_cpio-to-scripts-v2-2-26b7e15c7133@kernel.org>
References: <20260720-move-gen_init_cpio-to-scripts-v2-0-26b7e15c7133@kernel.org>
 <20260720-move-gen_init_cpio-to-scripts-v2-2-26b7e15c7133@kernel.org>
Date: Fri, 31 Jul 2026 12:36:19 -0700
Message-Id: <178552657997.3004192.6811032535007922482.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2997; i=nathan@kernel.org;
 h=from:subject:message-id; bh=QNV5A2UXKlk8CbB+i7b7XolK33UGzsvQwIcvYdo/ZKs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFk5P61lzh/JljWvmeNvfPF+5OsEKbsZZ26tcTux7GJQx
 0SelVGNHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAibc2MDEf7Tjp2+xUYh78R
 2XnJOijqW77i93+yi/73MPz7s+FwwkNGhoPZLtmTogTmRZifFevar7A7+MrZji2bVkdvzrvatfL
 CMSYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> diff --git a/usr/gen_init_cpio.c b/scripts/gen_init_cpio.c
> similarity index 100%
> rename from usr/gen_init_cpio.c
> rename to scripts/gen_init_cpio.c
> diff --git a/usr/gen_initramfs.sh b/scripts/gen_initramfs.sh
> similarity index 99%
> rename from usr/gen_initramfs.sh
> rename to scripts/gen_initramfs.sh
> index 7eba2fddf0ef..27ac1fd48001 100755
> --- a/usr/gen_initramfs.sh
> +++ b/scripts/gen_initramfs.sh

The cpio commmand in scripts/Makefile.package needs an update for this
move, otherwise modules-cpio-pkg will be broken.

Additionally, I see a number of references to "usr/gen_init" even after
this is applied:

$ git grep usr/gen_init
Documentation/driver-api/early-userspace/early_userspace_support.rst:usr/gen_init_cpio utility (run 'usr/gen_init_cpio -h' to get the
Documentation/driver-api/early-userspace/early_userspace_support.rst:usr/gen_init_cpio.
Documentation/driver-api/early-userspace/early_userspace_support.rst:usr/gen_initramfs.sh.  This means that CONFIG_INITRAMFS_SOURCE
Documentation/driver-api/early-userspace/early_userspace_support.rst:usr/gen_init_cpio file directives are output.  If a file is
Documentation/driver-api/early-userspace/early_userspace_support.rst:specified as an argument to usr/gen_initramfs.sh then the
Documentation/driver-api/early-userspace/early_userspace_support.rst:processed by usr/gen_init_cpio.
Documentation/driver-api/early-userspace/early_userspace_support.rst:See also 'usr/gen_initramfs.sh -h'.
Documentation/driver-api/early-userspace/early_userspace_support.rst:   into initramfs either via modifying usr/gen_init_cpio.c or via the new
Documentation/filesystems/ramfs-rootfs-initramfs.rst:Run "usr/gen_init_cpio" (after the kernel build) to get a usage message
Documentation/filesystems/ramfs-rootfs-initramfs.rst:usr/gen_initramfs.sh), and proceeds to package up that directory
Documentation/filesystems/ramfs-rootfs-initramfs.rst:using the config file (by feeding it to usr/gen_init_cpio, which is created
Documentation/filesystems/ramfs-rootfs-initramfs.rst:from usr/gen_init_cpio.c).  The kernel's build-time cpio creation code is
Documentation/filesystems/ramfs-rootfs-initramfs.rst:   explained in buffer-format.rst, created in usr/gen_init_cpio.c, and
scripts/remove-stale-files:rm -f usr/gen_init_cpio
scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py:        cmd = "sh ../usr/gen_initramfs.sh -o usr/initramfs_data.cpio -l usr/.initramfs_data.cpio.d    ../usr/default_cpio_list"
tools/testing/selftests/kho/vmtest.sh:        "$build_dir/usr/gen_init_cpio" "$tmp_dir/cpio_list" > "$initrd"
tools/testing/selftests/nolibc/Makefile.nolibc:        $(QUIET_GEN)echo 'file /init nolibc-test 755 0 0' | $(objtree)/usr/gen_init_cpio - > initramfs.cpio
usr/Kconfig:          "usr/gen_init_cpio" program in the kernel tree.

Otherwise, this seems reasonable to me. Feel free to carry

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

on the respin.

-- 
Cheers,
Nathan

