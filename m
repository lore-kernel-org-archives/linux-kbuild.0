Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792647709;
	b=r6j4Jdj5DFHr1OEAmVa5bQ2TJX3HX/bSo0IKLU5X6HBqhqAKO8EHDKif7gS4un8fMTIq
	 V/jLnslCg1lJP/eTuoBpBHyUtnywxrflI5IrvOF7F4ckcy9Mhx3QzhOPoL73HmBSkziLJ
	 BpNHScOAmyFUsbZlUx/8VUhTBC3DAotEF264BgD/hRvvzgstGMo6EFnU6p7fnnXDp23Vf
	 u8m0UkldFhUyph/GUXm1dZaa5E9nuGwzhUEOy2vSIFKC39kbpZzBpB+5gElAy9QAq9sZ/
	 YFZjMqywgEKjRVlP8e0pIkChLzetSv0x0M1J9N7UUOe1wyzoh2LotnRVBb50uH7w8yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792647709;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pVPyH3GoZBrVKP0Ttqz+/rHi2Rfgtq7gjnCe7XfjZjw=;
	b=qq1hOgu5LgKON8PH9pJ4xT6hkjbRZgjTt92iS6+C1HNUJFMYkGqwx55fYxrCf4sWDmGV
	 H9wyZ3+a6wh1uMJc+wuO9PDaGkNmsRvJ15CIpLTR1VX01T4h9gKlkx6beGPz3+xsj4743
	 Nu88UUy0JGYfc9bW0ie8c/I/0VeDmmmSWcFmWhHJNfKMqMwGfHd2An2s78JnKI1KbPh+Q
	 aT5PS0dv9gAcx8U2qLpmOdgorGt9xs0a3+n2XqV6YfbiY092S5D9eAMFJeJb5gOKpTflE
	 m65Rfp3FDfs1AX7wIRgQErb9MDTANS0BRtIBhF6FERa/WrvAeJlmIP1T9wBffQOC+OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wkb+IYPK;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68750606A319;
	Thu, 22 Oct 2026 05:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68750606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wkb+IYPK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pVPyH3GoZBrVKP0Ttqz+/rHi2Rfgtq7gjnCe7XfjZjw=; b=Wkb+IYPKcmGAULpRkQRky0WaY+
	uH6s+FXiNNVvdIa4iiu3r/sEifPsAb4+TdwMbK8+bBT6q5bI6Ih7roTMWzWa/DfcdOJbwXjReS1ic
	OFpq8Vg1ZCLyqkvdrTjd8Uusonp8W9g1cHtqMoXDbUGQU5AzUEuEl/jugB9J16T/VjgNj+qy1bxRo
	QDXXRQ0UR2eSqojfz7BxsAiU8olQtK9leY5PEghxLjm/yulVaYoRpECY11HUW0j2ok7nZk3v65XcV
	SHkHOMCZZH6+QoNNvINg/E8wet8oTlvPxt5A+bB8wCVktUm8KAshkRVF3pVSqzzcA/U3ErHyArDuq
	Sy5Sr4Pg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlYT-0000000DPf8-3CQ0;
	Thu, 22 Oct 2026 05:41:33 +0000
Message-ID: <d57ce591-2399-4bd4-ae70-8fdabf63ae82@infradead.org>
Date: Wed, 21 Oct 2026 22:41:32 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] changes.rst: introduce 'Required for'-column
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kbuild@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-debuggers@vger.kernel.org, tools@linux.kernel.org,
 "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nicolas Schier <n.schier@fritz.com>
References: <20261007163736.3942745-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261007163736.3942745-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/7/26 9:37 AM, Manuel Ebner wrote:
> The optional tag isn't obvious nor defined. Therefore remove the tag and
> add column 'Required for' to make it easier to define the need for the tools.
> 
> CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> CC: Nicolas Schier <n.schier@fritz.com>
> ---
> If anybody has info to add to or refine the new column I would appreciate it a lot.
> Please forward this to list or people which can contribute to this patch.
> 
> There's also the option to remove the 'Command to check the version'-column
> and refer to scripts/ver_linux - and with this also removing the duplicated
> information-issue.
> 
> [v3]
>  Rearange column space of the table in order to add column instead of replacing column
>  add some requirements to the table
> 
> [v2]
>  Ditch footnotes in favor of a column
>  Replace 'Check Version Command'-column with optional-column
>  https://lore.kernel.org/all/20260831152523.638881-1-manuelebnerli@mailbox.org/
> 
> [v1]
>  https://lore.kernel.org/all/20260812122426.1636227-2-manuelebnerli@mailbox.org/
> ---
>  Documentation/process/changes.rst | 97 ++++++++++++++++---------------
>  1 file changed, 51 insertions(+), 46 deletions(-)
> 
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 28f2ca633..dafe0530f 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -1,13 +1,14 @@
>  .. _changes:
>  
> -Minimal requirements to compile the Kernel
> -++++++++++++++++++++++++++++++++++++++++++
> +Minimal requirements to interact with the Kernel
> +++++++++++++++++++++++++++++++++++++++++++++++++
>  
>  Intro
>  =====
>  
> -This document is designed to provide a list of the minimum levels of
> -software necessary to run the current kernel version.
> +This document is designed to provide a list of the minimum versions of
> +software necessary to change code, compile, install and boot the current
> +kernel version.
>  
>  This document is originally based on my "Changes" file for 2.0.x kernels
>  and therefore owes credit to the same people as that file (Jared Mauch,
> @@ -27,48 +28,52 @@ running a Linux kernel.  Also, not all tools are necessary on all
>  systems; obviously, if you don't have any PC Card hardware, for example,
>  you probably do not need to concern yourself with pcmciautils.
>  
> -====================== ===============  ========================================
> -        Program        Minimal version       Command to check the version
> -====================== ===============  ========================================
> -bash                   4.2              bash --version
> -bc                     1.06.95          bc --version
> -bindgen (optional)     0.71.1           bindgen --version
> -binutils               2.30             ld -v
> -bison                  2.0              bison --version
> -btrfs-progs            0.18             btrfs --version
> -Clang/LLVM (optional)  17.0.1           clang --version
> -e2fsprogs              1.41.4           e2fsck -V
> -flex                   2.5.35           flex --version
> -gdb                    7.2              gdb --version
> -GNU awk (optional)     5.1.0            gawk --version
> -GNU C                  8.1              gcc --version
> -GNU make               4.0              make --version
> -GNU tar                1.28             tar --version
> -GRUB                   0.93             grub --version || grub-install --version
> -gtags (optional)       6.6.5            gtags --version
> -iptables               1.4.2            iptables -V
> -jfsutils               1.1.3            fsck.jfs -V
> -kmod                   13               kmod -V
> -mcelog                 0.6              mcelog --version
> -mkimage (optional)     2017.01          mkimage --version
> -nfs-utils              1.0.5            showmount --version
> -openssl & libcrypto    1.0.0            openssl version
> -pahole                 1.26             pahole --version
> -pcmciautils            004              pccardctl -V
> -pigz (optional)        2.4              pigz --version
> -PPP                    2.4.0            pppd --version
> -procps                 3.2.0            ps --version
> -Python                 3.9.x            python3 --version
> -quota-tools            3.09             quota -V
> -Rust (optional)        1.85.0           rustc --version
> -Sphinx\ [#f1]_         3.4.3            sphinx-build --version
> -squashfs-tools         4.0              mksquashfs -version
> -udev                   081              udevadm --version
> -util-linux             2.10o            mount --version
> -xfsprogs               2.6.0            xfs_db -V
> -====================== ===============  ========================================
> -
> -.. [#f1] Sphinx is needed only to build the Kernel documentation
> +==============  ========  =======================  ========================================
> +    Program     Minimal      Command to check                  Required for
> +                version         the version
> +==============  ========  =======================  ========================================
> +bash            4.2       bash --version           general requirement
> +bc              1.06.95   bc --version             Kbuild (

Something missing after the '('?

> +bindgen         0.71.1    bindgen --version        CONFIG_RUST=y
> +binutils        2.30      ld -v
> +bison           2.0       bison --version          Kbuild (.config)
> +btrfs-progs     0.18      btrfs --version
> +Clang/LLVM      17.0.1    clang --version          alternative to GNU C (gcc)
> +e2fsprogs       1.41.4    e2fsck -V                ext4
> +flex            2.5.35    flex --version           Kbuild (.config)
> +gdb             7.2       gdb --version            Debugging
> +GNU awk         5.1.0     gawk --version           objtool, CONFIG_SYSTEM_BLACKLIST_HASH_LIST=y
> +GNU C           8.1       gcc --version            alternative to Clang/LLVM (clang)
> +GNU make        4.0       make --version
> +GNU tar         1.28      tar --version
> +GRUB            0.93      grub --version ||
> +                          grub-install --version
> +gtags           6.6.5     gtags --version          to generate tag files through ``make gtags``
> +iptables        1.4.2     iptables -V
> +jfsutils        1.1.3     fsck.jfs -V
> +kmod            13        kmod -V
> +mcelog          0.6       mcelog --version
> +mkimage         2017.01   mkimage --version        Flat Image Tree (FIT) or ARCH=arc, arm or powerpc
> +nfs-utils       1.0.5     showmount --version
> +openssl         1.0.0     openssl version
> +pahole          1.26      pahole --version
> +pcmciautils     004       pccardctl -V
> +pigz            2.4       pigz --version           Compile and boot with KPGZIP=y
> +PPP             2.4.0     pppd --version
> +procps          3.2.0     ps --version
> +Python          3.9.x     python3 --version
> +quota-tools     3.09      quota -V
> +Rust            1.85.0    rustc --version          CONFIG_RUST=y
> +Sphinx          3.4.3     sphinx-build --version   build kernel documentation
> +squashfs-tools  4.0       mksquashfs -version
> +udev            081       udevadm --version
> +util-linux      2.10o     mount --version
> +xfsprogs        2.6.0     xfs_db -V
> +==============  ========  =======================  ========================================
> +    Program     Minimal      Command to check                  Required for
> +                version      check the version
> +==============  ========  =======================  ========================================

On my build of 'make htmldocs', the table ending confuses docutils.
Did you build this with 'make htmldocs'?

Documentation/process/changes.rst:73: WARNING: Blank line required after table. [docutils]
Documentation/process/changes.rst:75: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/process/changes.rst:419: ERROR: Malformed table.
Bottom border or header rule does not match top border.

==============  ========  =======================  ========================================

...

Getting updated software
======================== [docutils]

-- 
~Randy

