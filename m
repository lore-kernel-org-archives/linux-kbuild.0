Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BF9425CE1;
	Fri, 29 May 2026 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780080444; cv=none; b=VpolKhmJS2Fo+W04nMe2Fof/emRQQl0qETz3L1ZKjZWaE7TJTqhDIJkeuquAt307H1YsmS80ogZkPg/v7+lpQTxcp/792IahvTulmLlwuOG0I4Gacp9u04txt9RgBZHlcj8ByV+7G8tHKwmq9Cm9rcCwrc6XFC5IPYNVmvLjOqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780080444; c=relaxed/simple;
	bh=Y2BfjIOohy7qzAHN359pShO4LMVZ0g/7OgqTF8A8sRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCi2I3/QUBW7XgmgbO6yHJTwoZOpIOf8MsvWE/LS7nEp48BfsONSTDwTynHl9mkfeUDCwht8Iq/EZZ14VsxUqEfK7nU9Ww3PQGJdzoYYMlfY4XH+Z4ehqxHYCtc7lun5wxb45Q/rXUJ6JVzJy7X7aXhVi70fV6EFwaMHL3rePZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmRPQV+c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmRPQV+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFAD1F00893;
	Fri, 29 May 2026 18:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780080442;
	bh=r2c2Odd8JPefWuQj2wE16E72FC1VtLLMGPUbupxPPIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HmRPQV+cqmN/y4kJjAffLC/vkDxIEMLsAcp4Rw4NQ3J8TdUpnwGSjAnEEaVGLz08M
	 9fJqOV7t4QX6WzfClGDu/wL2+1oxs8vuOKsh4yCEfUioFHVafOf1+FE1JL1q4DtHMd
	 K8WwpqH7d7ZhsfY2Et2AtSa94sY0d6YOt8QkL3CZblb8AOIPCcs4PVnf8o2nU3NOoW
	 EAG5OmujNWXCGchqvjOek7W9i/hBXywLIF3m/bVEWN8EF6vcPYCpKmm7yUlXm85p67
	 aso5S5XJEiLjbjeyYZdodDAyA+XFbjomLpadt+fTbU63SZopevSUd6w3r6EsIMa/9H
	 ELeL0RzX4fnNw==
Date: Fri, 29 May 2026 11:47:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v11 3/3] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <20260529184714.GA2059596@ax162>
References: <20260528203905.687687-1-xur@google.com>
 <20260528203905.687687-4-xur@google.com>
 <178000602351.678078.3534988919326810792.b4-review@b4>
 <CAF1bQ=SOG3qr4K3h=SBgM=e42RmV6WjOfyMOmi_qBOpYMoVaEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF1bQ=SOG3qr4K3h=SBgM=e42RmV6WjOfyMOmi_qBOpYMoVaEQ@mail.gmail.com>

On Thu, May 28, 2026 at 04:09:10PM -0700, Rong Xu wrote:
> On Thu, May 28, 2026 at 3:07 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > Sashiko has another comment as well.
> >
> >   https://sashiko.dev/#/patchset/26003?part=3
> 
> Are you referring to KBUILD_VMLINUX_OBJS and KBUILD_VMLINUX_LIBS part?

Yes.

> I'm not sure if that's true: in my build, KBUILD_VMLINUX_OBJS includes
> lib/lib.a etc.
> In line 1296 of Makefile:
> KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/,
> $(libs-y)))
> 
> We can see native objects in lib/*.
> % find lib -name '*.thinlto-native.o' |wc
>     204     204    7104

Ah yes, I should have double checked that before brining it up.
KBUILD_VMLINUX_LIBS would contain archives such as
drivers/firmware/efi/libstub/lib.a, which we obviously do not want to
process into vmlinux.a, so I think that comment is obviously invalid.

-- 
Cheers,
Nathan
