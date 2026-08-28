Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D54369990;
	Fri, 28 Aug 2026 15:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932051; cv=none; b=HWiIfFcmTEK5e+6LQKwT8LgJv1xKMqc328FR08PiHbcfdTw1ggcR58qYwYuGkQ/q/5I7w52laVpF9FGg0fgVVlYXoljtEOsICkJJBbPK0N16m0myrFOCR6ocbfThuJwYNDvld8iwLmsUPqo4cl2CD3PJs54Sv/nYGOO8fS25Y1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932051; c=relaxed/simple;
	bh=y/OHRfOGHrwaVholbizH9w8LSy/Zuph4FRIR0kuaRAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjmQpRBFxFZSe0AKtzoene5hERPdW4BFRIwwn21AL5AG4T27vrEl8SZZDKw0Wo5XLw/pAjzeIJzVNpxBKFly7qKeP2Xu3hWWl05N8gd1HytXmHraDJreB4Wg36C3GiAsTra2IFgc6fYRFFkRRaOwupmzhn4ySeJrBG8hh/f1RoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOF7MG1V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOF7MG1V"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3D9511F000E9;
	Fri, 28 Aug 2026 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787932047;
	bh=UX7PSrLrhs/jlVb65VbeiT5KGinVZr2MwpTHEwgnYKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KOF7MG1VQIHvi+BqY7noHCPVWdPMOYRvGIZn/tvskmB7DTwQfvfJS33MWlsdVrbfA
	 nX3ynyesHpksP/X2aXhMJI4L0FK+l0s0jeHDlnO3/jXwEvjZJYp3Sc7I4uysKE/4Cz
	 6PZUPJoDCXjmyhJp6ulzFBzUKdqjPD744R6vteiWMIWW4I5KwE0o/zD29uaKUN4NdC
	 rwo9JqwmSCOZrYk/Zwo1fDdvgAvmqdixOsFmRUQOy6VPMQc++oMPzPjCuNE9/TpUs8
	 1923CcCFeUEawOy7OjOLSCaQ1HgBeob7L0PwxUJFupBeElaP3PUUsxk7kCBdiiMBTJ
	 eI7b+I0IioIfg==
Date: Fri, 28 Aug 2026 17:34:27 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default
 logic
Message-ID: <apGqg5a5I9g1CoF_@levanger>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Nathan Chancellor <nathan@kernel.org>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-kbuild <linux-kbuild@vger.kernel.org>
References: <c480ed6b8bf38822263e2c5b7cf32b28600f212d.1787219898.git.geert+renesas@glider.be>
 <CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com>

On Thu, Aug 20, 2026 at 12:15:33PM +0200, Geert Uytterhoeven wrote:
> CC kbuild
> 
> On Thu, 20 Aug 2026 at 12:01, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > When NR_CPUS is less than 16, or when SMP is disabled, the default value
> > of 16 is invalid.
> >
> > While actual configuration picks up a sensible and valid default
> > (NR_CPUS or 1), "make savedefconfig" will still write a line like
> >
> >     CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=1
> >
> > to the defconfig file, even if that matches the sensible default.
> 
> Is this a bug in kconfig?

I am not able to reproduce that; this is what I see with ARCH=arm64
(arm64 always has SMP=y):

.config:CONFIG_SMP=y
.config:CONFIG_NR_CPUS=3
.config:CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3

-> defconfig:CONFIG_NR_CPUS=3

similar for ARCH=arm:

.config:CONFIG_SMP=y
.config:CONFIG_NR_CPUS=3
.config:CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3
defconfig:CONFIG_SMP=y
defconfig:CONFIG_NR_CPUS=3

or with ARCH=arm and SMP=n:

.config:# CONFIG_SMP is not set
.config:CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=1

(CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS does not appear in ./defconfig)

and with ARCH=m68k, NR_CPUS=8:

.config:CONFIG_NR_CPUS=1
.config:CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=1

(CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS does not appear in ./defconfig)



Thus, to me it looks as expected.  Do you still see the behaviour you
described above?

Kind regards,
Nicolas
