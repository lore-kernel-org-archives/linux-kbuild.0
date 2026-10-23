Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770436;
	b=2fkN/ZhMIoNoAp8DKdEGkaKSiPFkMdQg9XFEvLI0TUBcUAKxmEQlWz0nwYPjgLzla8OL
	 GpNjBkyu2HQXQDUZM2Kzvp9r/H+Qj2xpU4vGgIFdTBeaziUIDW7p/bphDMsfwQxowuSAV
	 9ZyYOJY/0aTAi8f4s+TxCiI8Ucfqga+PWLfF7botls5kdiPAZirr9t9aVps8OE40n43ub
	 toypxebKi5Hnq1ZsHKRUkc1QkjcaSIA3Eklx9HJdxbUzmPEwahEKh/NXHe367laUSfRI7
	 I+jmwOq3TcyO8fBOX0tb/5b4eA6LE7ZXeoJ1nfF/fj1lEIeHSUxafrzP0zj8nSnnePQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770436;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LBxLVBAzhD8PnAjoJ0Ac22ybO01a1W4k52zwzB7Vd/s=;
	b=EguiDXcFI515r0lPiAUER7UxIMmKMJlZF+3Gir9xASsx1BeXzbrzvjINu2ILwRE4Q7Ay
	 ALvCDl88+eiwfU97ZUH6Su1lnXw1NtXyCTBO83vB5t/4XY6HnAzMzf/wCH+v+N6aytkv9
	 6jOo4tH1YorPDl/erM3M2a3iah4Jtblvl0rlYJfqQQIFjdmjyHE/p3hKaawkw48/vmlMK
	 5SAKFOUrengNwqfNdo3zh2bQAqp9m/FO0EWVLGIRzaqbqdGDfbAbL65eHREUFYMNgxTtj
	 RzZ0eGVhIhsla6zcApr6Q09RE9dm7H9JaqKDUoTLX05my91fzQeVZaghypzdedB1eVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nr1MGqpR;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA7606A31B;
	Fri, 23 Oct 2026 15:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41AA7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nr1MGqpR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1792770433;
	bh=LBxLVBAzhD8PnAjoJ0Ac22ybO01a1W4k52zwzB7Vd/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nr1MGqpRXovpKxwFNCUnab+BhHhBam7aazQ3MqZ5YGJMAII1f5QLuELu6yycitAAj
	 ZqSg89TRyQNQ1F9CS/6kVMw3tnMnDT4mIAuVRRpctkDXxwUcDBqDPhgGisW6EAvhqK
	 2MKmE7cEhfpeYz5/8Cs5AZeGWeYAm6lnSExusphw=
Date: Fri, 23 Oct 2026 17:47:12 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Thomas Huth <thuth@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 00/13] treewide: Replace __ASSEMBLY__ with
 __ASSEMBLER__ in header files
Message-ID: <2aa62156-9139-42a1-b993-4e01ef408da0@t-8ch.de>
References: <20261023064908.66707-1-thuth@redhat.com>
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
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>

On 2026-10-23 08:48:37+0200, Thomas Huth wrote:
(...)

> I split the patches per architecture / maintained subsystem to ease
> the review, and I also split the uapi headers from the normal ones in
> case we ever decide that uapi needs to be treated differently from the
> normal headers here and the patches would need to get reverted.

Nit:

The UAPI split doesn't really matter anymore, now that
scripts/headers_install.sh normalizes all UAPI headers.

(...)


Thomas
