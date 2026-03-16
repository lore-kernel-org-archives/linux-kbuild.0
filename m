Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371073246F8;
	Mon, 16 Mar 2026 16:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676958; cv=none; b=giD7dWOTEOHp3krJbfQVz5AP1YFw0QOe8DnUwlfoR33wTzhnDxdEPArhl0R9FKrq+G+kssjxFxqk/EweAl9TkYCqUlekYigXosCzobVNo3jlSsMRQmCD/OzAC3SRNLOEJO0EfvqMUkOk1cv2i42RKlMu3Hb15nRfNJ7BUGcVmVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676958; c=relaxed/simple;
	bh=wwVMJKJoxUyVEtwQNP5jTdSCu/45EuWIZGBBpV+5Bq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffZG771XYUWDP/ZheuMb1Hs9juDsFO0iNHZQwNtd1i2EHkUcdMePYdH5BanOaeM3uUgTsjjQi27VGOHt1dI/YOh7xaDtdb9f5YeB9JuMz/XUMgcFKaLEUbeQumc8OtB5u4nf4zELUf4+PclKUqleJ4CXzJMv5i0eC99umSWRFCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3cRtySr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3cRtySr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5A3C19421;
	Mon, 16 Mar 2026 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773676957;
	bh=wwVMJKJoxUyVEtwQNP5jTdSCu/45EuWIZGBBpV+5Bq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3cRtySr5PpORwpLTo9saFyfHt1f09t0q7PwN5hbsjkeLmRjSS2d/sU7invCxZFkt
	 GYz0eCFyvSmZrwsI3KDzP1faI30JFey2EvlkLVUg5V4QK7XN3HA/W6tI+LPMKbWVLc
	 M1+OKEHJy1AHZyyZvJHNY4na3SeNmuSvsKfFd4SgQaN1Wiz4k+NoePf9oIwTH+NEC/
	 W0hjxBaYGWrCgDUjWf5pGz4wLOQ5HW3H8QM4RnNiLLS/fP0zXp/ehaT4XJEsoPfErG
	 5fVyiUX5Lc6DquXsL1IWvv/0BcWGV1KtijLnHO9wOuXv8d5afT7PASHKDPO2hMKjXM
	 ZGgE2/dUU7iJw==
Date: Mon, 16 Mar 2026 17:02:15 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Message-ID: <abgph5Gk1G8UgG2E@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
References: <abgRRX3PH9IaExi8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abgRRX3PH9IaExi8@sirena.org.uk>

Hi Mark,

On Mon, Mar 16, 2026 at 02:18:45PM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the kbuild tree, today's linux-next build (arm64 perf)
> failed like this:
> 
> Auto-detecting system features:
> ...                                   libdw: [ on  ]
> ...                                   glibc: [ on  ]
> ...                                  libelf: [ on  ]
> ...                                 libnuma: [ on  ]
> ...                  numa_num_possible_cpus: [ on  ]
> ...                               libpython: [ on  ]
> ...                             libcapstone: [ on  ]
> ...                               llvm-perf: [ on  ]
> ...                                    zlib: [ on  ]
> ...                                    lzma: [ on  ]
> ...                                     bpf: [ on  ]
> ...                                  libaio: [ on  ]
> ...                                 libzstd: [ on  ]
> ...                              libopenssl: [ on  ]
> ...                                    rust: [ on  ]
> 
> Makefile:2254: *** extraneous 'endif'.  Stop.
> Makefile:2254: *** extraneous 'endif'.  Stop.
>   PERF_VERSION = .gbc1f864a1976
> 52.34user 4.91system 0:56.88elapsed 100%CPU (0avgtext+0avgdata 140840maxresident)k
> 0inputs+0outputs (0major+1379795minor)pagefaults 0swaps
> Building: arm64 allnoconfig
> Makefile:2254: *** extraneous 'endif'.  Stop.
> 
> Presumably caused by commit
> 
>   6a76b3c06a1d3 (kbuild: Reduce the number of compiler-generated suffixes for clang thin-lto build)
> 
> though I don't immediately see how.  I have used the version from
> next-20260313 instead.

thanks for the report.  Unfortunately, I cannot reproduce that anyhow;
but I pushed to kbuild/kbuild-for-next at 12:36 UTC, might that have
been a bad point in time?  Do you have your merge somewhere around where
I can fetch it for investigation?

Kind regards,
Nicolas
