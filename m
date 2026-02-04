Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FA78460;
	Wed,  4 Feb 2026 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201150; cv=none; b=VweLZF+4YF/1VbnxKuo6xDfqZm1+UvgUPk2WnFub+z/7eojnE8dTwbTE5wtzhP+ue+DXovyCj3WgYoLpFQknin5SvccxXZLEUiZvGURH6cnTrSqTIYxoEnz/yzTDsLPHm168k+VWiEEcutAwxd0Ph1JXkn0Ipb19bJKATgcE5A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201150; c=relaxed/simple;
	bh=rA1a+YBhqPqOXlWE1XOcasC4hH+/r1lVZ4TCQm24evU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suZVjuidhLYqWwHYiWQgWV/lpXoMLbdcW5L7BPFNoi7bWqzUMK1mc8jzrasvpfzz+Pg6qfpt5B3U5AyyslgkHJEEB39MgkR5bagcRCUUUbvtLvDDX6FT+Hkxt7Hl+EDDKoSVbPpvJP0QxKuscilXeAP7IyrgjF2JcbmSsENRdWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LANPMQ1/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LANPMQ1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487EAC16AAE;
	Wed,  4 Feb 2026 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770201150;
	bh=rA1a+YBhqPqOXlWE1XOcasC4hH+/r1lVZ4TCQm24evU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=LANPMQ1/JwxpZ+414qlDQgXHJHzWDlo5SO3DNf4o7kSRBBlXlkYfHXk325rnEpfAv
	 AMtqb3w7MlA/pXKxBVidkGx8t0VXXtCuJfXo6VBj4OV5c4ftO+GBdXsO0IpFJVmavC
	 dlJWEa3k0qNho6tPCb/l7+69vFNB7AnRUI5zTcKMeqjRDx+pcuoqrmwzFti+YzuNl2
	 jA7kv5P+DWjKNeMYI+Ihn6mgp+oNvCxMhXisZJf0v1GcR7iLM6igW7p0No9IREI1bs
	 em1QS5BcWnef2J4bnt6WIfJqwpGZB1gsHkadGPK+njzGccAicHiguCNEMpeViJZMRX
	 Y0G+DoWVjmbzg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnaBQ-00000004sSK-1AMF;
	Wed, 04 Feb 2026 11:32:28 +0100
Date: Wed, 4 Feb 2026 11:32:28 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rong Zhang <i@rong.moe>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] kbuild: Do not run kernel-doc when building external
 modules
Message-ID: <aYMeaKMPkf7uxghq@foz.lan>
References: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
 <176987242178.1743608.5094531752561489739.b4-ty@kernel.org>
 <CAK7LNARR9bZQ9t9emcVzmL+P7xYemu=8s8v_LshQ0-m_zEE9mA@mail.gmail.com>
 <6387ba7b99fb952a59932c3a851dfd0ecc4dfb2c@intel.com>
 <aYMbVcNvJPlLPaaG@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYMbVcNvJPlLPaaG@derry.ads.avm.de>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Wed, Feb 04, 2026 at 11:11:33AM +0100, Nicolas Schier wrote:
> On Wed, Feb 04, 2026 at 11:10:37AM +0200, Jani Nikula wrote:
> > On Wed, 04 Feb 2026, Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > Since kernel-doc is a part of Kbuild,
> > > all dependent libraries should exist under scripts/.
> > 
> > Huh. I've always wondered why all the Kbuild makefiles are placed in
> > scripts/, which appears to be a haphazard collection of, well, scripts
> > and tools. But then you also have tools/.
> 
> From the kbuild perspective, as Masahiro mentioned, every tooling
> related to kernel builds, kbuild or kconfig should be placed in
> scripts/.  The tools/ subtree isn't using kbuild; rules, definitionas
> and other expectations that are valid for kbuild may not be true in
> tools/, cp. commit 6e6ef2da3a28f [1].
> 
> Unfortunately, there _are_ things in tools/ that are required for kernel
> builds (e.g. objtool), but there is no consent on moving these parts out
> of the tools/ subtree [2].
> 
> > I've followed the kernel-doc refactoring from the sidelines, commenting
> > on some things, but it never crossed my mind the build shouldn't depend
> > on something outside of scripts/. (That's what I'm inferring here
> > anyway.) And apparently that thought didn't occur to a lot of other
> > people either, with even more kernel experience than myself.
> 
> Yes, I also saw the changes fly by but did not think about the
> implications.
> 
> > Sounds like the kernel config and build system would deserve a top-level
> > directory like build/ or kbuild/, which collects everything needed for
> > the build, nothing more, nothing less. Because scripts/ is not *that*.
> 
> Well, sounds straight forward at first, but where should we make the cut
> between kbuild and non-kbuild?  I admit that there are some scripts
> below scripts/ that I'd rather label as "contrib", but I don't think
> that these are too much.

There are all sorts of stuff there. Just documentation has 15 scripts
that was either sitting there or were written directly at tools/docs,
as part of the discussion process of moving things out of it. Several
of them belongs to in-kernel-tree build chain.

Just my two cents, but I guess a kbuild/ and/or tools/kbuild directory
makes sense on my eyes. Yet, I wouldn't mix it with the documentation
build itself.

> 
> > I understand all of this may be a historical accident, and possibly too
> > painful to fix now, but is any of this documented anywhere either?
> 
> No, I am afraid it isn't.
> 
> Kind regards,
> Nicolas
> 
> 
> [1]: https://git.kernel.org/kbuild/c/6e6ef2da3a28f
> [2]: https://lore.kernel.org/linux-kbuild/1551764896-8453-3-git-send-email-yamada.masahiro@socionext.com/

-- 
Thanks,
Mauro
