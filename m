Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABAD3CF1FC
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2026 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021916; cv=none; b=E1vWwYo+hWw/HiUN0/04pE1HMnNAqaAL1x7HUZ+SUmE+7zF/49qn7pLYZQ54CApbaU1kGMiwNfdZeO3h6+fsPnikun+sg94AclhnEUEtvdI+CujI3VJz85uM4hzbYF+44mXijCnlz37/hbP+tn5UpxlPjGRF15UGVGCdk7w/USc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021916; c=relaxed/simple;
	bh=4Tvd6TLKSh4VlsuaCKI+5gByiR6tEcXdxBcXIv/rcnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEw8UxGF3A2azXWqoK2Toxg3YLTF2BUk8XgfHYgWOcWN1ZWMVHQX1xtMZxxeQyLeonPyzn38c3TilfcoUTEv9/Sw7hS6Of8+Cd9wY1KjeFyN1aumXWkyMtMtMPsEQDzZloIut6bqWNnqSejU/M4acgtrb25BIKUafL7qu+BdiXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBX7tlpy; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBX7tlpy"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cace91f112so58034725ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 23:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021910; x=1789626710; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1toCXFJJyIGT7Bi3z+gvDkztm6+uDMf7He5yX/dqQdk=;
        b=CBX7tlpyDsi7FLF4pLFU8mliwhYbKYqB1r17Idyeu+COShfdlQNupygFGPsGjW/G+L
         sND2RYQ1Pl/71pLr15OEMCu4zjV1oWi+qqUZu9rlRh042olh9VDnkdTxloN7iHWVHDiF
         +NMPBmOGCcconcefnZaDTVSAmrZLhrPBr/A7JF3+4I2ZAfcLnTBoTGHwBPlJgwi0fS6z
         bE6klUyQHAUAIAl5yJYE5/+3fYLLilCyfbopU/n27ZDR9DNS5LIUJzFqz/MHKGdLBNZG
         I5hDaK5FZOv1IFE6YSwmE3LC/QH/lSIuZT2TwItoximyU7JOEFiz5lLqbTKob8uMNdEq
         nPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021910; x=1789626710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1toCXFJJyIGT7Bi3z+gvDkztm6+uDMf7He5yX/dqQdk=;
        b=TryVezF3o5n8ApFa3aaKxZN6vtXDvVj5DwWPz/I3Y8yGMncesi0UeErSooZzkb2+Ri
         wIKipQzG9fClgHdhuFMkxnCon6RscWwxmzJXOzOk1yTDb4EiHe0nSekya0kOvSXuFcjn
         WGUpdeiuSgJEayxNsaTRwWwVSDSoyYokElNUs7NtXxEoxL8jfcZVhg3gdByP6S8W5/Nc
         jCdE+TmkuuwhE3C9XSxo1HWaY+KMxDFBL0p1Kkn+s96qC3+B8wZrUSlA/C7kb3BLsbhE
         pYNRF/edTTG2jhtyUvDxvBIo4e4jbxl1anEq+0nkHPO/JcadZ/nKvwk4/E8tRFViF2Hg
         hphQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr/NKhmUYmGhSCzX66f4s3aO8HVsHFnc5vK6XrfHuaAlO7y5U+AQumpNF247mQaicfNwvXpDiNuH3ByGE=@vger.kernel.org
X-Gm-Message-State: AFuF++nFnvyW6HHsGo6/iAPcByXER7GRkXBjU9dWzKLZp+vYzCOmyzRV
	Aw7RZBpneVYSUl4oHciWDd4BBwXKJenXJYsiamIyWqBo4dJDw1PU0T1e
X-Gm-Gg: AYBFou0P5JpYc0T7ABv9+hSjF+jJ+rtaIZVR1y1hv+guGkXWVN6EBTOce/UBU9a//N6
	1bwPEBR7m5LRQeBOMJ143WSSXKWL+ckOSPxsi6S/K0MmLZz5xGLY/FH70LkA099GwiF0M+xdSoH
	bhWMwRDBhTXnHmQqUarYfhRsrD61uwQqxGvWFTa0BKvKxTjT/M4YsliSIp5Of3lSoVx0SXTc785
	xUST0TBZuX2cLATEzQoCW2d661KS1OzCZ+j4Y+LvmlB9DYNvGgPv11B8Y4QnduEDr2hiI9Wi97H
	5aY41roc2DenxHc66Vl+YHRR7CvR25M151GfzMoKYQSeiXvD8bCMgKI4xzYBC3u3Bup5mkwa454
	pYZNufUrOyiBiDK90Tr0E/aL2+4ixlb2qvGtLG/7O+eYGw9f9tdIaiNwCLLv8URnpUv4rfeoA6c
	MngGPmCOF/MdhYLV15wk98JhZRE2++1oT+LcuPs4lHazW+6hpjiyZU7adQCfYfOElW23FxBOPlS
	Gx5WVDCwgHwtH7X4PMeZoeP08JmGgXIfPJZcgSetXY=
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr64061526a91.11.1789021909725;
        Wed, 09 Sep 2026 23:31:49 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e834319sm2507639a91.10.2026.09.09.23.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:31:49 -0700 (PDT)
Date: Thu, 10 Sep 2026 12:01:26 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 01/24] elf, uapi: Add a header for relocation constants
Message-ID: <aqJOscgnnevybiKO@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-1-3a93791af1cf@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-vdso-absolute-reloc-v5-1-3a93791af1cf@linutronix.de>

On Tue, Sep 08, 2026 at 08:33:35AM +0200, Thomas Weiﬂschuh wrote:
> While the numeric constants for relocations are architecture specific,
> it is still useful to get access to them from other architectures.
> Also the definitions are useful for userspace in general.
> For example tools processing elf files during a kernel cross-compilation
> can make use of them.
> 
> Introduce a dedicated header for them, similar to the elf-em.h header.
> For now the header is empty but it will be filled step by step in
> upcomming commits.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  include/uapi/linux/elf-r.h | 5 +++++
>  include/uapi/linux/elf.h   | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
> new file mode 100644
> index 000000000000..2c382c8a4807
> --- /dev/null
> +++ b/include/uapi/linux/elf-r.h
> @@ -0,0 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_LINUX_ELF_R_H
> +#define _UAPI_LINUX_ELF_R_H
> +
> +#endif /* _UAPI_LINUX_ELF_R_H */
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index ee30dcd80901..b3e312255552 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/elf-em.h>
> +#include <linux/elf-r.h>
>  
>  /* 32-bit ELF base types. */
>  typedef __u32	Elf32_Addr;
> 
> -- 
> 2.55.0
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
