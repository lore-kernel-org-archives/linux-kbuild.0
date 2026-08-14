Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E82845C6EB;
	Fri, 14 Aug 2026 18:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731995; cv=none; b=NazN3js2G5ig+0jGgyl6rkjy/Hynpz6ztin1D2j0n/H+U2M3+k4JcpfFAxHcoZTFKCk4hhgKTyTQmM6+MhYnN4KiAqtEYQMEEbpBEVZXCu1F+E84apbJC+El4pdqITUed+l6G2JvlceSu1SVRF0/Y+DAhbyTw64nA/CHGxpyngE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731995; c=relaxed/simple;
	bh=7g3+y2yv5JH0FxSJZB3t086UVZzSKWNd84ckVrWDpRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPCWSLAVNevG62eGIiTOPY9PG+ck8PM6ZZhWdMa7m8yJuOw4xzm9y24d9DmrDoFyzpn+ziTA8FwnzW/wmc4cFxQ2jBpVOBHZHk5Qbba52MSlAIeOat7w4sV7g4emfDAsutyOfdnkSPhz+LkVKA9Jrv36fnQ0/SqOdiDbTW0qQ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEq5KU6M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEq5KU6M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BBA1F000E9;
	Fri, 14 Aug 2026 18:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786731994;
	bh=CgfrDtYSv7XSiQrsZBc5JqmKYf95u/1czGarXlJCkhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JEq5KU6MMJBQlMCl5YG3XPNvkI397ajcdFHnneLMtZoi6TFgDkvbm6lN2rJNUDBdF
	 /RVB0B990cDS7UqjAt/RmPrYDYc18+PIV1TzRnPghaQoRZxQ3+XOmnlO0ddsx5k5uh
	 lZgsV5PNoakXZNf2u+e+foMImznsvWLkdq/gFEC+72yuohnaWjg6kknGdjt1z2DhMt
	 cHPugJtnfp4VjX28rqBnrbp/LGgUtNxY40lVD2JHZlkmjHcjHmKj5V4wAo8RCb9+RO
	 zL2ahAR6vF8yMnl9vPyWUASy1HqBNY/ML2wj/1Nl5u3m1Uztk5FsDTWAC88g0eTGSd
	 C0dd10UcZHl2g==
Date: Sat, 15 Aug 2026 02:26:27 +0800
From: Gao Xiang <xiang@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Gao Xiang <xiang@kernel.org>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	SJ Park <sj@kernel.org>, Gao Xiang <hsiangkao@linux.alibaba.com>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Chao Yu <chao@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3] erofs: cap LZMA stream pool size
Message-ID: <an9d0zxE5J8txxf6@XiangdeMacBook-Pro.local>
Mail-Followup-To: Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gao Xiang <xiang@kernel.org>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	SJ Park <sj@kernel.org>, Gao Xiang <hsiangkao@linux.alibaba.com>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Chao Yu <chao@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	linux-kbuild <linux-kbuild@vger.kernel.org>
References: <20260728065447.91511-1-sj@kernel.org>
 <CAMuHMdWq1eutRM4u1Q3r50f8W4oSejo_XAgyjEKuwi4Lw6K7jQ@mail.gmail.com>
 <anBYnPELPotUiNjv@monoceros>
 <CAMuHMdXUyAX0TV0Sq9_YxvipzkVOBX=4s_r5mVQcZ_7nL=-AQw@mail.gmail.com>
 <87853c96-cc8f-49e6-81b1-02bfe409e372@roeck-us.net>
 <CAJJ9bXyC=piPamaGJN=VMA72Ws+WqgJbYZgTj_w6NFzyLa_mMg@mail.gmail.com>
 <anuyFHLUGDjZWY4K@XiangdeMacBook-Pro.local>
 <CAMuHMdWQLwgShMK7G-6soiZxtRPYWLizBLRdouwxFUcFXUJM-Q@mail.gmail.com>
 <anxQ-DohuQvuKwAH@XiangdeMacBook-Pro.local>
 <5825b5c2-06b3-4358-91b0-d7bf437528a3@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5825b5c2-06b3-4358-91b0-d7bf437528a3@roeck-us.net>

Hi Guenter,

On Wed, Aug 12, 2026 at 07:25:50AM -0700, Guenter Roeck wrote:

...

> > > 
> > > Thank you, that seems to work (despite still seeing the warning on m68k,
> > > as NR_CPUS does not exist).
> > > 
> > 
> > ...
> > 
> > > 
> > >        $ make ARCH=m68k allmodconfig
> > >       fs/erofs/Kconfig:137:warning: range is invalid
> > > 
> > >   Warning...
> > > 
> > 
> > Yes, other arches shouldn't have the warning because I think other
> > arches (including microblaze) defines NR_CPUS in Kconfig, except m68k.
> > 
> 
> That is not entirely true. openrisc only has it if SMP=y. But it still
> does not generate the warning for some reason.
> 

I looked into the documentation a bit
(https://docs.kernel.org/kbuild/kconfig-language.html), especially the
following parts:

 - type definition: “bool”/”tristate”/”string”/”hex”/”int” ...
 - input prompt: “prompt” <prompt> [“if” <expr>] ...
     and "If a prompt is not present, the config option is
          a non-visible symbol, ..."

 - dependencies: “depends on” <expr> [“if” <expr>] ...
 - Menu dependencies ..

and I think that is true, taking openrisc for example:

config NR_CPUS
        int "Maximum number of CPUs (2-32)"
        range 2 32
        depends on SMP
        default "2"

which can be transformed into

config NR_CPUS
        int
	prompt "Maximum number of CPUs (2-32)"
	range 2 32
	depends on SMP
        default "2"

which can be then transformed into

config NR_CPUS
        int
	prompt "Maximum number of CPUs (2-32)" if SMP
	range 2 32 if SMP
        default "2" if SMP

so if `SMP=n`, it's equivalent to

config NR_CPUS
        int

so NR_CPUS symbol is still there I think (and its value is 0.)

Thanks,
Gao Xiang
