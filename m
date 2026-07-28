Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A2B44E643;
	Tue, 28 Jul 2026 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249784; cv=none; b=JiXfCr33JABAhCI2VQt6dwM2XmwQHMHwoxywegosy9bORwZLq4PC7UBMrzY0z9/dMA8zxbUXcd9MTLcVwnbhIKpyYFT3Uk/khZweNf9nvCnHTbQxAJBnNNic8V5YfbeFeHMO1QO6wtgXFU9mNuhqkGvXnCa6lWveOQaQjJi1OGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249784; c=relaxed/simple;
	bh=6cRF2K99/NRu7IS1etkPoTGV8lB0/szvRibeXDyTgvE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kujQ9IZcQLbrTFr5hh0BQaMhyANam3QCjok/jYxMJtTA2o+PX8LNVFBdaaxXCA/yp1aGjheuj++IvVEbLqWdrhemkIvJraUHIy49TfUv6iB0gxXybCPvnSfD1eQ5RUlwY2n67khX76gcwb8mkzjJ2Sbcj20XWOz1Wyac/YOGiAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=WgclEcBt; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="WgclEcBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1785249774;
	bh=6cRF2K99/NRu7IS1etkPoTGV8lB0/szvRibeXDyTgvE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WgclEcBtB0rTtv2Qc1Q542Mn+QeLjlikG6bqjNcCq5Zi/PYi2VXhFcia88HEd/G3m
	 4yjmAn/HDWzwOZg3dWUmxhx1BWrrEWmHpt9/iT+aUzzBEu4TD4dvjG9CmNU1Z+1Vb5
	 IvFP+atFCsQi/D1PZZ1OPULmLhWq04g7vu4E2QP8=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 22A5A65AAE;
	Tue, 28 Jul 2026 10:42:49 -0400 (EDT)
Message-ID: <262a4063b76b96dcb76a226bb44fd65cb2297d94.camel@xry111.site>
Subject: Re: [RFC PATCH] x86/boot: use zstd -19 if building for 32-bit
From: Xi Ruoyao <xry111@xry111.site>
To: Mingcong Bai <jeffbai@aosc.io>, linux-kernel@vger.kernel.org
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, 	x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Nathan Chancellor	 <nathan@kernel.org>, Nicolas Schier
 <nsc@kernel.org>, Nick Terrell	 <terrelln@fb.com>, David Sterba
 <dsterba@suse.com>, Ard Biesheuvel	 <ardb@kernel.org>, Jan Stancek
 <jstancek@redhat.com>, Josh Poimboeuf	 <jpoimboe@kernel.org>, Petr Mladek
 <pmladek@suse.com>, "Peter Zijlstra (Intel)"	 <peterz@infradead.org>,
 Thomas =?ISO-8859-1?Q?Wei=DFschuh?=	 <thomas.weissschuh@linutronix.de>,
 Simon Glass <sjg@chromium.org>, Marco Elver	 <elver@google.com>,
 linux-kbuild@vger.kernel.org
Date: Tue, 28 Jul 2026 22:42:48 +0800
In-Reply-To: <20260728143141.2870515-1-jeffbai@aosc.io>
References: <20260728143141.2870515-1-jeffbai@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-07-28 at 22:31 +0800, Mingcong Bai wrote:
> When using native build environments (that is, 32-bit x86 chroot/containe=
r
> as build environment for 32-bit x86 binaries), `zstd -22' requests more
> virtual memory than that could be allowed on 32-bit hosts.
>=20
> Introduce `cmd_zstd_with_size' for CONFIG_X86_32 builds.
>=20
> This is quite possibly just stupid... But there doesn't seem to be a way
> to detect the host environment. So I'm sending this patch as a means to
> ask for your opinions.

"readelf -d $(which zstd) -h | grep ELF64" ?

But it's also stupid, if someone is using a script wrapping the actual
zstd executable or cross-compiling from a non-ELF platform things will
still blow up.

--=20
Xi Ruoyao <xry111@xry111.site>
