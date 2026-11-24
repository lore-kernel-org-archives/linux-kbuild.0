Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795492787;
	b=eW8hcHA0hoGpfy2odSOCsbR2g8qDC9NbRJGHQOprThNV3SnSvprYfYDoQ+T9whKS95e0
	 l727SpdwPMM+paFtSn36BQvLMPLPKVALNqHkgICWFJDn/afLdg+2gBi4Xawx2CMQpQmQ1
	 aqXqbItMv1Yh6gRIq9jU47CN8fMrBXicCoamS64b0AoQj9D5SN9LUujXOXz2jzGziKmHY
	 1C4j3G3h3h5eMFzNT0rg5MHctw9tJNQYtn3UU5K6VD/iRb6b1uzaa7R7dGURVJ9FaMvMl
	 uttB4Kl7XuFhKaw3oEa+WZgsR+1oxQO3y1fCWun0T4lnLRWvY8txyJSVmEtdoPjOFcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492787;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=D5LeOMqsJtStfPtah2unndSv6bQPxqZYjgEqECB3thM=;
	b=iU7zi4cImz5kgLBmvsocILOjML7JS+Xj1SxXGqS2RTmKhUlUm88DLbscSwHJ3Z3HS8Du
	 EScvCVvN2XNuKwBK6RoaD/3g4g5Aby9Mbzfoi0+EvBTGsX1kkXqJXOSYBMZyS42jVaGUG
	 rfMNEEVcmVDcEsSniWagN4LsXAPCsNlAWaqxvOQiklnIzhYu5T27F4E5drxKyTjIQEYIK
	 OEMJPA3kA46shftonyXa9dqAvLMn1BpERIp8INB/AvHmeLcaNXH9hTNKGQgqQ1puYgK6+
	 WRXjWhfvNRZziWp8B6MuA27Qzditkuy+mzPKa7AUf9o3g8EnKDtt9ByEE0miUHgpvoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQEkO3Io;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22117606A33A;
	Tue, 24 Nov 2026 03:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQEkO3Io
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754431F000CF;
	Tue, 24 Nov 2026 03:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795492786;
	bh=D5LeOMqsJtStfPtah2unndSv6bQPxqZYjgEqECB3thM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LQEkO3Io+NWWzI6HqfHv1pePR5pVKKy1znmGzqHLrOlgfaunV1+Uk3YI9aoGZ0hLz
	 igLCHBJNm43KSCBxi1l1SCT4xhKAJti6H6/iE9Scv17VOnLhFu291VWq4eiB1mpEjA
	 EvYzpU6W8FiFIJ154V8aKwRuEqe/rZEPS82NoRbgdNbARlBoMgC1bdZnOZ0CyPHM40
	 tO9CLpXynrqocCFPaMI4c5XCZ5h7rUUo+lo0b5ndVRG0DsysX0fWM0lcV1FKHRSob1
	 apOOVMxoce7t0pXbKFuL+8XRyC0rXPAWuAjPkfEXihNR8ODzRAU/QGMfi+R4rz9juD
	 cMIKOhhpNtgjA==
Date: Mon, 23 Nov 2026 20:59:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: chenhuacai@kernel.org, linux-kbuild@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH RFC] kbuild: deb-pkg: strip orphaned debug labels from
 LoongArch modules
Message-ID: <20261124035942.GB2738970@ax162>
References: <E73BE2D8A39F2EBF+20261123121554.2559667-2-guanwentao@uniontech.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E73BE2D8A39F2EBF+20261123121554.2559667-2-guanwentao@uniontech.com>

On Mon, Nov 23, 2026 at 08:15:55PM +0800, Wentao Guan wrote:
> With CONFIG_DEBUG_INFO, gcc emits .L-prefixed labels for function and
> block boundaries and for location views (.LVL, .LBI, .LBB, .LFB, .LPFE),
> and the assembler keeps them in .symtab as long as a debug section
> references them.  On x86-64 those references are expressed as a section
> symbol plus an addend and the labels are discarded, but the LoongArch
> assembler has to name them in relocations:
> 
>     0000000000000057 R_LARCH_64          .LFB1 + 0
>     0000000000000015 R_LARCH_ADD_ULEB128 .LVL0 + 0
> 
> so they end up in the object's symbol table.
> 
> INSTALL_MOD_STRIP=1 expands to "strip --strip-debug", which is a section
> operation: it drops .debug_* and .rela.debug_* but leaves the symbol
> table alone, so every label that was only referenced from debug data
> stays behind as an orphan.  On 7.2.2-loong64-desktop-rolling 86.7% of the
> roughly 3M module symbols are such labels.  Nothing uses them at run time,
> yet they cost 22% of the module payload (168 MB -> 130 MB) and 19% of the
> linux-image package (195 MB -> 157 MB).  This is the same problem
> commit ac031f26e89cc ("kbuild: add option for stripping modules while
> installing them") addressed for the general debug-info case.
> 
> Strip them with --discard-locals as well.  binutils removes a local
> symbol only when its name still follows the assembler's local label
> convention (.L, .., _.L_ and the L<digits> pseudo labels) *and* no
> relocation in the output still names it: mark_symbols_used_in_relocations()
> sets BSF_KEEP on every relocation target and filter_symbols() keeps those
> unconditionally.  What the module loader needs therefore survives -- the
> relocation set of every module is byte-for-byte identical before and
> after, .LC, .LPFE and the -fpatchable-function-entry labels stay, exactly
> one SHT_SYMTAB remains as elf_validity_cache_index_sym() requires, and
> the modules are still signed, because modules_install strips before it
> signs.  The dbg package is built from the unstripped modules in the build
> tree, so it keeps all debug information.
> 
> Restrict this to LoongArch on a GNU toolchain, everyone else keeps
> INSTALL_MOD_STRIP=1.  Other architectures never see these labels: on
> x86-64 the option drops two unreferenced .LC symbols out of an amdgpu.ko
> and leaves all 429,648 relocations alone, so there is nothing to gain
> there.  LLVM builds have to keep the plain option, because
> kbuild hands the same value to llvm-strip for LLVM=1 and llvm-strip
> refuses to strip a symbol that a relocation still names, aborting the
> build, while clang does emit such labels for string constants:
> 
>     llvm-strip: error: 'super.ko': not stripping symbol '.L.str.1'
>     because it is named in a relocation
> 
> Clang none the less generates none of the debug labels that make the
> package grow, so an LLVM build loses nothing by being left alone.
> 
> Boot tested with qemu-system-loongarch64 (EDK2 firmware, vmlinuz.efi,
> test modules loaded from the initramfs with finit_module()): modules
> stripped with --strip-debug, --discard-locals and --strip-unneeded all
> load with rc=0, while --strip-all is rejected with "module has no symbols
> (stripped?)".
> 
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> ---
>  scripts/package/builddeb | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index a806f5094da44..a355d65927115 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -35,7 +35,14 @@ install_linux_image () {
>  		${MAKE} -f ${srctree}/Makefile INSTALL_DTBS_PATH="${pdir}/usr/lib/linux-image-${KERNELRELEASE}" dtbs_install
>  	fi
>  
> -	${MAKE} -f ${srctree}/Makefile INSTALL_MOD_PATH="${pdir}" INSTALL_MOD_STRIP=1 modules_install
> +	mod_strip="1"
> +	if [ "${SRCARCH}" = loongarch ] &&
> +		"${STRIP:-strip}" --version 2>/dev/null | grep -qs "^GNU strip"; then
> +		mod_strip="--strip-debug --discard-locals"
> +	fi
> +
> +	${MAKE} -f ${srctree}/Makefile INSTALL_MOD_PATH="${pdir}" \
> +		INSTALL_MOD_STRIP="${mod_strip}" modules_install
>  	rm -f "${pdir}/lib/modules/${KERNELRELEASE}/build"
>  
>  	# Install the kernel
> -- 
> 2.47.3
> 

I don't like this patch. This feels like a generic problem that is being
stuffed in the wrong place. At the very least, this probably belongs in
scripts/Makefile.modinst rather than the Debian packaging. Furthermore,
are other architectures impacted by this? Is there a toolchain bug filed
for this?

-- 
Cheers,
Nathan
