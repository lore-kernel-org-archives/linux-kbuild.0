Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3DE330662;
	Tue, 31 Mar 2026 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987323; cv=none; b=AOQSkzNYJPHx3tgRvGU9PGqncnpt5zULllWmSyejcnU4GtPk8CvLXaOXA/KNBrW7tPUj/w/Lgaw+mmAY4CiAy7v8iPkx4o9W9JIMshBRXusQLnDxuPqaBbOyPPua8wzJ3qNeiMKMFMMZ+m1B9JZ7I/sJju8MhZPo/BeYRiI87po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987323; c=relaxed/simple;
	bh=yz7Gkj/NB6A/nXg74Ru5bIaF98PkmZX1c1CyhRc6A6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+IfB6LaATKT91o0aIeXCb2Fn4xRiPdQjVWyz1MU5PD7wh9jLZYKpmLieXoJl9LecpNrJqtFeCMyVj1Janl6I9hSywNsHcPx2yR8Sg2p8UUZHZ1zepWOLd8PT+RRGl15HTPdu9FQXYnu9VVv+SD4xmnpc/M2Vayw4mTLkyck84Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKo24m+d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKo24m+d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D902FC19423;
	Tue, 31 Mar 2026 20:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774987323;
	bh=yz7Gkj/NB6A/nXg74Ru5bIaF98PkmZX1c1CyhRc6A6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKo24m+dZz8sQzl7Wg15ZeUFtoVdD9y3IJeagghzABNFHnWXHP2y62oweCV6ezrJs
	 DiBMbkAPOsbEnSkAdsNgOL3uFIJ3Jf37FRdH840N5pR0OyzIK9K2HuPVpBKlfLO6mV
	 HZRG8Z9ah/SUMu1rHnBh8YHJcsiAx0VcclWJi4iofExi2goD2sNLALIYfaxgmWKu7D
	 j4BGF1e20RiMw74yAdwaVTDB6RKr1aqxsuyfJUO1GRrY1SOYyiu5IuO14FObnctW38
	 Hy9G1YqtksFhmOBfzCsjFrUXrkCUUOM8QYZuqqVoBoKANaE+QXgzIGghsjJMTAvf3N
	 CmL2wNkUQ9BfA==
Date: Tue, 31 Mar 2026 21:38:24 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] modpost: Declare extra_warn with unused attribute
Message-ID: <acwisFwJ3eMMQLIp@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
References: <20260325-modpost-extra_warn-unused-but-set-global-v1-1-2e84003b7e81@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-modpost-extra_warn-unused-but-set-global-v1-1-2e84003b7e81@kernel.org>

On Wed, Mar 25, 2026 at 06:20:30PM -0700, Nathan Chancellor wrote:
> A recent strengthening of -Wunused-but-set-variable (enabled with -Wall)
> in clang under a new subwarning, -Wunused-but-set-global, points out an
> unused static global variable in scripts/mod/modpost.c:
> 
>   scripts/mod/modpost.c:59:13: error: variable 'extra_warn' set but not used [-Werror,-Wunused-but-set-global]
>      59 | static bool extra_warn;
>         |             ^
> 
> This variable has been unused since commit 6c6c1fc09de3 ("modpost:
> require a MODULE_DESCRIPTION()") but that is expected, as there are
> currently no extra warnings at W=1 right now. Declare the variable with
> the unused attribute to make it clear to the compiler that this variable
> may be unused.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I will apply this to kbuild-fixes for 7.0.
> ---
>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

modpost is just used in-tree, right?  Can't we just remove the '-W' flag
and the extra_warn variable completely?

Nevertheless,

Reviewed-by: Nicolas Schier <nsc@kernel.org>


-- 
Nicolas
