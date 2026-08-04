Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1465535B63F
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Aug 2026 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854146; cv=none; b=nnzknOAOjYeo5gnPvCG/PwyV189bdUALEzC8xLirMKQit0IlhHs5fmYbkSBPrNLPotqQfdsZNN3LsM8aYB+b4M+FRISKIENgvHZD8LeTgJOR/BOTfD66N0ZKtoQo51tehm3SH1+qfdw5gQBHOl/LFts/I04QL05ib5Pdqni+WYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854146; c=relaxed/simple;
	bh=zOUelS0pMIkSw86ldd0Fr66CbePwG6q7ixQQxqjiZIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Or367sjiejXwnVSujD2qgZnq9Q99lUuPIsxvqq6nfJpyFu9YorVgL/rDNL8J8mKBMq+4fYlhS/yf/cAJmHbL2UOucaa08qqzGL42OQPsDKBAQeyyP/GfPDhbNVn5WOWwKZix3rgFL2y2CUp+iRFWGXqkATS7lIhci86yA8m2JWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Soyrprvt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Soyrprvt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954aff6088so30500265e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Aug 2026 07:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785854139; x=1786458939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGzdrEm4lOSBmLkCo/w5n2dBKIzcaKDjyn7eiI0qyZg=;
        b=SoyrprvtgZisG3nQ+aSomU6BD+j5j1iJ5RYQ/Xf6tT0gyE3aVe+PnNAz0zA/fXd8fu
         Q3P8whlXcOQFEZdrCbWqn3aFxvtc5H9r3Z5C9z+yZ89jGwWU/9+7h+Q7wQoY9RIAdxSn
         DIJGomE4eW8Un59F4AbrDPnwMqbsGfs8qDZHJssp0uh12FSPJcZvVnIDpok68xfjKkpg
         BPRFAvoM6UtPrIoy31ZI/Hf5jwAGjTApd7lhHT7C3PO29uE4r4bzKysqySSNJBXegp7h
         0XGl0t8mpHi2poM96gDjWjI9W9k2YS3izMRSNszH1hUJHZoxp6xfs8tvGNeQy2hEfsO8
         a00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785854139; x=1786458939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGzdrEm4lOSBmLkCo/w5n2dBKIzcaKDjyn7eiI0qyZg=;
        b=k7UWExdQYmAiAP2BaUsQl646Juf4xWB3GJmvPHSKsF5HypE8w/MEHz4oVzAfTYwvDr
         1DkkKiZH6IC6akCMEWgZ69oOMAj1qhXnFEwxYeWFgEMpMGerwX1TsYEfSLkIuBNUTGR3
         X/GL9oCluto+N1OccXr7ZV8WL07Ko9oeZE3XPgYDUxKekMAK2tXx8rKa74SrLxn3csp4
         ECZx4d1WPB4oFm4Dp1wznZKPFNjAVGAdApClncr/Nd2b7VU2oNIIB6Me/ayv27DbDLnD
         cPGRVI6oZCNfNAC/hVEdcIlcPVMsztG4s1v3Jy3HV/6XLcrv8SXGHEnzuLj3KouF9u5D
         qW8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrkUAmAtw6QwUnN3gyt9qtOGnqE1XJ67gGwNUOotmqT0OwTAWRsWVduJEZDIBH+N+z9aZtRK0M4NWfTJnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCl/oZH38OkHUbhtecorNKm90wL/ttmEyca/jYzGdGNEt3J4uK
	NvjbqG3puuxO78sITMBu6ALBViQNMfWvY7v8AhvTXek+wW2czkstC9823LWUA3OTLzQ=
X-Gm-Gg: AR+sD10cv//+bHihD4zj8WoDebjdRZ9uuPWK8oYoBA/DqEZUsmbCxp3usHwvIJ2SCqN
	4OrUqer7/e5FlN3hVzDoWQxNsu9IJM2zRmQkM5DJRxrl0xXFw7dwJhTYPRJS1JNcjkKo+MRpjyV
	ELSbUlTZUYLfpBC/gPvFTtcX7h8yS1j31t/N8zAIaIv+ISEdKpbbrxX8QoIGxjcNEd0Gc4nRPH3
	4+Zy/vhODI68X78PfNHK+wPXrob/XRH0Glg0Zhotg+QMM+CLmRfTdmlfl5+LSE+4sMqtRYGEkIW
	3y9dOj8n8jIV+ilXUnvu45TgR/+ODQDc0Us32wJt+YcH9FgPZVA8cGNaeGdAAAE+dLr8vyNtDTR
	/wuKR6m+P4OU6I4aorBw5JsSKj5KUQQy56/wMcOzAubX6kuEEIq1D8KO/I0Bp+vW8SHNSWy5zdg
	y+210hYQnRUa6q7pySP6DIT73GCAGsT7Wq7O5BHyQCW1WgfNi1HinY1Ph3aTouxL8pCc+6NTE83
	VjKyDSIplS1X7g4arsnHSIJ4Q==
X-Received: by 2002:a7b:cc82:0:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-4980c673d61mr268376065e9.12.1785854139493;
        Tue, 04 Aug 2026 07:35:39 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfda0cbsm159077f8f.6.2026.08.04.07.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 07:35:39 -0700 (PDT)
Message-ID: <4e321525-708c-4964-9937-d94ea27e8d85@suse.com>
Date: Tue, 4 Aug 2026 16:35:38 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] module: remove srcversion module attribute
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Shyam Saini <shyamsaini@linux.microsoft.com>, Kees Cook <kees@kernel.org>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Lucas De Marchi <demarchi@kernel.org>
References: <20260731-module_ver_remove-v2-0-c9163858f382@linuxfoundation.org>
 <20260731-module_ver_remove-v2-2-c9163858f382@linuxfoundation.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260731-module_ver_remove-v2-2-c9163858f382@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/26 3:02 PM, Greg Kroah-Hartman wrote:
> Now that module versions are gone, there is no need for srcversion
> either.  So drop the logic for this from both the kernel and the helper
> module tools.

This explanation seems somewhat misleading to me, given that
MODULE_SRCVERSION_ALL exists. IMO the main motivation for removing
srcversion should be that it has nowadays been replaced by build IDs.

I suggest something like the following:

"""
The srcversion modinfo field was primarily used to identify binaries.
Nowadays, modules contain a build ID, which is the standard mechanism
for this purpose. The information is exposed via
/sys/module/<module>/notes/.note.gnu.build-id.

Drop the logic for srcversion from both the kernel and modpost.
"""

Lucas also recently added support for modinfo to print build IDs [1].

> 
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Cc: Daniel Gomez <da.gomez@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Aaron Tomlin <atomlin@atomlin.com>
> Cc: Shyam Saini <shyamsaini@linux.microsoft.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Thorsten Blum <thorsten.blum@linux.dev>
> Cc: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  Documentation/ABI/stable/sysfs-module |  6 ------
>  drivers/block/drbd/drbd_buildtag.c    |  7 +------
>  include/linux/module.h                |  1 -
>  kernel/module/Kconfig                 | 11 -----------
>  kernel/module/main.c                  | 30 ------------------------------
>  scripts/Makefile.modpost              |  1 -
>  scripts/mod/modpost.c                 | 24 ------------------------
>  scripts/mod/modpost.h                 |  1 -
>  8 files changed, 1 insertion(+), 80 deletions(-)
> 
> diff --git a/Documentation/ABI/stable/sysfs-module b/Documentation/ABI/stable/sysfs-module
> index 7a3cdd8a8d9f..5c028af9921a 100644
> --- a/Documentation/ABI/stable/sysfs-module
> +++ b/Documentation/ABI/stable/sysfs-module
> @@ -33,9 +33,3 @@ Description:
>  		Note: If the module is built into the kernel, or if the
>  		CONFIG_MODULE_UNLOAD kernel configuration value is not enabled,
>  		this file will not be present.
> -
> -What:		/sys/module/<MODULENAME>/srcversion
> -Date:		Jun 2005
> -Description:
> -		If the module source has MODULE_VERSION, this file will contain
> -		the checksum of the source code.
> diff --git a/drivers/block/drbd/drbd_buildtag.c b/drivers/block/drbd/drbd_buildtag.c
> index cd0389488f63..22f1e842f9ce 100644
> --- a/drivers/block/drbd/drbd_buildtag.c
> +++ b/drivers/block/drbd/drbd_buildtag.c
> @@ -10,13 +10,8 @@ const char *drbd_buildtag(void)
>  
>  	static char buildtag[38] = "\0uilt-in";
>  
> -	if (buildtag[0] == 0) {
> -#ifdef MODULE
> -		sprintf(buildtag, "srcversion: %-24s", THIS_MODULE->srcversion);
> -#else
> +	if (buildtag[0] == 0)
>  		buildtag[0] = 'b';
> -#endif
> -	}
>  
>  	return buildtag;
>  }

THIS_MODULE->srcversion could be replaced with
module_buildid(THIS_MODULE). I'll leave it to the DRBD maintainers to
decide what they prefer.

> diff --git a/include/linux/module.h b/include/linux/module.h
> index 209b6a388be7..cafb99479966 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -377,7 +377,6 @@ struct module {
>  	/* Sysfs stuff. */
>  	struct module_kobject mkobj;
>  	struct module_attribute *modinfo_attrs;
> -	const char *srcversion;
>  	const char *imported_namespaces;
>  	struct kobject *holders_dir;
>  
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 43b1bb01fd27..e27f12778e24 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -238,17 +238,6 @@ config BASIC_MODVERSIONS
>  
>  endif # MODVERSIONS
>  
> -config MODULE_SRCVERSION_ALL
> -	bool "Source checksum for all modules"
> -	help
> -	  Modules which contain a MODULE_VERSION get an extra "srcversion"
> -	  field inserted into their modinfo section, which contains a
> -	  sum of the source files which made it.  This helps maintainers
> -	  see exactly which source was used to build a module (since
> -	  others sometimes change the module source without updating
> -	  the version).  With this option, such a "srcversion" field
> -	  will be created for all modules.  If unsure, say N.
> -

Various default and test configs set MODULE_SRCVERSION_ALL=y, which
should be removed.

linux> git grep CONFIG_MODULE_SRCVERSION_ALL
arch/arm/configs/imx_v6_v7_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/arm/configs/omap2plus_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/arm/configs/pxa_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/bigsur_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/decstation_64_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/decstation_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/decstation_r4k_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/ip22_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/ip27_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/ip28_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/ip30_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/malta_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/malta_kvm_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/malta_qemu_32r6_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/maltaaprp_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/maltasmvp_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/maltasmvp_eva_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/maltaup_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/maltaup_xpa_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/mtx1_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/pic32mzda_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/mips/configs/sb1250_swarm_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/powerpc/configs/g5_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/powerpc/configs/powernv_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/powerpc/configs/ppc64_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/powerpc/configs/ppc64e_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/powerpc/configs/ppc6xx_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/powerpc/configs/tqm8xx_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/s390/configs/debug_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/s390/configs/defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/sh/configs/magicpanelr2_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
arch/sparc/configs/sparc64_defconfig:CONFIG_MODULE_SRCVERSION_ALL=y
tools/testing/selftests/bpf/config:CONFIG_MODULE_SRCVERSION_ALL=y

>  config MODULE_SIG
>  	bool "Module signature verification"
>  	select MODULE_SIG_FORMAT
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index da8be9788d13..5f590ce90f2d 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -575,35 +575,6 @@ bool __is_module_percpu_address(unsigned long addr, unsigned long *can_addr)
>  
>  #endif /* CONFIG_SMP */
>  
> -#define MODINFO_ATTR(field)	\
> -static void setup_modinfo_##field(struct module *mod, const char *s)  \
> -{                                                                     \
> -	mod->field = kstrdup(s, GFP_KERNEL);                          \
> -}                                                                     \
> -static ssize_t show_modinfo_##field(const struct module_attribute *mattr, \
> -			struct module_kobject *mk, char *buffer)      \
> -{                                                                     \
> -	return scnprintf(buffer, PAGE_SIZE, "%s\n", mk->mod->field);  \
> -}                                                                     \
> -static int modinfo_##field##_exists(struct module *mod)               \
> -{                                                                     \
> -	return mod->field != NULL;                                    \
> -}                                                                     \
> -static void free_modinfo_##field(struct module *mod)                  \
> -{                                                                     \
> -	kfree(mod->field);                                            \
> -	mod->field = NULL;                                            \
> -}                                                                     \
> -static const struct module_attribute modinfo_##field = {              \
> -	.attr = { .name = __stringify(field), .mode = 0444 },         \
> -	.show = show_modinfo_##field,                                 \
> -	.setup = setup_modinfo_##field,                               \
> -	.test = modinfo_##field##_exists,                             \
> -	.free = free_modinfo_##field,                                 \
> -};
> -
> -MODINFO_ATTR(srcversion);
> -
>  static void setup_modinfo_import_ns(struct module *mod, const char *s)
>  {
>  	mod->imported_namespaces = NULL;
> @@ -1083,7 +1054,6 @@ static const struct module_attribute modinfo_taint =
>  
>  const struct module_attribute *const modinfo_attrs[] = {
>  	&module_uevent,
> -	&modinfo_srcversion,
>  	&modinfo_import_ns,
>  	&modinfo_initstate,
>  	&modinfo_coresize,
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index d7d45067d08b..b6c1467cf527 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -45,7 +45,6 @@ modpost-args =										\
>  	$(if $(CONFIG_MODVERSIONS),-m)							\
>  	$(if $(CONFIG_BASIC_MODVERSIONS),-b)						\
>  	$(if $(CONFIG_EXTENDED_MODVERSIONS),-x)						\
> -	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
>  	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
>  	$(if $(KBUILD_MODPOST_WARN),-w)							\
>  	$(if $(KBUILD_NSDEPS),-d modules.nsdeps)					\
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index a7b72a81d248..2e969be7f414 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -33,8 +33,6 @@
>  static bool module_enabled;
>  /* Are we using CONFIG_MODVERSIONS? */
>  static bool modversions;
> -/* Is CONFIG_MODULE_SRCVERSION_ALL set? */
> -static bool all_versions;
>  /* Is CONFIG_BASIC_MODVERSIONS set? */
>  static bool basic_modversions;
>  /* Is CONFIG_EXTENDED_MODVERSIONS set? */
> @@ -1584,7 +1582,6 @@ static void mod_set_crcs(struct module *mod)
>  static void read_symbols(const char *modname)
>  {
>  	const char *symname;
> -	char *version;
>  	char *license;
>  	char *namespace;
>  	struct module *mod;
> @@ -1645,13 +1642,6 @@ static void read_symbols(const char *modname)
>  
>  	check_sec_ref(mod, &info);
>  
> -	if (!mod->is_vmlinux) {
> -		version = get_modinfo(&info, "version");
> -		if (version || all_versions)
> -			get_src_version(mod->name, mod->srcversion,
> -					sizeof(mod->srcversion) - 1);
> -	}
> -

Sashiko correctly points out [2] that, with the removal of the
get_src_version() call in modpost.c, the entire scripts/mod/sumversion.c
can be removed.

Additionally, since sumversion.c was the only external caller of
get_basename(), read_text_file(), get_line() in modpost.c, these
functions can now optionally be made static.

>  	parse_elf_finish(&info);
>  
>  	if (modversions) {
> @@ -2035,15 +2025,6 @@ static void add_depends(struct buffer *b, struct module *mod)
>  	buf_printf(b, "\");\n");
>  }
>  
> -static void add_srcversion(struct buffer *b, struct module *mod)
> -{
> -	if (mod->srcversion[0]) {
> -		buf_printf(b, "\n");
> -		buf_printf(b, "MODULE_INFO(srcversion, \"%s\");\n",
> -			   mod->srcversion);
> -	}
> -}
> -
>  static void write_buf(struct buffer *b, const char *fname)
>  {
>  	FILE *file;
> @@ -2149,8 +2130,6 @@ static void write_mod_c_file(struct module *mod)
>  		free(alias);
>  	}
>  
> -	add_srcversion(&buf, mod);
> -
>  	ret = snprintf(fname, sizeof(fname), "%s.mod.c", mod->name);
>  	if (ret >= sizeof(fname)) {
>  		error("%s: too long path was truncated\n", fname);
> @@ -2327,9 +2306,6 @@ int main(int argc, char **argv)
>  		case 'o':
>  			dump_write = optarg;
>  			break;
> -		case 'a':
> -			all_versions = true;
> -			break;
>  		case 'T':
>  			files_source = optarg;
>  			break;

Sashiko correctly notes that the 'a' character should be removed from
the preceding getopt() call.

> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index 2aecb8f25c87..2c2f1d2b4021 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -126,7 +126,6 @@ struct module {
>  	bool seen;
>  	bool has_init;
>  	bool has_cleanup;
> -	char	     srcversion[25];
>  	// Missing namespace dependencies
>  	struct list_head missing_namespaces;
>  	// Actual imported namespaces
> 

[1] https://github.com/kmod-project/kmod/commit/dc1fe2572a41eec540f8309d8a62043ce60c9f33
[2] https://lore.kernel.org/linux-modules/20260731133547.3850C1F00A3A@smtp.kernel.org/

-- 
Thanks,
Petr
