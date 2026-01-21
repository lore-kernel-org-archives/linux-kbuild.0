Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434D3213E9C;
	Wed, 21 Jan 2026 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029553; cv=none; b=OabAl+Uo7Lea60KFfcOiZD6rvve5swBQw8CpAhM87ZfAMegoT5g1V6OHGWVyvz7+Lbci+C9PojUjk25iDo14xm6aF677Iy6NVnZM6MgMb9CrEU8qkwYrvxVJ3T3jOR4LMzKq7K2VD1yJ185m0XcfAwUiCAXsM3KN3Zp2D64LBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029553; c=relaxed/simple;
	bh=gg/sA0JHc6uueGjq+c5x5YlAceVPBMD+jAVHIE4qbSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6wHFoiOe86uYNudAqA+UQdSkZ4rTehN/zlFdmPj2fAgryrBPPdFxLlpVCnSYhpaCi1SAghPhLYkw24LApD95ObHOLne8ZLIHNOyaeVj9kQy9sTF4tLeAvRYU123N7pR2H1m7OKju2QGiDvCoZfTS0+aCRAhz39jh6uQgVPHKZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=toMgk0UL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="toMgk0UL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E195C4CEF1;
	Wed, 21 Jan 2026 21:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769029552;
	bh=gg/sA0JHc6uueGjq+c5x5YlAceVPBMD+jAVHIE4qbSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=toMgk0UL6yQnPW3rB5A54LgWPcGmvG37hBrJSwfu3OCjElg7hP4BRJlNW08gGThP+
	 jsaeyAsJmqdo3Y7VYWt2l5gBIBtrCJI/lqskLn0Zkh/ACQ3B/xi8CyDD0TkRfaDQGL
	 TS3kKDlfZKZkKdWLWrFPZ0BLGssUYbRrvsccYwxvZ/AgMw+J7XD/ZBaLwKK8GNsBru
	 J7cQQjCogu8Kgs9dYrrUXVjQxyFM+8GCEHcuEOmKNsvaLgyMQ80p0hlIiHCKHjrGcE
	 6K8qQ/vnZxoyUKTf+yfFSHjXyO/onZm0U+k7jFgphhCJJmACSibxqc2p370shl4lrG
	 54RUijhKS2aog==
Date: Wed, 21 Jan 2026 22:05:04 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	WangYuli <wangyuli@aosc.io>
Subject: Re: [PATCH v2] kbuild: Reject unexpected values for LLVM=
Message-ID: <aXE_gOfh9NwQcc8X@levanger>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	WangYuli <wangyuli@aosc.io>
References: <20260121-kbuild-llvm-arg-v2-1-5e4d8dca4ad8@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121-kbuild-llvm-arg-v2-1-5e4d8dca4ad8@weissschuh.net>

On Wed, Jan 21, 2026 at 02:42:39PM +0100, Thomas Weiﬂschuh wrote:
> The LLVM argument is documented to accept one of three forms:
> * a literal '1' to use the default 'clang',
> * a toolchain prefix path, ending in a trailing '/',
> * a version suffix.
> 
> All other values are silently treated as '1'. If for example
> the user accidentally forgets the trailing '/' of a toolchain prefix,
> kbuild will unexpectedly and silently fall back to the system toolchain.
> 
> Instead report an error if the user specified an invalid value for LLVM.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Add pointer to the documentation.
> - Link to v1: https://patch.msgid.link/20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net
> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
